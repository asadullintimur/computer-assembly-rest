<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdateMachineRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            "motherboardId" => ["numeric"],
            "powerSupplyId" => ["numeric"],
            "processorId" => ["numeric"],
            "ramMemoryId" => ["numeric"],
            "ramMemoryAmount" => ["numeric"],
            "storageDevices.*.storageDeviceId" => ["numeric"],
            "storageDevices.*.amount" => ["numeric"],
            "graphicCardId" => ["numeric"],
            "graphicCardAmount" => ["numeric"],
        ];
    }
}
