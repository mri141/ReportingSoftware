@extends('layouts.master')

@section('title')
    Show Ticket | Enrich IT
@endsection

@section('content')
    <div class="page-header">
        <div class="page-header-title">
            <h4>Ticket Information</h4>
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

        <!-- Container-fluid starts -->
        <div class="container">
            <!-- Main content starts -->
            <div>
                <!-- Invoice card start -->
                <div class="card">
                    <div class="row invoice-contact">
                        <div class="col-md-8">
                            <div class="invoice-box row">
                                <div class="col-sm-12">
                                    <table class="table table-responsive invoice-table table-borderless">
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <img width="120" height="50"
                                                        src="{{ asset('images/products/' . $ticket->product->image) }}"
                                                        alt="">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Ticket Id :<b> {{ $ticket->ticket_code }}</b></td>
                                            </tr>
                                            <tr>
                                                <td>Product :<b> {{ $ticket->product->name }}</b></td>
                                            </tr>
                                            <tr>
                                                <td>Raised By :<b> {{ $ticket->user->name }}</b></td>
                                            </tr>
                                            <tr>
                                                <td>Raising Date :<b> {{ $ticket->raising_date }}</b></td>
                                            </tr>
                                            <tr>
                                                <td>Solving Date :<b> </b></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>

                        <td>


                        </td>
                    </div>
                    <div class="card-block">
                        <div class="row">
                            <div class="col-sm-12">
                                <h6 style="text-decoration: underline">{{ $ticket->title }}</h6>
                                <p></p>
                                <p> {!! $ticket->details !!} </p>


                                <p></p>
                                <p></p>
                            </div>

                            <div class="col-sm-12">
                                <h6>Status : {{ $ticket->status->name }}</h6>
                                <p></p>

                            </div>
                            <div class="col-md-12 mt-1">
                                <h3>View Report</h3>
                                @foreach ($ticket->images as $image)
                                    @if (pathinfo($image->image, PATHINFO_EXTENSION) == 'xlsx')
                                        <a class="btn btn-dark"
                                            href="{{ asset('images/tickets/' . $image->image) }}">Download XL</a>
                                    @elseif (pathinfo($image->image, PATHINFO_EXTENSION) == 'pdf')
                                        <a class="btn btn-dark"
                                            href="{{ asset('images/tickets/' . $image->image) }}">Download pdf</a>
                                    @elseif (pathinfo($image->image, PATHINFO_EXTENSION) == 'docx')
                                        <a class="btn btn-dark"
                                            href="{{ asset('images/tickets/' . $image->image) }}">Download Docs</a>
                                    @else
                                        <img width="120" height="50" src="{{ asset('images/tickets/' . $image->image) }}"
                                            alt="">
                                    @endif
                                @endforeach
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="row text-center">
                                    <div class="col-sm-12 invoice-btn-group">
                                        <button type="button"
                                            class="btn btn-primary btn-print-invoice waves-effect waves-light m-r-20 m-b-10">Print
                                            Ticket
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Invoice card end -->
            </div>
        </div>
        <!-- Container ends -->
    </div>
@endsection
