<?php

namespace App\Http\Middleware;

use Illuminate\Foundation\Http\Middleware\VerifyCsrfToken as BaseVerifier;

class VerifyCsrfToken extends BaseVerifier
{
    /**
     * The URIs that should be excluded from CSRF verification.
     *
     * @var array
     */
    protected $except = [
        '/lessonComment/wxPayCallback',
        '/lessonComment/alipayAsyncCallback',
        '/lessonComment/alipaySyncCallback',
        '/index/editHeadImg',                  //移动端头像编辑
		'/lessonSubject/wxPayCallback',
		'/lessonSubject/alipayAsyncCallback',
		'/lessonSubject/alipaySyncCallback',
		'/admin/order/alipayAsyncCallback',
		'/index/getMessages',                  //移动端短信验证
//		'/admin/order/alipaySyncCallback',
    ];
}
