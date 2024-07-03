<?php

namespace App\Models\Institute;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class InstituteBranchContacts extends Model
{
    use HasFactory;

    public function branch() {
        return $this->hasOne(InstituteBranch::class, 'id', 'intstitue_branch_id');
    }
}
