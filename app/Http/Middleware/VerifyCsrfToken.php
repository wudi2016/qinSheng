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
        '/index/editHeadImg',
		'/lessonSubject/wxPayCallback',
		'/lessonSubject/alipayAsyncCallback',
		'/lessonSubject/alipaySyncCallback',
    ];
}
