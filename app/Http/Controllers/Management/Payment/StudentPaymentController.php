<?php

namespace App\Http\Controllers\Management\Payment;

use App\Http\Controllers\Controller;
use App\Models\Institute\InstituteStudent;
use App\Models\Institute\InstituteStudentPayment;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class StudentPaymentController extends Controller
{
    public function all()
    {

        $paginate = (int) request()->paginate;
        $orderBy = request()->orderBy;
        $orderByType = request()->orderByType;

        $status = 1;
        if (request()->has('status')) {
            $status = request()->status;
        }

        $query = InstituteStudentPayment::orderBy($orderBy, $orderByType);

        if (request()->has('search_key')) {
            $key = request()->search_key;
            $query->where(function ($q) use ($key) {
                return $q->where('id', $key)
                    ->orWhere('user_id', $key)
                    ->orWhere('amount', 'LIKE', '%' . $key . '%')
                    ->orWhere('date', 'LIKE', '%' . $key . '%');
            });
        }

        if (request()->has('status')) {
            $query->where('status', $status);
        }

        $InstituteStudentPayments = $query->paginate($paginate);
        return response()->json($InstituteStudentPayments);
    }

    public function calc_dues($user_id = null)
    {
        $student = InstituteStudent::where('user_id', $user_id)->first();
        $now = Carbon::now();
        $from = Carbon::parse($student->fee_start_from);
        $month_count = $from->diffInMonths($now);

        $total_paid = $calc_total_paid = InstituteStudentPayment::where('user_id', $user_id)->sum('amount');
        $per_month_bill = $student->monthly_fee;
        $total_bill = $month_count * $per_month_bill;

        $payment_history = [];
        $paid_months = [];
        $due_months = [];

        for ($i = $month_count - 1; $i >= 0; $i--) {
            $month_no = Carbon::now()->subMonths($i);
            $paid = InstituteStudentPayment::where('user_id', $user_id)
                ->whereMonth('date', $month_no->clone()->month)
                ->whereYear('date', $month_no->clone()->year)->sum('amount');

            if ($paid) {
                $payment_history[] = [
                    "month" => $month_no->format('M Y'),
                    "paid" => $paid ?? 0,
                ];
            }
            if ($calc_total_paid > 0 && $calc_total_paid >= $per_month_bill) {
                $paid_months[] = [
                    "user_id" => $user_id,
                    "month" => $month_no->format('M Y'),
                    "paid" => $per_month_bill,
                ];
                $calc_total_paid = $calc_total_paid - $per_month_bill;
            } else if ($calc_total_paid < $per_month_bill && $calc_total_paid != 0) {
                $paid_months[] = [
                    "user_id" => $user_id,
                    "month" => $month_no->format('M Y'),
                    "paid" => $calc_total_paid,
                ];
                $calc_total_paid = 0;
            } else {
                $due_months[] = [
                    "user_id" => $user_id,
                    "month" => $month_no->format('M Y'),
                    "paid" => 0,
                ];
            }
        }

        $data = [
            "payment_history" => $payment_history,
            "paid_months" => $paid_months,
            "due_months" => $due_months,
            "paid" => $total_paid,
            "due" => max($total_bill - $total_paid, 0),
            "advanced" => max($total_paid - $total_bill, 0),
            "total_bill" => $total_bill,
            "monthly_fee" => $per_month_bill,
        ];

        return $data;
    }

    public function user_dues()
    {
        $validator = Validator::make(request()->all(), [
            'user_id' => ['required'],
        ]);

        if ($validator->fails()) {
            return response()->json([
                'err_message' => 'validation error',
                'errors' => $validator->errors(),
            ], 422);
        }

        $user_id = request()->user_id;
        $data = $this->calc_dues($user_id);

        return response()->json($data);
    }

    public function show($id)
    {
        $data = InstituteStudentPayment::where('id', $id)->first();
        if (!$data) {
            return response()->json([
                'err_message' => 'not found',
                'errors' => ['role' => ['data not found']],
            ], 422);
        }
        return response()->json($data, 200);
    }

    public function store()
    {
        $validator = Validator::make(request()->all(), [
            'user_id' => ['required'],
            'amount' => ['required'],
            'date' => ['required'],
        ]);

        if ($validator->fails()) {
            return response()->json([
                'err_message' => 'validation error',
                'errors' => $validator->errors(),
            ], 422);
        }

        $data = new InstituteStudentPayment();
        $data->user_id = request()->user_id;
        $data->amount = request()->amount;
        $data->date = Carbon::parse(request()->date)->toDateString();
        // $data->for_month = Carbon::parse(request()->for_month)->toDateString();
        $data->institute_student_id = request()->institute_student_id;
        $data->save();

        return response()->json($data, 200);
    }

    public function canvas_store()
    {
        $validator = Validator::make(request()->all(), [
            'user_id' => ['required'],
            'amount' => ['required'],
        ]);

        if ($validator->fails()) {
            return response()->json([
                'err_message' => 'validation error',
                'errors' => $validator->errors(),
            ], 422);
        }

        $data = new InstituteStudentPayment();
        $data->user_id = request()->user_id;
        $data->amount = request()->amount;
        $data->date = Carbon::now()->toDateString();
        $data->institute_student_id = request()->institute_student_id;
        $data->save();

        return response()->json($data, 200);
    }

    public function update()
    {
        $data = InstituteStudentPayment::find(request()->id);
        if (!$data) {
            return response()->json([
                'err_message' => 'validation error',
                'errors' => ['name' => ['InstituteStudentPayment not found by given id ' . (request()->id ? request()->id : 'null')]],
            ], 422);
        }

        $validator = Validator::make(request()->all(), [
            'user_id' => ['required'],
            'amount' => ['required'],
        ]);

        if ($validator->fails()) {
            return response()->json([
                'err_message' => 'validation error',
                'errors' => $validator->errors(),
            ], 422);
        }

        $data->user_id = request()->user_id;
        $data->amount = request()->amount;
        $data->date = Carbon::now()->toDateString();
        $data->institute_student_id = request()->institute_student_id;
        $data->save();

        return response()->json($data, 200);
    }

    public function canvas_update()
    {
        $data = InstituteStudentPayment::find(request()->id);
        if (!$data) {
            return response()->json([
                'err_message' => 'validation error',
                'errors' => ['name' => ['InstituteStudentPayment not found by given id ' . (request()->id ? request()->id : 'null')]],
            ], 422);
        }

        $validator = Validator::make(request()->all(), [
            'user_id' => ['required'],
            'amount' => ['required'],
        ]);

        if ($validator->fails()) {
            return response()->json([
                'err_message' => 'validation error',
                'errors' => $validator->errors(),
            ], 422);
        }

        $data->user_id = request()->user_id;
        $data->amount = request()->amount;
        $data->date = Carbon::now()->toDateString();
        $data->institute_student_id = request()->institute_student_id;
        $data->save();

        return response()->json($data, 200);
    }

    public function destroy()
    {
        $validator = Validator::make(request()->all(), [
            'id' => ['required', 'exists:institute_student_payments,id'],
        ]);

        if ($validator->fails()) {
            return response()->json([
                'err_message' => 'validation error',
                'errors' => $validator->errors(),
            ], 422);
        }

        $data = InstituteStudentPayment::where('id', request()->id)->delete();

        return response()->json([
            'result' => 'deleted',
        ], 200);
    }

    public function soft_delete()
    {
        $validator = Validator::make(request()->all(), [
            'id' => ['required', 'exists:institute_teachers,id'],
        ]);

        if ($validator->fails()) {
            return response()->json([
                'err_message' => 'validation error',
                'errors' => $validator->errors(),
            ], 422);
        }

        $data = InstituteStudentPayment::find(request()->id);
        $data->status = 0;
        $data->save();

        return response()->json([
            'result' => 'deactivated',
        ], 200);
    }

    public function restore()
    {
        $validator = Validator::make(request()->all(), [
            'id' => ['required', 'exists:institute_teachers,id'],
        ]);

        if ($validator->fails()) {
            return response()->json([
                'err_message' => 'validation error',
                'errors' => $validator->errors(),
            ], 422);
        }

        $data = InstituteStudentPayment::find(request()->id);
        $data->status = 1;
        $data->save();

        return response()->json([
            'result' => 'activated',
        ], 200);
    }

    public function bulk_import()
    {
        $validator = Validator::make(request()->all(), [
            'data' => ['required', 'array'],
        ]);

        if ($validator->fails()) {
            return response()->json([
                'err_message' => 'validation error',
                'errors' => $validator->errors(),
            ], 422);
        }

        foreach (request()->data as $item) {
            $item['created_at'] = $item['created_at'] ? Carbon::parse($item['created_at']) : Carbon::now()->toDateTimeString();
            $item['updated_at'] = $item['updated_at'] ? Carbon::parse($item['updated_at']) : Carbon::now()->toDateTimeString();
            $item = (object) $item;
            $check = InstituteStudentPayment::where('id', $item->id)->first();
            if (!$check) {
                try {
                    InstituteStudentPayment::create((array) $item);
                } catch (\Throwable $th) {
                    return response()->json([
                        'err_message' => 'validation error',
                        'errors' => $th->getMessage(),
                    ], 400);
                }
            }
        }

        return response()->json('success', 200);
    }
}
