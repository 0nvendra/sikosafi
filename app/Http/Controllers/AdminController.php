<?php

namespace App\Http\Controllers;

use App\Http\Requests\Auth\LoginRequest;
use App\Models\Admin;
use App\Providers\RouteServiceProvider;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Inertia\Inertia;

class AdminController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    private $name = 'Admin';
    public function index(Request $request)
    {
        return Inertia::render('admin/index', [
            'admins' => Admin::when($request->email, function ($query, $q) {
                $query->where('email', 'like', '%' . $q . '%');
            })
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
        return Inertia::render('admin/create', [
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
                'email' => ['required', 'unique:admins', 'max:50'],
                'password' => ['required', 'string', 'min:8', 'confirmed'],
            ];

            $messages = [
                // 'required' => 'Please fill :attribute',
            ];

            $attributes = [
                'nama' => 'Nama',
                'email' => 'Email',
            ];

            $validator = Validator::make($request->all(), $rules, $messages, $attributes)->validate();
            $validator['password'] = bcrypt($validator['password']);
            Admin::create($validator);
            DB::commit();
            return redirect()->route('admin.index');
        } catch (\Throwable $th) {
            DB::rollBack();
            throw $th;
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Admin  $admin
     * @return \Illuminate\Http\Response
     */
    public function show(Admin $admin)
    {
        return Inertia::render('admin/show', [
            'name' => $this->name,
            'admin' => $admin,
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Admin  $admin
     * @return \Illuminate\Http\Response
     */
    public function edit(Admin $admin)
    {
        return Inertia::render('admin/edit', [
            'name' => $this->name,
            'admin' => $admin,
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Admin  $admin
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Admin $admin)
    {
        try {
            DB::beginTransaction();
            $rules = [
                'nama' => ['required'],
                'email' => ['required', 'max:50'],
            ];
            if (isset($request->password)) {
                $rules = [
                    'nama' => ['required'],
                    'email' => ['required', 'max:50'],
                    'password' => ['min:8', 'confirmed']
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
            $validator['password'] = bcrypt($validator['password']);
            $admin->update($validator);
            DB::commit();
            return redirect()->route('admin.index');
        } catch (\Throwable $th) {
            DB::rollBack();
            throw $th;
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Admin  $admin
     * @return \Illuminate\Http\Response
     */
    public function destroy(Admin $admin)
    {
        try {
            DB::beginTransaction();
            $admin->delete();
            DB::commit();
            return redirect()->route('admin.index');
        } catch (\Throwable $th) {
            DB::rollBack();
            throw $th;
        }
    }

    public function login()
    {
        return Inertia::render('Auth/AdminLogin');
    }

    public function exec(LoginRequest $request)
    {
        #admin login
        $credentials = [
            'email' => $request['email'],
            'password' => $request['password'],
        ];
        $this->validate($request, [
            'email' => 'required|email',
            'password' => 'required|min:5'
        ]);

        if (auth()->guard('admin')->attempt($request->only('email', 'password'))) {
            $request->session()->regenerate();
            // $this->clearLoginAttempts($request);
            // return redirect()->intended();
            return redirect()->route('user.index');
        } else {
            // $this->incrementLoginAttempts($request);
            return redirect()
                ->back()
                ->withInput()
                ->withErrors(["Incorrect user login details!"]);
        }
    }

    public function logout(Request $request)
    {
        // Auth::guard('admins')->logout();

        // $request->session()->invalidate();

        // $request->session()->regenerateToken();

        // return redirect('/');
        auth()->guard('admin')->logout();
        session()->flush();

        return redirect()->route('admin.login');
    }
}
