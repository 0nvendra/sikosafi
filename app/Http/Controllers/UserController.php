<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Inertia\Inertia;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Str;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    private $name = 'Users';
    public function index(Request $request)
    {
        return Inertia::render('user/index', [
            'users' => User::when($request->nik, function ($query, $q) {
                $query->where('nik', 'like', '%' . $q . '%');
            })
                ->orderByDesc("id")
                ->paginate(10)
                ->withQueryString(),
            'name' => $this->name
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return Inertia::render('user/create', [
            'name' => $this->name,
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        try {
            DB::beginTransaction();
            $rules = [
                'nama' => ['required'],
                'email' => ['required', 'unique:users', 'max:50'],
                'telp' => ['required'],
                'nik' => ['required', 'unique:users'],
                'dob' => ['required'],
                'status' => ['required'],
                'password' => ['required', 'string', 'min:8', 'confirmed'],
            ];

            $messages = [
                // 'required' => 'Please fill :attribute',
            ];

            $attributes = [
                'nama' => 'Nama',
                'email' => 'Email',
                'telp' => 'No Whatsapp',
                'nik' => 'NIK',
                'dob' => 'TANGGAL LAHIR',
            ];

            $validator = Validator::make($request->all(), $rules, $messages, $attributes)->validate();
            $validator['password'] = bcrypt($validator['password']);
            User::create($validator);
            DB::commit();
            return redirect()->route('user.index');
        } catch (\Throwable $th) {
            DB::rollBack();
            throw $th;
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
        return Inertia::render('user/show', [
            'name' => $this->name,
            'user' => User::find($id),
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        return Inertia::render('user/edit', [
            'name' => $this->name,
            'user' => User::find($id),
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        try {
            DB::beginTransaction();
            $rules = [
                'nama' => ['required'],
                'email' => ['required', 'max:50'],
                'nik' => ['required'],
                'dob' => ['required'],
                'status' => ['required'],
            ];
            if (isset($request->password)) {
                $rules = [
                    'nama' => ['required'],
                    'email' => ['required', 'max:50'],
                    'nik' => ['required'],
                    'dob' => ['required'],
                    'status' => ['required'],
                    'password' => ['string', 'min:8', 'confirmed'],
                ];
            }

            $messages = [
                // 'required' => 'Please fill :attribute',
            ];

            $attributes = [
                'nama' => 'Nama',
                'email' => 'Email',
                'nik' => 'NIK',
                'dob' => 'TANGGAL LAHIR',
            ];

            $validator = Validator::make($request->all(), $rules, $messages, $attributes)->validate();
            User::find($id)->update($validator);
            DB::commit();
            return redirect()->route('user.index');
        } catch (\Throwable $th) {
            DB::rollBack();
            throw $th;
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        try {
            DB::beginTransaction();
            User::find($id)->delete();
            DB::commit();
            return redirect()->route('user.index');
        } catch (\Throwable $th) {
            DB::rollBack();
            throw $th;
        }
    }

    public function getLogin()
    {
        return Inertia::render('Auth/UserLogin', [
            'canResetPassword' => Route::has('password.request'),
            'status' => session('status'),
        ]);
    }

    public function postLogin(Request $request)
    {
        // user login
        $credentials = [
            'email' => $request['email'],
            'password' => $request['password'],
        ];
        if (Auth::guard('web')->attempt($credentials)) {
            // if (Auth::user()->status != 2) {
            //     Auth::guard('web')->logout();
            //     return response()->json('Harap verifikasi Email', 302);
            // }
            return redirect('/');
        } else {
            return redirect()->route('login');
        }

        // if (auth()->guard('web')->attempt($request->only('email', 'password'))) {
        //     $request->session()->regenerate();
        //     // $this->clearLoginAttempts($request);
        //     return redirect()->intended();
        // } else {
        //     return 'login gagal';
        //     // $this->incrementLoginAttempts($request);

        //     // return redirect()
        //     //     ->back()
        //     //     ->withInput()
        //     //     ->withErrors(["Incorrect user login details!"]);
        // }
    }

    public function logout(Request $request)
    {
        Auth::guard('web')->logout();

        $request->session()->invalidate();

        $request->session()->regenerateToken();

        return redirect('/');
    }

    public function getRegister()
    {
        return Inertia::render('Auth/UserRegister');
    }

    public function postRegister(Request $request)
    {
        try {
            DB::beginTransaction();
            $image_path = '';
            if ($request->hasFile('image')) {
                $image_path = $request->file('image')->store('image', 'public');
                $image_path = "/storage/" . $image_path;
            }
            $rules = [
                'nama' => ['required'],
                'email' => ['required', 'unique:users', 'max:50'],
                'nik' => ['required', 'unique:users'],
                'dob' => ['required'],
                'status' => ['required'],
                'password' => ['required', 'string', 'min:8', 'confirmed'],
                'ktp_img' => [],

            ];

            $messages = [
                // 'required' => 'Please fill :attribute',
            ];

            $attributes = [
                'nama' => 'Nama',
                'email' => 'Email',
                'nik' => 'NIK',
                'dob' => 'TANGGAL LAHIR',
                'ktp_img' => 'FOTO KTP',
            ];
            $request['ktp_img'] = $image_path;
            $request['status'] = 1;
            $request['remember_token'] = Str::Uuid();
            $validator = Validator::make($request->all(), $rules, $messages, $attributes)->validate();
            $validator['password'] = bcrypt($validator['password']);
            User::create($validator);
            DB::commit();
            return redirect('/');
        } catch (\Throwable $th) {
            DB::rollBack();
            throw $th;
        }
    }

    public function evaluasi()
    {
        return 'a';
    }

    public function verifikasi_email($remember_token)
    {
        $user = User::where('remember_token', $remember_token)->first();
        $user->status = 2;
        $user->save();
        // return 'berhasil verifikasi';
        return redirect('/');
    }
}
