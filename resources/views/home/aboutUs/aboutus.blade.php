@extends('layouts.layoutHome')

@section('title', '关于我们')

@section('css')
    <link rel="stylesheet" type="text/css" href="{{asset('home/css/aboutus/aboutus.css') }}">
@endsection

@section('content')


    <div class="background" ms-controller="aboutus" >


        <div style="height:30px"></div>

        <div class="main">

            <!-- 左侧链接 -->
            <div class="main_left">

               
                    <div class="us1 us intro"   ms-click="tabs(1);">公司介绍</div>
               
                    <div class="us2 us" ms-click="tabs(2);">联系我们</div>
                
                    <div class="us3 us" ms-click="tabs(3);">常见问题</div>
              
                    <div class="us4 us" ms-click="tabs(4);">用户协议</div>
          
                    <div  class="us5 us" ms-click="tabs(5);">友情链接</div>
        
                    <div  class="us6 us" ms-click="tabs(6);">意见反馈</div>
       
            </div>

            <!-- 右侧内容 -->
            <div class="main_right" ms-visible="isshowbox">


                <div class="main_right_content" ms-visible="currentIndex==1" ms-repeat="aboutus1" >
                    <!-- 公司介绍 -->
                    <div class="main_right_content_name" ms-html="el.title" >

                    </div>
                    <div style="height:32px"></div>
                    <!-- 图片 -->
                    <div class="main_right_content_img">
                        <img src="{{asset('home/image/aboutus/gangqin.png')}}" alt="" />
                    </div>
                    <div style="height:63px"></div>
                    <div class="main_right_content_intro"  ms-html="el.content" >

                    </div>
                </div>



                <div class="main_right_content"  ms-visible="currentIndex==2" ms-repeat="aboutus2"  >

                    <div class="main_right_content_name"  ms-html="el.title"  >

                    </div>
                    <div style="height:32px"></div>
                    <!-- 图片 -->
                    <div class="main_right_content_img">
                        <img src="{{asset('home/image/aboutus/gangqin.png')}}" alt="" />
                    </div>
                    <div style="height:63px"></div>
                    <div class="main_right_content_intro" ms-html="el.content"  >

                    </div>
                </div>




                <div class="main_right_content"   ms-visible="currentIndex==3" ms-repeat="aboutus3" >

                    <div class="main_right_content_name" ms-html="el.title" >

                    </div>
                    <div style="height:32px"></div>
                    <!-- 图片 -->
                    <div class="main_right_content_img">
                        <img src="{{asset('home/image/aboutus/gangqin.png')}}" alt="" />
                    </div>
                    <div style="height:63px"></div>
                    <div class="main_right_content_intro"  ms-html="el.content"  >

                    </div>
                </div>


                <div class="main_right_content"   ms-visible="currentIndex==4" ms-repeat="aboutus4" >

                    <div class="main_right_content_name" ms-html="el.title" >

                    </div>
                    <div style="height:32px"></div>
                    <!-- 图片 -->
                    <div class="main_right_content_img">
                        <img src="{{asset('home/image/aboutus/gangqin.png')}}" alt="" />
                    </div>
                    <div style="height:63px"></div>
                    <div class="main_right_content_intro"  ms-html="el.content"  >

                    </div>
                </div>


                {{--友情链接--}}
                <div class="main_right_content"   ms-visible="currentIndex==5"  >

                    <div class="main_right_content_name"  >
                        友情链接
                    </div>
                    <div style="height:32px"></div>
                    <!-- 图片 -->
                    <div class="main_right_content_img"  >
                        <img src="{{asset('home/image/aboutus/gangqin.png')}}" alt="" />
                    </div>
                    <div style="height:63px"></div>
                    <div class="friendship_link"  ms-repeat="aboutus5"  >
                        <a ms-attr-href="linkurl + el.url" ms-html="el.title" ></a> <a  class="a_two" ms-attr-href="linkurl + el.url"   ms-html="el.url" ></a>
                    </div>
                </div>


                {{--反馈--}}
                <div class="main_right_content"   ms-visible="currentIndex==6" ms-repeat="aboutus6" >

                    <div class="main_right_content_name" ms-html="el.title" >

                    </div>
                    <div style="height:32px"></div>
                    <!-- 图片 -->
                    <div class="main_right_content_img">
                        <img src="{{asset('home/image/aboutus/gangqin.png')}}" alt="" />
                    </div>
                    <div style="height:63px"></div>
                    <div class="main_right_content_intro"  ms-html="el.content"  >

                    </div>
                </div>













            </div>

        </div>



    </div>






@endsection

@section('js')

  <script>
        require(['/aboutus/firmintro'], function () {

            avalon.scan();
        });
  </script>


@endsection


