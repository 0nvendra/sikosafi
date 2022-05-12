<?php

namespace App\Http\Controllers;

use App\Models\Rule;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Inertia\Inertia;

class RuleController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    private $name = 'Rule';
    public function index(Request $request)
    {
        return Inertia::render('rule/index', [
            'rules' => Rule::when($request->desc, function ($query, $q) {
                $query->where('desc', 'like', '%' . $q . '%');
            })
                ->orderBy("no", 'asc')
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
        return Inertia::render('rule/create', [
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
                'no' => ['required', 'unique:rules'],
                'desc' => ['required'],
            ];

            $messages = [
                // 'required' => 'Please fill :attribute',
            ];

            $attributes = [
                'no' => 'No',
                'desc' => 'Peraturan',
            ];

            $validator = Validator::make($request->all(), $rules, $messages, $attributes)->validate();
            Rule::create($validator);
            DB::commit();
            return redirect()->route('rule.index');
        } catch (\Throwable $th) {
            DB::rollBack();
            throw $th;
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Rule  $rule
     * @return \Illuminate\Http\Response
     */
    public function show(Rule $rule)
    {
        // return $rule;
        return Inertia::render('rule/show', [
            'name' => $this->name,
            'rule' => $rule,
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Rule  $rule
     * @return \Illuminate\Http\Response
     */
    public function edit(Rule $rule)
    {
        return Inertia::render('rule/edit', [
            'name' => $this->name,
            'rule' => $rule,
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Rule  $rule
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Rule $rule)
    {
        try {
            DB::beginTransaction();
            $rules = [
                'no' => ['required'],
                'desc' => ['required'],
            ];

            $messages = [
                // 'required' => 'Please fill :attribute',
            ];

            $attributes = [
                'no' => 'No',
                'desc' => 'Peraturan',
            ];

            $validator = Validator::make($request->all(), $rules, $messages, $attributes)->validate();
            $rule->update($validator);
            DB::commit();
            return redirect()->route('rule.index');
        } catch (\Throwable $th) {
            DB::rollBack();
            throw $th;
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Rule  $rule
     * @return \Illuminate\Http\Response
     */
    public function destroy(Rule $rule)
    {
        try {
            DB::beginTransaction();
            $rule->delete();
            DB::commit();
            return redirect()->route('rule.index');
        } catch (\Throwable $th) {
            DB::rollBack();
            throw $th;
        }
    }
}
