@extends('layouts.master')

@section('title')
    Product List | Enrich IT
@endsection

@section('content')
        <!-- Page-header start -->
        <div class="page-header ">
            <div class="page-header-title">
                <h4>Products List</h4>
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


                </ul>
            </div>
        </div>
        <!-- Page-header end -->
        <!-- Page-body start -->
        <div class="page-body">
            <div class="row">
                <div class="col-sm-12">
                    @include('layouts.partials.message')
                    <!-- Multi-column table start -->
                    <div class="card">
                        <div class="">

                            <div class="float-right mt-2 mr-1">
                                <a  href="{{ route('products.create') }}" id="" class="btn btn-primary"><i class="ion-plus"></i>Create
                                    New</a>
                            </div>
                        </div>
                        <div class="card-block">
                            <div class="dt-responsive table-responsive">
                                <div id="order-table_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-12">
                                            <table id="dataTables"
                                                class="table table-striped table-bordered nowrap dataTable no-footer"
                                                role="grid" aria-describedby="order-table_info">
                                                <thead>
                                                    <tr role="row">
                                                        <th width="2%" class="sorting" tabindex="0"
                                                            aria-controls="order-table" rowspan="1" colspan="1"
                                                            aria-label="Sl.: activate to sort column ascending"
                                                            style="width: 16px;">Sl.</th>
                                                        <th class="text-center" width="20%" class="sorting" tabindex="0"
                                                            aria-controls="order-table" rowspan="1" colspan="1"
                                                            aria-label="Roll Name: activate to sort column ascending"
                                                            style="width: 120.25px;">Logo</th>

                                                        <th style="white-space: normal; width: 744.688px;" width="20%"
                                                            class="sorting_desc" tabindex="0" aria-controls="order-table"
                                                            rowspan="1" colspan="1" aria-sort="descending"
                                                            aria-label="Roll Description: activate to sort column ascending">
                                                             Product Name</th>

                                                        <th style="white-space: normal; width: 744.688px;" width="20%"
                                                            class="sorting_desc" tabindex="0" aria-controls="order-table"
                                                            rowspan="1" colspan="1" aria-sort="descending"
                                                            aria-label="Roll Description: activate to sort column ascending">
                                                             Short Name</th>

                                                        <th style="white-space: normal; width: 744.688px;" width="20%"
                                                             class="sorting_desc" tabindex="0" aria-controls="order-table"
                                                             rowspan="1" colspan="1" aria-sort="descending"
                                                             aria-label="Roll Description: activate to sort column ascending">
                                                              Organization</th>

                                                        <th width="10%" class="sorting" tabindex="0"
                                                            aria-controls="order-table" rowspan="1" colspan="1"
                                                            aria-label="Action: activate to sort column ascending"
                                                            style="width: 83.2344px;">Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    @foreach ($products as $product)
                                                        <tr role="row" class="odd">
                                                            <td>{{ $loop->index + 1 }}</td>
                                                            <td class="text-center">
                                                                <img src="{{ asset('images/products/'.$product->image) }}" alt="{{ $product->name }}" width="82">
                                                            </td>
                                                            <td>{{ $product->name }}</td>
                                                            <td>{{ $product->short_name }}</td>
                                                            <td>{{ $product->organization->name }}</td>


                                                            <td>
                                                                <a href="{{ route('products.edit', $product->id) }}"
                                                                    title="edit" class="edit"><img
                                                                        src="{{ asset('images/default/edit1.gif') }}"
                                                                        border="0" alt="Payment">
                                                                </a>&nbsp;


                                                            </td>
                                                        </tr>
                                                    @endforeach

                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Multi-column table end -->
                </div>
            </div>

        </div>
        <!-- Page-body end -->

@endsection
