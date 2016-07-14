<?php

namespace App\Http\Controllers\Home\lessonComment;

trait Gadget {

	public $number = 6;

    public function getSkip($page, $number) 
    {
        return ($page - 1) * $number;
    }

    public function returnResult($result)
    {
        if ($result) {
            return Response() -> json(["type" => true, "data" => $result]);
        } else {
            return Response() -> json(["type" => false]); 
        }
    }

}