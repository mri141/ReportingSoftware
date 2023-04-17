@extends('layouts.master')

@section('title')
    Update Ticket | Enrich IT
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
                        <form action="{{ route('tickets.update',$ticket->id) }}" role="form" method="POST"
                            enctype="multipart/form-data">
                            @csrf
                            @method('PUT')

                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label"> Ticket Title <span
                                        class="text-danger">*</span></label>
                                <div class="col-sm-10">
                                    <input type="text" name="title" value="{{ $ticket->title }}" class="form-control">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Problem Details <span
                                        class="text-danger">*</span></label>
                                <div class="col-sm-10">
                                    <textarea name="details" id="summernote" cols="30" rows="10"
                                        class="form-control">{{ $ticket->details }}</textarea>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Ticket Type <span
                                        class="text-danger">*</span></label>
                                <div class="col-sm-10">
                                    <select class="custom-select form-control" name="type" id="problem">
                                        <option value="">Select An Option</option>
                                        <option  value="P" {{ $ticket->type == 'P' ? 'selected': '' }}>Problem</option>
                                        <option value="C" {{ $ticket->type == 'C' ? 'selected': '' }}>Change request</option>
                                        <option value="E" {{ $ticket->type == 'E' ? 'selected': '' }}>Feature</option>
                                        <option value="S" {{ $ticket->type == 'S' ? 'selected': '' }}>Support</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Ticket Priority<span
                                        class="text-danger">*</span></label>
                                <div class="col-sm-10">
                                    <select class="custom-select form-control" name="priority">
                                        <option value="">Select An Option</option>
                                        <option value="U" {{ $ticket->priority == 'U' ? 'selected': '' }}>Urgent</option>
                                        <option value="N" {{ $ticket->priority == 'N' ? 'selected': '' }}>Normal</option>
                                        <option value="L" {{ $ticket->priority == 'L' ? 'selected': '' }}>Low</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Starting Date</label>
                                <div class="col-sm-10">
                                    <input type="date" name="start_date" value="{{$ticket->start_date ?? ''}}" ="" class="form-control">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Ending Date</label>
                                <div class="col-sm-10">
                                    <input type="date" name="end_date" value="{{$ticket->end_date ?? ''}}" ="" class="form-control">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Duration Time</label>
                                <div class="col-sm-10">
                                    <input type="text" name="time" value="{{$ticket->time ?? ''}}" ="" class="form-control">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Assigned <span class="text-danger">*</span></label>
                                <div class="col-sm-10">
                                    <select name="user_id" id="" class="form-control">
                                        <option value="">-Select Assigned</option>
                                        @foreach ($users as $user)
                                            <option value="{{ $user->id }}" {{ $ticket->user->id == $user->id ? 'selected' : '' }}>{{ $user->name }}</option>
                                        @endforeach

                                    </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Product <span class="text-danger">*</span></label>
                                <div class="col-sm-10">
                                    <select name="product_id" id="" class="form-control">
                                        <option value="">-Select Product</option>
                                        @foreach ($products as $product)
                                            <option value="{{ $product->id }}" {{ $ticket->product->id == $product->id ? 'selected' : ''}}>{{ $product->name }}</option>
                                        @endforeach

                                    </select>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Status</label>
                                <div class="col-sm-10">
                                    <select name="status_id" id="" class="form-control">
                                        <option value="">-Select Status</option>
                                        @foreach ($statuses as $status)
                                           <option value="{{ $status->id }}" {{ $ticket->status->id == $status->id ? 'selected' : '' }}>{{ $status->name }}</option>
                                        @endforeach

                                    </select>
                                </div>
                            </div>
                            <div class="form-group row d-none" id="root_cause">
                                <label class="col-sm-2 col-form-label">Root Cause </label>
                                <div class="col-sm-10">
                                    <textarea name="root_cause" id="" cols="30" rows="5" class="form-control" placeholder="Write about problem..."></textarea>
                                </div>
                            </div>
                            @if ($ticket->type == 'P')
                                <div class="form-group row " id="ticket_type_root_cause">
                                    <label class="col-sm-2 col-form-label">Root Cause </label>
                                    <div class="col-sm-10">
                                        <textarea name="root_cause" id="" cols="30" rows="5" class="form-control" placeholder="Write about problem..."></textarea>
                                    </div>
                                </div>
                            @endif
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Problem Occurring URL</label>
                                <div class="col-sm-10">
                                    <input type="url" name="url" value="{{ $ticket->url }}" class="form-control">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Upload File</label>
                                <div class="col-sm-10">
                                    @foreach ($ticket->images as $image)
                                    <img src="{{ asset('images/tickets/'.$image->image) }}" alt="{{ $ticket->name }}" width="82">
                                    @endforeach
                                    <input type="file" name="image[]" value="" ="" class="form-control"  multiple >
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Redmine Issue Number</label>
                                <div class="col-sm-10">
                                    <input type="text" name="ticket_number" value="{{ $ticket->ticket_number }}" class="form-control">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">&nbsp;</label>

                                <div style="float: right;" class="col-xs-2"><input type="submit"
                                        class="btn btn-success" value="Upadte"></div>
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
            $(document).ready(function(){
                $("#problem").change(function(){
                    $problem_method = $("#problem").val();
                    if ($problem_method == "P") {
                        $("#root_cause").removeClass('d-none');
                    }else{
                        $("#root_cause").addClass('d-none');
                    }
                });
            });
        </script>
    @endpush

@endsection
