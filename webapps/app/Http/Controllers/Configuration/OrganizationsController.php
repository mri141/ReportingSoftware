<?php

namespace App\Http\Controllers\Configuration;

use App\Http\Controllers\Controller;
use App\Models\Organization;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class OrganizationsController extends Controller
{
    public $user;
    public function __construct()
    {
        $this->middleware(function ($request, $next) {
            $this->user = Auth::guard('web')->user();
            return $next($request);
        });
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if (!$this->user->hasPermissionTo('organization.list')) {
            return abort(403, 'Unauthoeized!');
        }
        $organizations = Organization::all();
        return view('pages.configuration.organization.index',compact('organizations'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        if (!$this->user->hasPermissionTo('organization.create')) {
            return abort(403, 'Unauthoeized!');
        }
        return view('pages.configuration.organization.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        if (!$this->user->hasPermissionTo('organization.create')) {
            return abort(403, 'Unauthoeized!');
        }
        $request->validate([
           'name'       => 'required|max:50',
           'short_name' => 'required|max:50|unique:organizations,short_name',
           'address'    => 'nullable|max:50'
        ]);
        $organization = new Organization();
        $organization->name = $request->name;
        $organization->short_name = $request->short_name;
        $organization->address = $request->address;
        $organization->save();
        return redirect()->route('organizations.index')->with('success','New Organizations Is Successfully Added');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        if (!$this->user->hasPermissionTo('organization.edit')) {
            return abort(403, 'Unauthoeized!');
        }
        $organization = Organization::find($id);
        return view('pages.configuration.organization.edit',compact('organization'));
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
        if (!$this->user->hasPermissionTo('organization.update')) {
            return abort(403, 'Unauthoeized!');
        }
        $request->validate([
            'name'       => 'nullable|max:50',
            'short_name' => 'nullable|max:50|unique:organizations,short_name,'.$id,
            'address'    => 'nullable|max:50'
         ]);
         $organization = Organization::find($id);
         $organization->name = $request->name;
         $organization->short_name = $request->short_name;
         $organization->address = $request->address;
         $organization->save();
         return redirect()->route('organizations.index')->with('success','Organizations Is Successfully Updated');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        if (!$this->user->hasPermissionTo('organization.destroy')) {
            return abort(403, 'Unauthoeized!');
        }
        $organization = Organization::find($id);
        if(!is_null($organization)){
            $organization->delete();
        }
        return back()->with('success','Organizations Is Successfully Deleted');
    }
}
