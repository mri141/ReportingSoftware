@extends('layouts.master')

@section('title')
    Product Update | Enrich IT
@endsection

@section('content')
    <div class="page-header">
        <div class="page-header-title">
            <h4>Update Product</h4>
        </div>
        <div class="page-header-breadcrumb">
            <ul class="breadcrumb-title">
                <li class="breadcrumb-item">
                    <a href="index.html">
                        <i class="icofont icofont-home"></i>
                    </a>
                </li>
                <li class="breadcrumb-item"><a href="{{ route('home.index') }}">Home</a>
                </li>
                <li class="breadcrumb-item"><a
                        href="{{ route('products.index') }}">Products List</a>
                </li>

            </ul>
        </div>
    </div>
    <div class="page-body">
        <div class="row">
            <div class="col-sm-12">
                @include('layouts.partials.message')
                <!-- Basic Form Inputs card start -->
                <div class="card">
                    <div class="card-block">
                        <form action="{{ route('products.update',$product->id) }}" role="form" method="POST" enctype="multipart/form-data">
                            @csrf
                            @method('PUT')
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Product Name <span class="text-danger">*</span></label>
                                <div class="col-sm-10">
                                    <input type="text" name="name" value="{{ $product->name }}" required="required" class="form-control">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Product Short Name <span class="text-danger">*</span></label>
                                <div class="col-sm-10">
                                    <input type="text" name="short_name" value="{{ $product->short_name }}" required="required"
                                        class="form-control">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Product Description</label>
                                <div class="col-sm-10">
                                    <textarea name="address" class="form-control" placeholder="Address"></textarea>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Organization <span class="text-danger">*</span></label>
                                <div class="col-sm-10">
                                    <select name="organization_id" id="" class="form-control">
                                        <option value="">-Select Organization</option>
                                        @foreach ($organizations as $organization)
                                            <option value="{{ $organization->id }}" {{ $product->organization_id == $organization->id ? 'selected' : ''}}>{{ $organization->name }}</option>
                                        @endforeach

                                    </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Assigined Person <span class="text-danger">*</span></label>
                                <div class="col-sm-10">
                                    <select name="user_id" id="" class="form-control">
                                        <option value="">-Select Assigine</option>
                                        @foreach ($users as $user)
                                            <option value="{{ $user->id }}" {{ $user->id == $product->user_id ? 'selected' : '' }}>{{ $user->name }}</option>
                                        @endforeach

                                    </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Product URL</label>
                                <div class="col-sm-10">
                                    <input type="url" name="url" value="{{ $product->url }}" required="required"
                                    class="form-control">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Email CC</label>
                                <div class="col-sm-10">
                                    <input type="text" name="email_cc" value="{{ $product->email_cc }}"
                                    class="form-control">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Product Logo  <span class="text-danger">*</span></label>

                                <div class="col-sm-10">
                                    <img src="{{ asset('images/products/'.$product->image) }}" alt="{{ $product->name }}" width="82">
                                    <input type="file" name="image" value=""
                                    class="form-control">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">&nbsp;</label>

                                <div style="float: right;" class="col-xs-2"><input type="submit"
                                        class="btn btn-success" value="Save"></div>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- Basic Form Inputs card end -->
            </div>
        </div>
    </div>
@endsection
