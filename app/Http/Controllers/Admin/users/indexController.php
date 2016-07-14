<?php
namespace App\Http\Controllers\Admin\users;

use App\User;
use Carbon\Carbon;
use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Validator;

class indexController extends Controller
{
    //用户列表
    public function index(Request $request)
    {
        //定义搜索初值
        $search = [];
        //搜索
        $query = DB::table('users as u')
                ->leftJoin('users as us','u.fromyaoqingma','=','us.yaoqingma');
        if($request->type == 0){
            $query = $query->where('u.username','like','%'.trim($request->search).'%');
            $search['type'] = 0;
        }
        if($request->type == 1){
            $query = $query->where('u.realname','like','%'.trim($request->search).'%');
            $search['type'] = 1;
        }
        if($request->type == 2){
            $query = $query->where('u.phone','like','%'.trim($request->search).'%');
            $search['type'] = 2;
        }
        if($request->type == 3){
            $query = $query->where('u.type','=',0);
            $search['type'] = 3;
        }
        if($request->type == 4){
            $query = $query->where('u.type','=',1);
            $search['type'] = 4;
        }
        if($request->type == 5){
            $query = $query->where('u.type','=',2);
            $search['type'] = 5;

        }
        if($request->type == 6){
            if($request->beginTime){
                $query = $query->where('u.created_at','>=',trim($request->beginTime));
            }

            if($request->endTime){
                $query = $query->where('u.created_at','<=',trim($request->endTime));
            }
            $search['type'] = 6;
        }

        if($request->type == 7){
            $query = $query;
            $search['type'] = 7;
        }
        //导出数据处理
        $excels = $query->select('u.id','u.username','u.checks','u.phone','u.type','us.id as userId','us.username as name','u.created_at','u.updated_at')
            ->where('u.type','<>',2)
            ->get();
        $excels = json_encode($excels);
        //列表页展示数据
        $data = $query->select('u.id','u.username','u.checks','u.phone','u.type','u.pic','us.id as userId','us.username as name','u.created_at','u.updated_at')
            ->where('u.type','<>',2)->orderBy('id','desc')
            ->paginate();
        return view('admin.users.userList',compact('data','search','excels'));
    }

    //省市联动
    public function province(Request $request)
    {
        $city = DB::table('city')->where(['status'=>0,'provincecode'=>$request->code])->get();
        if($city){
            return Response()->json(['status'=>true,'city'=>$city]);
        }else{
            return Response()->json(['status'=>false]);
        }
    }

    //检查唯一性接口
    public function unique(Request $request,$table,$column)
    {
        $data = DB::table($table)->where([$column=>$request->$column])->first();
        if($data){
            return Response()->json(['status'=>true]);
        }else{
            return Response()->json(['status'=>false]);
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //省市数据，加载至模板
        $province = DB::table('province')->get();
        return view('admin.users.addUser',compact('province'));
    }

    public function insert(Request $request)
    {
        $data = $request->except('_token');
        //调用验证
        $validate = $this->validator($data);
        //验证信息
        if($validate->fails()){
            return Redirect() -> back() -> withInput( $request -> all() ) -> withErrors( $validate );
        }
        //加密
        $data['password'] = bcrypt($data['password']);
        $data['checks'] = 0;
        $data['pic'] || $data['pic'] = '/home/image/layout/default.png';
        $data['created_at'] = Carbon::now();
        $data['updated_at'] = Carbon::now();
        //生成邀请码
        $yaoqingma = '';
        $randomNum     = ['0','1','2','3','4','5','6','7','8','9'];
        $randomLowcase = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'];
        $randomUpcase  = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
        $randomarr     = array_merge($randomNum,$randomLowcase,$randomUpcase);
        $keyarr        = array_rand($randomarr,6);

        for ($i=0;$i<6;$i++){
            $yaoqingma .= $randomarr[$keyarr[$i]];
        }
        $data['yaoqingma'] = $yaoqingma;


        if(User::create($data)){
            return redirect('admin/message')->with(['status'=>'添加用户成功','redirect'=>'users/userList']);
        }else{
            return redirect('admin/message')->with(['status'=>'添加用户失败','redirect'=>'users/userList']);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //查询个人信息
        $data = User::findOrFail($id);
        //省份
        $data->provinceId ? $data->province = DB::table('province')->select('name')->where('code','=',$data->provinceId)->first() : $data->province = '';
        //市区
        $data->cityId ? $data->city = DB::table('city')->select('name as cityName')->where(['code'=>$data->cityId])->first() : $data->cityId = '';
        if($data->type == 2){
            $teachers = DB::table('teacher')->where('parentId',$id)->first();
            if($teachers){
                $data->intro = $teachers->intro;
            }else{
                $data->intro = '';
            }

        }
        return view('admin.users.showUser',compact('data'));
    }

    /**
     * 管理员信息
     *
     * @return \Illuminate\Http\Response
     */
    public function personDetail()
    {
        return view('admin.users.personDetail');
    }


    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //修改数据
        $data = User::findOrFail($id);
        $data->pic || $data->pic = '/home/image/layout/default.png';
        //省份
        $data->province = DB::table('province')->get();
        //市区
        $data->city = DB::table('city')->where(['status'=>0,'provincecode'=>$data->provinceId])->get();
        return view('admin.users.editUser',compact('data'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request,$id)
    {
        $input = $request->except('_token');
        $validate = $this->validator($input);
        //验证信息
        if($validate->fails()){
            return Redirect() -> back() -> withInput( $request -> all() ) -> withErrors( $validate );
        }
        //头像为空，去除
        if(!$input['pic']){
            unset($input['pic']);
        }

        if(FALSE !== DB::table('users')->where(['id'=>$id])->update($input)){
            return redirect('admin/message')->with(['status'=>'修改用户信息成功','redirect'=>'users/userList']);
        }else{
            return redirect('admin/message')->with(['status'=>'修改用户信息失败','redirect'=>'users/userList']);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function delete($id)
    {
        //删除用户
        if(DB::table('users')->delete($id)){
            if($rec = DB::table('teacher')->where('parentId',$id)->first()){
                //名师表存在即可删除
                DB::table('teacher')->where('id',$rec->id)->delete();
                if(DB::table('hotteacher')->where('teacherId',$rec->id)->first()){
                    //推荐名师存在，即可删除
                    DB::table('hotteacher')->where('teacherId',$rec->id)->delete();
                }
            }
            return redirect('admin/message')->with(['status'=>'删除用户成功','redirect'=>'users/userList']);
        }else{
            return redirect('admin/message')->with(['status'=>'删除用户失败','redirect'=>'users/userList']);
        }
    }

    public function resetPass($id)
    {
        if($input = \Input::all()){
            //首先判断管理员密码，正确向下执行，否则报错，在页面显示错误信息
            if(\Hash::check($input['managerPass'],\Auth::user()->password)){
                //如果有数据，执行重置动作
                $rules = ['password' => 'required|min:6|max:16|confirmed',];
                $messages = ['password.required' => '请输入密码', 'password.min' => '密码最少6位', 'password.max' => '密码最多16位', 'password.confirmed' => '新密码和确认密码不一致',];
                $validate = Validator::make($input,$rules,$messages);
                if($validate->fails()){
                    return Redirect::back()->withErrors($validate);
                }else{
                    //输入信息正确
                    if(User::where('id','=',$id)->update(['password'=>$input['password']])){
                        return redirect('admin/message')->with(['status'=>'重置密码成功','redirect'=>'users/userList']);
                    }else{
                        return redirect('admin/message')->with(['status'=>'重置密码失败','redirect'=>'users/userList']);
                    }
                }
            }else if(!$input['managerPass']){
                return Redirect::back()->withErrors(['errors'=>'管理员密码不能为空']);
            }else{
                return Redirect::back()->withErrors(['errors'=>'管理员密码不正确']);
            }

        }else{
            //如果没数据，显示重置密码页面
            $data = User::findOrFail($id);
            return view('admin.users.resetPass',compact('data'));
        }
    }


    //更改用户状态
    public function changeStatus(Request $request)
    {
        $data = $request->except('_token');
        if(User::where('id','=',$data['id'])->update(['checks'=>$data['checks']])){
            return response()->json(['status'=>true,'msg'=> $data['checks'] == 0 ? '激活' : '<span style="color:red">禁用</span>']);
        }else{
            return response()->json(['status'=>false,'msg'=>'修改失败！']);
        }
    }

    /**
     * verify the specified resource from storage.
     *
     */
    protected function validator(array $data)
    {
        $rules = [
            'username' => 'required|min:4|max:16',
            'realname' => 'required',
            'password' => 'sometimes|required|min:6|max:16',
            'phone' => 'required|digits:11',
            'sex' => 'required',
        ];

        $messages = [
            'username.required' => '请输入用户名',
            'username.min' => '用户名最少4位',
            'username.max' => '用户名最多16位',
            'realname.required' => '请输入姓名',
            'password.required' => '请输入密码',
            'password.min' => '密码最少6位',
            'password.max' => '密码最多16位',
            'phone.required' => '请输入手机号',
            'phone.digits' => '手机号为11位数字',
            'sex.required' => '性别不能为空',
        ];

        return \Validator::make($data, $rules, $messages);
    }
}