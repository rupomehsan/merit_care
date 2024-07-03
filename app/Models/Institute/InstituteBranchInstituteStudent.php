<?php

namespace App\Models\Institute;

use App\Models\Asset\BranchAsset;
use App\Models\BranchAdmin;
use App\Models\CRM\CrmSmsTemplate;
use App\Models\CRM\Customers;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class InstituteBranchInstituteStudent extends Model
{
    use HasFactory;
    protected $table = "institute_branch_institute_student";

}
