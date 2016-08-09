<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Carbon;
use DB;
use Illuminate\Support\Facades\Auth;

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
        $weibo  = preg_replace('/<p>(.*?)<\/p>/','\\1',$weibostr);
        $weixin = preg_replace('/<p>(.*?)<\/p>/','\\1',$weixinstr);
        view()->share('weibo', $weibo);
        view()->share('weixin', $weixin);
        view()->composer('layouts.layoutHome',function($view){
            if(Auth::check() && Auth::user()->type != 3){
                $username = Auth::user()->username;
                $Msg = DB::table('usermessage')->select('id')->where('username',$username)->where('isRead',0)->first();
                if(Auth::user()->type == 2){
                    $Msg = DB::table('usermessage')->select('id')->where('username',$username)->where('isRead',0)->where('type','<>',5)->where('type','<>',6)->first();
                }
            }else{
                $Msg = false;
            }
            $view->with('Msg',$Msg);
        });
        
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
