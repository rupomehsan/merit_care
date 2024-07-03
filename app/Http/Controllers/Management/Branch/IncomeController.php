<?php

namespace App\Http\Controllers\Management\Branch;

use App\Http\Controllers\Controller;
use App\Models\Accounts\AccountCategory;
use App\Models\Accounts\AccountDetails;
use App\Models\Accounts\BranchAccount;
use App\Models\Accounts\BranchAccountLog;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class IncomeController extends Controller
{
    private function getBranchID() {
        $branch_admin = auth()->user()->load('branch_admin');

        return $branch_admin->branch_admin[0]->branch_details->id;
    }

    public function all()
    {
        $paginate = (int) request()->paginate;
        $orderBy = request()->orderBy;
        $orderByType = request()->orderByType;

        $query = BranchAccountLog::where('branch_id', $this->getBranchID())
        ->where('is_income', 1)
        ->orderBy($orderBy, $orderByType);

        if (request()->has('search_key')) {
            $key = request()->search_key;
            $query->where(function ($q) use ($key) {
                return $q->where('id', $key)
                    ->orWhere('type', $key)
                    ->orWhere('description', $key)
                    ->orWhere('amount', $key)
                    ->orWhere('type', 'LIKE', '%' . $key . '%')
                    ->orWhere('description', 'LIKE', '%' . $key . '%')
                    ->orWhere('amount', 'LIKE', '%' . $key . '%');
            });
        }

        $accounts = $query->with(['category', 'branch'])->paginate($paginate);
        return response()->json(['incomes' => $accounts], 200);
    }

    public function monthlyIncomeSheet($month) {
        $paginate = (int) request()->paginate;
        $orderBy = request()->orderBy;
        $orderByType = request()->orderByType;

        $query = BranchAccountLog::where('branch_id', $this->getBranchID())
        ->where('is_income', 1)
        ->orderBy($orderBy, $orderByType);

        if (request()->has('search_key')) {
            $key = request()->search_key;
            $query->where(function ($q) use ($key) {
                return $q->where('id', $key)
                    ->orWhere('type', $key)
                    ->orWhere('description', $key)
                    ->orWhere('amount', $key)
                    ->orWhere('type', 'LIKE', '%' . $key . '%')
                    ->orWhere('description', 'LIKE', '%' . $key . '%')
                    ->orWhere('amount', 'LIKE', '%' . $key . '%');
            });
        }

        $total_monthly_income = $query->whereMonth('created_at', $month)->sum('amount');
        $accounts = $query->with(['category', 'branch'])->whereMonth('created_at', $month)->paginate($paginate);
        return response()->json(['total_monthly_income' => $total_monthly_income, 'incomes' => $accounts], 200);
    }

    public function admin_incomes() : object {
        $paginate = (int) request()->paginate;
        $orderBy = request()->orderBy;
        $orderByType = request()->orderByType;

        $query = BranchAccountLog::where('is_income', 1)
        ->orderBy($orderBy, $orderByType);

        if (request()->has('search_key')) {
            $key = request()->search_key;
            $query->where(function ($q) use ($key) {
                return $q->where('id', $key)
                    ->orWhere('type', $key)
                    ->orWhere('description', $key)
                    ->orWhere('amount', $key)
                    ->orWhere('type', 'LIKE', '%' . $key . '%')
                    ->orWhere('description', 'LIKE', '%' . $key . '%')
                    ->orWhere('amount', 'LIKE', '%' . $key . '%');
            });
        }

        $accounts = $query->with(['category', 'branch'])->paginate($paginate);
        return response()->json($accounts);
    }

    public function admin_show($id) : object {
        $data = BranchAccountLog::where('id',$id)
        ->where('is_income', 1)
        ->with(['category', 'branch'])
        ->first();

        if(!$data){
            return response()->json([
                'err_message' => 'not found',
                'errors' => ['account'=>['data not found']],
            ], 422);
        }
        return response()->json($data,200);
    }

    public function show($id)
    {
        $data = BranchAccountLog::where('id',$id)
        ->where('is_income', 1)
        ->where('branch_id', $this->getBranchID())
        ->with('category')
        ->first();

        if(!$data){
            return response()->json([
                'err_message' => 'not found',
                'errors' => ['account'=>['data not found']],
            ], 422);
        }
        return response()->json($data,200);
    }

    public function store()
    {
        $validator = Validator::make(request()->all(), [
            'category' => ['required'],
            'amount' => ['required'],
            'description' => ['required'],
        ]);

        if ($validator->fails()) {
            return response()->json([
                'err_message' => 'validation error',
                'errors' => $validator->errors(),
            ], 422);
        }
        // $account_id = BranchAccount::where('title', 'cash')->where('branch_id', $this->getBranchID())->first();

        $data = new BranchAccountLog();
        $data->branch_id = $this->getBranchID();
        $data->account_category_id = request()->category;
        $data->date = Carbon::parse(request()->date)->toDateString();
        $data->account_id = request()->account_id;
        $data->amount = request()->amount;
        $data->type = "credit";
        $data->description = request()->description;
        $data->is_income = 1;
        $data->save();

        return response()->json($data,200);
    }

    public function bulk_import()
    {
        $validator = Validator::make(request()->all(), [
            'data' => ['required','array'],
        ]);

        if ($validator->fails()) {
            return response()->json([
                'err_message' => 'validation error',
                'errors' => $validator->errors(),
            ], 422);
        }

        foreach (request()->data as $key => $item) {
            // dd($item);
            $item['created_at'] = isset($item['created_at']) ? Carbon::parse($item['created_at']) : Carbon::now()->toDateTimeString();
            $item['updated_at'] = isset($item['updated_at']) ? Carbon::parse($item['updated_at']) : Carbon::now()->toDateTimeString();

            $item = (object) $item;

            // getting the account and account category by the name
            $check_account_name = BranchAccount::where('title', $item->account_name)->where('branch_id', $this->getBranchID())->first();
            $check_account_category = AccountCategory::where('title', $item->account_category_name)->first();

            // checking the account name
            if(!$check_account_name) {
                return response()->json([
                    'err_message' => 'validation error',
                    'error' => 'No account found by the name ' . $item->account_name,
                ], 400);
            }


            // checking the account category name
            if(!$check_account_category) {
                return response()->json([
                    'err_message' => 'validation error',
                    'error' => 'No account category found by the name ' . $item->account_category_name,
                ], 400);
            }

            // unsetting the unnecessary keys before inserting to db
            unset($item->account_category_name);
            unset($item->account_name);

            $item->account_id = $check_account_name->id;
            $item->branch_id = $this->getBranchID();
            $item->account_category_id = $check_account_category->id;
            $item->date = Carbon::parse($item->date)->toDateString();
            try {
                BranchAccountLog::create((array) $item);
            } catch (\Throwable $th) {
                return response()->json([
                    'err_message' => 'validation error',
                    'errors' => $th->getMessage(),
                ], 400);
            }

        }

        return response()->json('success', 200);
    }
}
