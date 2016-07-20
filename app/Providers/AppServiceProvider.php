<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Carbon;
use DB;


class AppServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        $weibostr  = DB::table('about')->select('content')->where('type',5)->first()->content;
        $weixinstr = DB::table('about')->select('content')->where('type',6)->first()->content;
        $weibo = preg_replace('/<p>(.*?)<\/p>/','\\1',$weibostr);
        $weixin = preg_replace('/<p>(.*?)<\/p>/','\\1',$weixinstr);
        view()->share('weibo', $weibo);
        view()->share('weixin', $weixin);
        Carbon\Carbon::setLocale('zh');
    }

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        $this->app->singleton('message', \App\commonApi\Messages\Messages::class);
    }
}
