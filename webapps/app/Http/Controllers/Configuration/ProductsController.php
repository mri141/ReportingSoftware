<?php

namespace App\Http\Controllers\Configuration;

use App\Http\Controllers\Controller;
use App\Models\Organization;
use App\Models\Product;
use App\Models\User;
use App\Services\ImageUpload;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\File;

class ProductsController extends Controller
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
        if (!$this->user->hasPermissionTo('product.list')) {
            return abort(403, 'Unauthoeized!');
        }
        $products = Product::all();
        return view('pages.configuration.product.index',compact('products'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        if (!$this->user->hasPermissionTo('product.create')) {
            return abort(403, 'Unauthoeized!');
        }
        $users = User::whereHas('roles',function($query){
            $query->where('name', '!=','Client');
            $query->where('name', '!=','Admin');
            $query->where('name', '!=','super-admin');
        })->get();

        $organizations = Organization::all();
        return view('pages.configuration.product.create',compact('users','organizations'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        if (!$this->user->hasPermissionTo('product.create')) {
            return abort(403, 'Unauthoeized!');
        }
        $request->validate([
           'name'            => 'nullable|max:50',
           'short_name'      => 'nullable|max:50',
           'description'     => 'nullable|max:200',
           'organization_id' => 'nullable',
           'user_id'         => 'nullable',
           'url'             => 'nullable',
           'email_cc'        => 'nullable',
           'image'           => 'nullable'
        ]);

        $product = new Product();
        $product->name = $request->name;
        $product->short_name = $request->short_name;
        $product->description = $request->description;
        $product->organization_id = $request->organization_id;
        $product->user_id = $request->user_id;
        $product->url = $request->url;
        $product->email_cc = $request->email_cc;

        if($request->has('image')){
           $reImage =  ImageUpload::upload($request,'image','images/products');

             //now save in database
            $product->image = $reImage;

        }
        $product->save();
        return redirect()->route('products.index')->with('success','New Products Is Successfully Added');
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
        if (!$this->user->hasPermissionTo('product.edit')) {
            return abort(403, 'Unauthoeized!');
        }
        $product = Product::find($id);
        $users = User::whereHas('roles',function($query){
            $query->where('name', '!=','Client');
            $query->where('name', '!=','Admin');
            $query->where('name', '!=','super-admin');
        })->get();
        $organizations = Organization::all();
        return view('pages.configuration.product.edit',compact('product','users','organizations'));
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
        if (!$this->user->hasPermissionTo('product.update')) {
            return abort(403, 'Unauthoeized!');
        }
        $request->validate([
            'name'            => 'required|max:50',
            'short_name'      => 'required|max:50',
            'description'     => 'nullable|max:200',
            'organization_id' => 'required',
            'user_id'         => 'required',
            'url'             => 'nullable',
            'email_cc'        => 'nullable',
            'image'           => 'nullable'
         ]);

         $product = Product::find($id);
         $product->name = $request->name;
         $product->short_name = $request->short_name;
         $product->description = $request->description;
         $product->organization_id = $request->organization_id;
         $product->user_id = $request->user_id;
         $product->url = $request->url;
         $product->email_cc = $request->email_cc;
         if($request->has('image')){

            if(File::exists('images/products/'.$product->image)){
                File::delete('images/products/'.$product->image);
            }
            $reImage =  ImageUpload::upload($request,'image','images/products');
             //now save in database
             $product->image = $reImage;

         }
         $product->save();
         return redirect()->route('products.index')->with('success','Products Is Successfully Upadated');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        if (!$this->user->hasPermissionTo('product.destroy')) {
            return abort(403, 'Unauthoeized!');
        }
        $product = Product::find($id);
        if(!is_null($product)){
            if(File::exists('images/products/'.$product->image)){
                File::delete('images/products/'.$product->image);
            }
            $product->delete();
        }
        return redirect()->route('products.index')->with('success','Products Is Successfully Deleted');
    }

    //get product
    public function getProduct($id){
        $getProduct = Product::where('organization_id',$id)->get();
        return response()->json([
            'data' => $getProduct,
             'success' => 'Organizatio Id Wise Get product '
        ]);
    }
}
