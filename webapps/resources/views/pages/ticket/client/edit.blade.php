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
                        <form action="{{ route('clients-ticket.update',$ticket->id) }}" role="form" method="POST"
                            enctype="multipart/form-data">
                            @csrf
                            @method('PUT')
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label"> Work Title <span
                                        class="text-danger">*</span></label>
                                <div class="col-sm-10">
                                    <input type="text" name="title" value="{{ $ticket->title }}"  class="form-control">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Work Details <span
                                        class="text-danger">*</span></label>
                                <div class="col-sm-10">
                                    <textarea name="details" id="summernote" cols="30" rows="10"
                                        class="form-control">{{ $ticket->details }}</textarea>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Work Type <span
                                        class="text-danger">*</span></label>
                                <div class="col-sm-10">
                                    <select class="custom-select form-control" name="type">
                                        <option value="">Select An Option</option>
                                        <option value="P" {{ $ticket->type == 'P' ? 'selected' : ''  }}>Problem</option>
                                        <option value="C" {{ $ticket->type == 'C' ? 'selected' : ''  }}>Change request</option>
                                        <option value="N" {{ $ticket->type == 'N' ? 'selected' : ''  }}>New Request</option>
                                        <option value="S" {{ $ticket->type == 'S' ? 'selected' : ''  }}>Support</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Work Priority<span
                                        class="text-danger">*</span></label>
                                <div class="col-sm-10">
                                    <select class="custom-select form-control" name="priority">
                                        <option value="">Select An Option</option>
                                        <option value="U" {{ $ticket->priority == 'U' ? 'selected' : ''  }}>Urgent</option>
                                        <option value="E" {{ $ticket->priority == 'E' ? 'selected' : ''  }}>Normal</option>
                                        <option value="L"
                                        {{ $ticket->priority == 'L' ? 'selected' : ''  }}>Low</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Related Ticket Id</label>
                                <div class="col-sm-10" >
                                    <select class="custom-select" name="related_ticket_id" id="select2">
                                        <option value="">Select Ticket Id</option>
                                        @foreach ($ticketIds as $ticketId)
                                          <option value="{{ $ticketId->id }}" {{ $ticket->related_ticket_id == $ticketId->id ? 'selected' : '' }}>{{ $ticketId->ticket_code }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Problem Occurring URL</label>
                                <div class="col-sm-10">
                                    <input type="url" name="url" value="{{ $ticket->url }}" ="" class="form-control">
                                </div>
                            </div>
                            <div class="form-group row">

                                <label class="col-sm-2 col-form-label">Upload File</label>

                                <div class="col-sm-10">
                                    <img src="{{ asset('/images/tickets/'.$ticket->image) }}" alt="{{ $ticket->title }}" width="82">
                                    <input type="file" name="image" value="" ="" class="form-control">
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
