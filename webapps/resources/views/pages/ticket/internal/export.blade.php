<table>
    <thead>
        <tr>
            <th>Product Name</th>
            <th>Ticket Id</th>
            <th>Title</th>
            <th>Raising Date</th>
            <th>Status</th>
            <th>Issu Number</th>
            <th>Assigine To</th>
        </tr>
    </thead>
    <tbody>
        @foreach ($tickets as $ticket)
            <tr>
                <td>{{ $ticket->product->name ?? '' }}</td>
                <td>{{ $ticket->ticket_code }}</td>
                <td>
                    {{ $ticket->title }}
                </td>
                <td>{{ $ticket->raising_date ?? '' }}</td>
                <td>
                    {{ $ticket->status->name }}
                </td>

                <td>{{ $ticket->ticket_number }}</td>
                <td>{{ $ticket->user->name ?? '' }}</td>

            </tr>

        @endforeach
    </tbody>
</table>
