@extends('layouts.master')

@section('title')
    Organization List | Enrich IT
@endsection

@section('content')
    <!-- Page-header start -->
    <div class="page-header ">
        <div class="page-header-title">
            <h4> Organization List</h4>
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
                            <a href="{{ route('organizations.create') }}" id="" class="btn btn-primary"><i
                                    class="ion-plus"></i>Create
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
                                                    <th width="10%" class="sorting" tabindex="0"
                                                        aria-controls="order-table" rowspan="1" colspan="1"
                                                        aria-label="Roll Name: activate to sort column ascending"
                                                        style="width: 120.25px;">Organization Name</th>

                                                    <th style="white-space: normal; width: 744.688px;" width="20%"
                                                        class="sorting_desc" tabindex="0" aria-controls="order-table"
                                                        rowspan="1" colspan="1" aria-sort="descending"
                                                        aria-label="Roll Description: activate to sort column ascending">
                                                        Short Name</th>

                                                    <th width="10%" class="sorting" tabindex="0"
                                                        aria-controls="order-table" rowspan="1" colspan="1"
                                                        aria-label="Action: activate to sort column ascending"
                                                        style="width: 83.2344px;">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                @foreach ($organizations as $organization)
                                                    <tr role="row" class="odd">
                                                        <td>{{ $loop->index + 1 }}</td>
                                                        <td>{{ $organization->name }}</td>
                                                        <td>{{ $organization->short_name }}</td>


                                                        <td>
                                                            <a href="{{ route('organizations.edit', $organization->id) }}"
                                                                title="edit" class="edit"><img
                                                                    src="{{ asset('images/default/edit1.gif') }}"
                                                                    border="0" alt="Payment">
                                                            </a>&nbsp;
                                                            <a href="#delteModal{{ $organization->id }}"
                                                                data-toggle="modal" title="Delete" class="delete">
                                                                <img src="{{ asset('images/default/delete1.gif') }}"
                                                                    border="0" alt="Payment">
                                                            </a>

                                                            <!--Delete  Modal -->
                                                            <div class="modal fade"
                                                                id="delteModal{{ $organization->id }}" tabindex="-1"
                                                                aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                                <div class="modal-dialog">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <h5 class="modal-title"
                                                                                id="exampleModalLabel">Are you sure
                                                                                to delete this?</h5>
                                                                            <button type="button" class="close"
                                                                                data-dismiss="modal" aria-label="Close">
                                                                                <span aria-hidden="true">&times;</span>
                                                                            </button>
                                                                        </div>
                                                                        <div class="modal-body">
                                                                            <form
                                                                                action="{{ route('organizations.destroy', $organization->id) }}"
                                                                                method="POST">
                                                                                @method('DELETE')
                                                                                @csrf
                                                                                <button type="submit"
                                                                                    class="btn btn-danger">Permanent
                                                                                    Delete</button>
                                                                            </form>
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button type="button" class="btn btn-secondary"
                                                                                data-dismiss="modal">Cancel</button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
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
