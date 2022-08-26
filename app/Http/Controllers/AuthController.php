<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class AuthController extends Controller
{
    public function login(Request $request)
    {
        $user = User::where("username", $request->username)
            ->where("password", $request->password)
            ->first();

        if (!$user) {
            return response()->json(["message" => "Неверные учетные данные"], 400);
        }

        if ($user->accessToken) {
            return response()->json(["message" => "Пользователь уже аутентифицирован"], 403);
        }

        $user->accessToken = bcrypt(Str::random());
        $user->save();

        return response()->json(["token" => $user->accessToken]);
    }

    public function logout(Request $request)
    {
        $user = User::getByToken($request->bearerToken());
        $user->accessToken = null;
        $user->save();

        return response()->json(["message" => "Успешный выход"]);
    }
}

