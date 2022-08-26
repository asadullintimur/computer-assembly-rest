<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreMachineRequest extends FormRequest
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
            "name" => ["required"],
            "description" => ["required"],
            "imageUrl" => ["required"],
            "motherboardId" => ["required", "numeric"],
            "powerSupplyId" => ["required", "numeric"],
            "processorId" => ["required", "numeric"],
            "ramMemoryId" => ["required", "numeric"],
            "ramMemoryAmount" => ["required", "numeric"],
            "storageDevices.*.storageDeviceId" => ["required", "numeric"],
            "storageDevices.*.amount" => ["required", "numeric"],
            "graphicCardId" => ["required", "numeric"],
            "graphicCardAmount" => ["required", "numeric"],
        ];
    }
}
