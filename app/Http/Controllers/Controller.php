<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use DB;
use Auth;
use Log;

abstract class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    protected function OperationLog($action, $isLogin = 1)
    {
        try {
            $tableName = 'operation'.date('_m', time());
            $data = [
                'username' => '',
                'type' => $isLogin,
                'action' => $action,
                'client_ip' => $_SERVER['REMOTE_ADDR'],
                'create_at' => time()
            ];
            DB::table($tableName) -> insert($data);
        } catch (\Exception $e) {
//            Log::info(Auth::user() -> username .' 操作 '. $action .' 失败。 原因：'. $e -> getMessage());
        }
    }
}
