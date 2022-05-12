<?php

namespace App\Http\Controllers;

use App\Models\Fasilitas;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Inertia\Inertia;

class FasilitasController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    private $name = 'Fasilitas';
    public function index(Request $request)
    {
        return Inertia::render('fasilitas/index', [
            'fasilitases' => Fasilitas::when($request->desc, function ($query, $q) {
                $query->where('desc', 'like', '%' . $q . '%');
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
        return Inertia::render('fasilitas/create', [
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
                'desc' => ['required'],
            ];

            $messages = [
                // 'required' => 'Please fill :attribute',
            ];

            $attributes = [
                'desc' => 'Fasilitas',
            ];

            $validator = Validator::make($request->all(), $rules, $messages, $attributes)->validate();
            Fasilitas::create($validator);
            DB::commit();
            return redirect()->route('fasilitas.index');
        } catch (\Throwable $th) {
            DB::rollBack();
            throw $th;
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Fasilitas  $fasilitas
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $fasilitas = Fasilitas::find($id);
        return Inertia::render('fasilitas/show', [
            'name' => $this->name,
            'fasilitas' => $fasilitas,
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Fasilitas  $fasilitas
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $fasilitas = Fasilitas::find($id);
        return Inertia::render('fasilitas/edit', [
            'name' => $this->name,
            'fasilitas' => $fasilitas,
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Fasilitas  $fasilitas
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Fasilitas $fasilitas)
    {
        try {
            DB::beginTransaction();
            $rules = [
                'desc' => ['required'],
            ];

            $messages = [
                // 'required' => 'Please fill :attribute',
            ];

            $attributes = [
                'desc' => 'Fasilitas',
            ];

            $validator = Validator::make($request->all(), $rules, $messages, $attributes)->validate();
            $fasilitas= Fasilitas::find($request->id);
            $fasilitas->update($validator);
            DB::commit();
            return redirect()->route('fasilitas.index');
        } catch (\Throwable $th) {
            DB::rollBack();
            throw $th;
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Fasilitas  $fasilitas
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {        
        try {
            DB::beginTransaction();
            Fasilitas::find($id)->delete();
            DB::commit();
            return redirect()->route('fasilitas.index');
        } catch (\Throwable $th) {
            DB::rollBack();
            throw $th;
        }
    }
}
