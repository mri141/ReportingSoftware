@extends('layouts.master')

@section('title')
    Create Ticket | Enrich IT
@endsection

@section('content')
    <div class="page-header">
        <div class="page-header-title">
            <h4>Add New Ticket</h4>
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
                <li class="breadcrumb-item"><a href="{{ route('tickets.index') }}">Ticket List</a>
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
                        <form action="{{ route('tickets.store') }}" role="form" method="POST"
                            enctype="multipart/form-data">
                            @csrf
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label"> Work Title <span
                                        class="text-danger">*</span></label>
                                <div class="col-sm-10">
                                    <input type="text" name="title" value="" class="form-control">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Work Details <span
                                        class="text-danger">*</span></label>
                                <div class="col-sm-10">
                                    <textarea name="details" id="summernote" cols="30" rows="10"
                                        class="form-control"></textarea>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Work Type <span
                                        class="text-danger">*</span></label>
                                <div class="col-sm-10">
                                    <select class="custom-select form-control" name="type">
                                        <option value="">Select An Option</option>
                                        <option value="P">Problem</option>
                                        <option value="C">Change request</option>
                                        <option value="E">Feature</option>
                                        <option value="S">Support</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Work Priority<span
                                        class="text-danger">*</span></label>
                                <div class="col-sm-10">
                                    <select class="custom-select form-control" name="priority">
                                        <option value="">Select An Option</option>
                                        <option value="U">Urgent</option>
                                        <option value="N">Normal</option>
                                        <option value="L">Low</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Assigned To<span
                                        class="text-danger">*</span></label>
                                <div class="col-sm-10">
                                    <select name="user_id" id="" class="form-control">
                                        <option value="">-Select Assigned</option>
                                        @foreach ($users as $user)
                                            <option value="{{ $user->id }}">{{ $user->name }}</option>
                                        @endforeach

                                    </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Company Product <span class="text-danger">*</span></label>
                                <div class="col-sm-10">
                                    <select name="product_id" id="" class="form-control">
                                        <option value="">-Select Product</option>
                                        @foreach ($products as $product)
                                            <option value="{{ $product->id }}">{{ $product->name }}</option>
                                        @endforeach

                                    </select>
                                </div>
                            </div>
                            {{-- <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Registration Date</label>
                                <div class="col-sm-10">
                                    <input type="date" name="registration_date" class="form-control hasDatepicker" value=""
                                        id="datepicker">
                                </div>
                            </div> --}}
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Status</label>
                                <div class="col-sm-10">
                                    <select name="status_id" id="" class="form-control">
                                        <option value="">-Select Status</option>
                                        @foreach ($statuses as $status)
                                            <option value="{{ $status->id }}">{{ $status->name }}</option>
                                        @endforeach

                                    </select>
                                </div>
                            </div>
                            <div id="inprogress_type" style="display: none;">
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">Inprogress Type <span class="text-danger">*</span></label>
                                    <div class="col-sm-10">
                                        <select name="inprogress_type"  class="form-control" id="inprogress_type_id">
                                            <option value="">-Select Type</option>
                                            <option value="primary">Primary</option>
                                            <option value="secondary">Secondary</option>
                                            <option value="final">Final</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Starting Date</label>
                                <div class="col-sm-10">
                                    <input type="date" name="start_date" value="" ="" class="form-control">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Ending Date</label>
                                <div class="col-sm-10">
                                    <input type="date" name="end_date" value="" ="" class="form-control">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Duration Time</label>
                                <div class="col-sm-10">
                                    <input type="text" name="time" value="" ="" class="form-control">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Problem Occurring URL</label>
                                <div class="col-sm-10">
                                    <input type="url" name="url" value="" class="form-control">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Redmine Issue Number</label>
                                <div class="col-sm-10">
                                    <input type="text" name="ticket_number" value="" class="form-control">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Upload File <span class="text-muted">(You can upload image, docs, pdf, xlsx..)</span></label>
                                <div class="col-sm-10">
                                    <input type="file" name="image[]" value=""="" class="form-control" multiple>
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
            </div>
            <!-- Basic Form Inputs card end -->
        </div>
    </div>
    </div>
    @push('custom-scripts')
        <script>
                $("#status_id").on('change', function(){
                    var status_id = $(this).val();
                    if(status_id == 4){
                        $("#inprogress_type").css("display","block");
                        $("#inprogress_type_id").prop('required',true);
                    }
                });
        </script>
    @endpush
@endsection
