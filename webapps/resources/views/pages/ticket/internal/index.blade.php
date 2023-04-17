@extends('layouts.master')

@section('title')
    Ticket List | Enrich IT
@endsection


@section('content')
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
                <li class="breadcrumb-item"><a href="{{ route('tickets.index') }}">Ticket
                        List</a>
                </li>

            </ul>
        </div>
    </div>

    <div class="page-body">
        <div class="row">
            <div class="col-sm-12">
                @include('layouts.partials.message')
                <!-- Multi-column table start -->
                <div class="card">
                    <div class="d-flex justify-content-between">
                        <div class="col-md-6">
                            <div class="float-left my-2 ml-2">
                                <form action="" method="get" id="search_result">
                                    <div class="form-row">
                                        <div class="col-md-2">
                                            <select name="product_id" id="product_id" class="form-control">
                                                <option value="">All</option>
                                                @foreach ($products as $product)
                                                    <option value="{{ $product->id }}"
                                                        {{ @$product_id == $product->id ? 'selected' : '' }}>
                                                        {{ $product->short_name }}</option>
                                                @endforeach
                                            </select>

                                        </div>
                                        <div class="col-md-3">
                                            <input type="date" name="date" id="date" class="form-control">
                                        </div>
                                        <div class="col-md-3">
                                            <select name="user_id" id="user_id" class="form-control">
                                                <option value="">Select Assignee</option>
                                                <option value="">Select All</option>
                                                @foreach ($users as $user)
                                                    <option value="{{ $user->id }}"
                                                        {{ $user->id == @$user_id ? 'selected ' : '' }}>
                                                        {{ $user->name }}
                                                    </option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <div class="col-md-3">
                                            <select name="status_id" id="status_id" class="form-control">
                                                <option value="">Select Status</option>
                                                @foreach ($statuses as $status)
                                                    <option value="{{ $status->id }}"
                                                        {{ $status->id == @$status_id ? 'selected ' : '' }}>
                                                        {{ $status->name }}
                                                    </option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <div class="col-md-1 mb-3" style="">
                                            <button style="padding: 8px 19px ; margin-top: 1px" class="btn btn-info  "
                                                type="submit">Search</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="float-right mt-2 mr-1">
                                <a href="{{ route('tickets.create') }}" id="" class="btn btn-danger"><i
                                        class="ion-plus"></i>Create
                                    New</a>
                            </div>
                            {{-- <div class="float-right mt-2 mr-1">
                                <a href="{{ route('tickets.export') }}" id="" class="btn btn-dark"><i
                                        class="fas fa-download"></i>Download</a>
                            </div> --}}
                        </div>

                    </div>
                    <div class="card-block table-responsive">
                        <table class="table table-bordered table-striped " id="data-table" >
                            <thead>
                                <tr>
                                    <th scope="col">SI.</th>
                                    <th scope="col">Product Name</th>
                                    <th scope="col">Ticket Code </th>
                                    <th scope="col">Title</th>
                                    <th scope="col">Raising Date </th>
                                    <th scope="col">Starting Date </th>
                                    <th scope="col">Ending Date </th>
                                    <th scope="col">Time</th>
                                    <th scope="col">Status </th>
                                    <th scope="col">Issue Number </th>
                                    <th scope="col">Assigined To</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            {{-- <tbody>

                             </tbody> --}}
                        </table>

                    </div>
                </div>
                <!-- Multi-column table end -->
            </div>
        </div>

    </div>
    @push('custom-scripts')

        <script type="text/javascript">
            $(document).ready(function() {
                var t = $('#data-table').DataTable({
                    // dom: 'Bfrtip',
                    buttons: [
                        // 'copy', 'csv', 'excel', 'pdf', 'print',
                        {
                            extend: 'excel',
                            text: 'Download Excel',
                            className: 'btn btn-dark',
                            exportOptions: {
                                modifier: {
                                    order : 'original', // 'current', 'applied','index', 'original'
                                    page : 'all', // 'all', 'current'
                                   // search : 'none' // 'none', 'applied', 'removed'
                                }
                            }
                        }
                    ],
                    processing: true,
                    serverSide: true,

                    searching: true,

                    ajax: "{{ route('tickets.index_new') }}",

                    "columnDefs": [{
                        "searchable": false,
                        "orderable": false,
                        "targets": 0
                    }],

                    "order": [
                        [1, 'asc']
                    ],

                    columns: [{
                            "data": 'id',

                        },
                        // { data: 'id' },
                        {
                            "data": "product_name",
                            'name': "product.short_name",
                            'searchable': true,

                        },
                        {
                            "data": "_ticket_code",
                            'name': 'ticket_code',
                            'searchable': true,

                        },
                        {
                            "data": "_title",
                            "name": "title",
                            'searchable': true

                        },
                        {
                            "data": "_raising_date",
                            'name': 'raising_date',
                            'searchable': false,
                        },
                        {
                            "data": "_start_date",
                            'name': 'start_date',
                            'searchable': false,
                        },
                        {
                            "data": "_end_date",
                            'name': 'end_date',
                            'searchable': false,
                        },
                        {
                            "data": "_time",
                            'name': 'time',
                            'searchable': false,
                        },
                        {
                            "data": "status",
                            "name": "status.name",
                            'searchable': true
                        },

                        {
                            "data": "_issue_number",
                            "name": "ticket_number",
                            'searchable': true
                        },
                        {
                            "data": "assigine_to",
                            "name": "user.name",
                            'searchable': true
                        },
                        {data: 'action', name: 'action', orderable: false, searchable: false},
                    ],

                });
                t.on('order.dt search.dt', function() {
                    t.column(0, {
                        search: 'applied',
                        order: 'applied'
                    }).nodes().each(function(cell, i) {
                        cell.innerHTML = i + 1;
                        //t.cell(cell).invalidate('dom');
                    });
                }).draw();
            });



            $('#search_result').submit(function(e) {
                e.preventDefault();
                var date = $('#date').val();
                var user_id = $('#user_id').val();
                var product_id = $('#product_id').val();
                var status_id = $('#status_id').val();

                actionUrl = "{{ route('tickets.index_new') }}";

                var assign_table = $('#data-table').DataTable();
                assign_table.destroy();
                var t = $('#data-table').DataTable({
                    processing: true,
                    serverSide: true,
                    // searchable: true,


                    "columnDefs": [{
                        "searchable": false,
                        "orderable": false,
                        "targets": 0
                    }],

                    ajax: {
                        type: "get",
                        url: actionUrl,
                        data: {
                            "_token": "{{ csrf_token() }}",
                            "date": date,
                            "user_id": user_id,
                            "product_id": product_id,
                            "status_id": status_id
                        }
                    },

                    "order": [
                        [1, 'asc']
                    ],

                    columns: [{
                            "data": 'id',

                        },
                        {
                            "data": "product_name",
                            'name': "product.short_name",
                            'searchable': true,


                        },
                        {
                            "data": "_ticket_code",
                            'name': 'ticket_code',
                            'searchable': true,


                        },
                        {
                            "data": "_title",
                            "name": "title",
                            'searchable': true


                        },
                        {
                            "data": "_raising_date",
                            'name': 'raising_date',
                            'searchable': true,



                        },
                         {
                            "data": "_start_date",
                            'name': 'start_date',
                            'searchable': false,
                        },
                        {
                            "data": "_end_date",
                            'name': 'end_date',
                            'searchable': false,
                        },
                        {
                            "data": "_time",
                            'name': 'time',
                            'searchable': false,
                        },
                        {
                            "data": "status",
                            "name": "status.name",
                            'searchable': true

                        },
                        {
                            "data": "_issue_number",
                            "name": "ticket_number",
                            'searchable': true

                        },
                        {
                            "data": "assigine_to",
                            "name": "user.name",
                            'searchable': true

                        },
                        {data: 'action', name: 'action', orderable: false, searchable: false},
                    ],
                });
                t.on('order.dt search.dt', function() {
                    t.column(0, {
                        search: 'applied',
                        order: 'applied'
                    }).nodes().each(function(cell, i) {
                        cell.innerHTML = i + 1;


                    });
                }).draw();


            });
        </script>
    @endpush
@endsection
