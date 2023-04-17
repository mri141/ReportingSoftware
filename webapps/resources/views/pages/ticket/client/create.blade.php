@extends('layouts.master')

@section('title')
    Create Ticket | Sobkisubazar
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
                <li class="breadcrumb-item"><a href="{{ route('clients-ticket.index') }}">Ticket List</a>
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
                        <form action="{{ route('clients-ticket.store') }}" role="form" method="POST"
                            enctype="multipart/form-data">
                            @csrf
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label"> Request Title <span
                                        class="text-danger">*</span></label>
                                <div class="col-sm-10">
                                    <input type="text" name="title" value="" ="" class="form-control">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Problem Details <span
                                        class="text-danger">*</span></label>
                                <div class="col-sm-10">
                                    <textarea name="details" id="summernote" cols="30" rows="10"
                                        class="form-control"></textarea>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Request Type <span
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
                                <label class="col-sm-2 col-form-label">Request Priority<span
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
                                    <input type="time" name="time" value="" ="" class="form-control">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Problem Occurring URL</label>
                                <div class="col-sm-10">
                                    <input type="url" name="url" value="" ="" class="form-control">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Related Ticket Id</label>
                                <div class="col-sm-10">
                                    <select class="custom-select" name="related_ticket_id" id="select2" >
                                        <option value="">Select Ticket Id</option>
                                        @foreach ($ticketIds as $ticketId)
                                          <option value="{{ $ticketId->id }}">{{ $ticketId->ticket_code }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Upload File <span class="text-muted">(You can upload image, docs, pdf, xlsx..)</span></label>
                                <div class="col-sm-10">
                                    <input type="file" name="image[]" value="" ="" class="form-control" multiple>
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

        </script>
    @endpush

@endsection
