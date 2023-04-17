@extends('layouts.master')

@section('title')
    Ticket List | Enrich IT
@endsection

@section('content')
    <!-- Page-header start -->
    <div class="page-header ">
        <div class="page-header-title">
            <h4> TicketList</h4>
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
                <li class="breadcrumb-item"><a href="{{ route('clients-ticket.index') }}">Ticket
                        List</a>
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
                            <a href="{{ route('clients-ticket.create') }}" id="" class="btn btn-primary"><i
                                    class="ion-plus"></i>Create
                                New</a>
                        </div>
                    </div>
                    <div class="card-block">
                        <div class="dt-responsive table-responsive">
                            <div id="order-table_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-12 table-responsive">
                                        <table id="data-table"
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
                                                        style="width: 120.25px;">Ticket Id</th>

                                                    <th style="white-space: normal; width: 744.688px;" width="20%"
                                                        class="sorting_desc" tabindex="0" aria-controls="order-table"
                                                        rowspan="1" colspan="1" aria-sort="descending"
                                                        aria-label="Roll Description: activate to sort column ascending">
                                                        Title</th>
                                                    <th style="white-space: normal; width: 744.688px;" width="20%"
                                                        class="sorting_desc" tabindex="0" aria-controls="order-table"
                                                        rowspan="1" colspan="1" aria-sort="descending"
                                                        aria-label="Roll Description: activate to sort column ascending">
                                                        Raising date
                                                    </th>
                                                    <th style="white-space: normal; width: 744.688px;" width="20%"
                                                        class="sorting_desc" tabindex="0" aria-controls="order-table"
                                                        rowspan="1" colspan="1" aria-sort="descending"
                                                        aria-label="Roll Description: activate to sort column ascending">
                                                        Status </th>


                                                    <th width="10%" class="sorting" tabindex="0"
                                                        aria-controls="order-table" rowspan="1" colspan="1"
                                                        aria-label="Action: activate to sort column ascending"
                                                        style="width: 83.2344px;">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                @foreach ($tickets as $ticket)
                                                    <tr role="row" class="odd">
                                                        <td>{{ $loop->index + 1 }}</td>
                                                        <td>
                                                            <a style="text-decoration: underline" class="text-dark"
                                                                target="_blank"
                                                                href="{{ route('clients-ticket.show', $ticket->id) }}">{{ $ticket->ticket_code }}</a>
                                                        </td>
                                                        <td>
                                                            <a style="text-decoration: underline" class="text-dark"
                                                                target="_blank"
                                                                href="{{ route('clients-ticket.edit', $ticket->id) }}">{{ Str::limit($ticket->title, 50) }}
                                                            </a>
                                                        </td>
                                                        <td>{{ $ticket->raising_date ?? '' }}</td>
                                                        <td>
                                                            @if ($ticket->status->name == 'Closed')
                                                                <span
                                                                    class="badge badge-danger">{{ $ticket->status->name }}
                                                                </span>
                                                            @elseif ($ticket->status->name == 'Created')
                                                                <span class="badge badge-primary">New</span>
                                                            @elseif ($ticket->status->name == 'Resolved')
                                                                <span
                                                                    class="badge badge-success">{{ $ticket->status->name }}
                                                                </span>
                                                            @elseif ($ticket->status->name == 'Inprogress')
                                                                <span
                                                                    class="badge badge-info">{{ $ticket->status->name }}
                                                                </span>
                                                            @elseif ($ticket->status->name == 'Postponed')
                                                                <span
                                                                    class="badge badge-warning">{{ $ticket->status->name }}
                                                                </span>
                                                            @elseif ($ticket->status->name == 'Rejected')
                                                                <span
                                                                    class="badge badge-danger">{{ $ticket->status->name }}
                                                                </span>
                                                            @elseif ($ticket->status->name == 'Feedback')
                                                                <span
                                                                    class="badge badge-primary">{{ $ticket->status->name }}
                                                                </span>
                                                            @else
                                                                <span>Nothing</span>
                                                            @endif

                                                        </td>

                                                        <td>
                                                            <a href="{{ route('clients-ticket.edit', $ticket->id) }}"
                                                                title="edit" class="edit"><img
                                                                    src="{{ asset('images/default/edit1.gif') }}"
                                                                    border="0" alt="Payment">
                                                            </a>&nbsp;
                                                            <a href="{{ route('clients-ticket.show', $ticket->id) }}"
                                                                title="View" class="View"><img
                                                                    src="{{ asset('images/default/view1.gif') }}"
                                                                    border="0" alt="View"></a>

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
    @push('custom-scripts')
        <script type="text/javascript">
            $(document).ready(function() {
                $('#data-table').DataTable();

            });
        </script>
    @endpush
@endsection
