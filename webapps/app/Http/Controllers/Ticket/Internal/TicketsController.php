<?php

namespace App\Http\Controllers\Ticket\Internal;

use App\DataTables\TicketDataTable;
use App\Exports\TicketsExport;
use App\Http\Controllers\Controller;
use App\Mail\ticketSendMail;
use App\Models\Product;
use App\Models\Status;
use App\Models\Ticket;
use App\Models\TicketImage;
use App\Models\User;
use App\Services\NotificationServices;
use Yajra\DataTables\DataTables;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Mail;
use Spatie\Permission\Models\Role;
use Illuminate\Support\Str;


class TicketsController extends Controller
{
    public $user;
    public function __construct()
    {
        $this->middleware(function ($request, $next) {
            $this->user = Auth::guard('web')->user();
            return $next($request);
        });
    }
    public function index(Request $request)
    {
        if (!$this->user->hasPermissionTo('admin-tickets.list')) {
            return abort(403, 'Unauthoeized!');
        }

        $users = User::whereHas('roles', function ($query) {
            $query->where('name', '!=', 'client');
        })->get();

        $products = Product::all();
        $statuses = Status::all();

        return view('pages.ticket.internal.index', compact('products', 'users', 'statuses'));
    }
    public function index_new(Request $request)
    {
        // dd($request->toArray());

        if (!$this->user->hasPermissionTo('admin-tickets.list')) {
            return abort(403, 'Unauthoeized!');
        }
       
        if(Auth::user()->roles->pluck('name')[0] == 'Admin' || Auth::user()->roles->pluck('name')[0] == 'super-admin' ){
            $tickets = Ticket::with([
            'product',
            'status',
            'user'
        ])
            ->when($request->product_id, function ($query) use ($request) {
                return $query->where('product_id', $request->product_id);
            })
            ->when($request->date, function ($query) use ($request) {
                return $query->where('raising_date', $request->date);
            })
            ->when($request->user_id, function ($query) use ($request) {
                return $query->where('tickets.user_id', $request->user_id);
            })
            ->when($request->status_id, function ($query) use ($request) {
                return $query->where('tickets.status_id', $request->status_id);
            })
            ->orderBy('id', 'desc')
            ->select(
                'tickets.*'
            );
        }else{
             $tickets = Ticket::with([
            'product',
            'status',
            'user'
        ])
            ->when($request->product_id, function ($query) use ($request) {
                return $query->where('product_id', $request->product_id);
            })
            ->when($request->date, function ($query) use ($request) {
                return $query->where('raising_date', $request->date);
            })
            ->when($request->user_id, function ($query) use ($request) {
                return $query->where('tickets.user_id', $request->user_id);
            })
            ->when($request->status_id, function ($query) use ($request) {
                return $query->where('tickets.status_id', $request->status_id);
            })
            ->orderBy('id', 'desc')
            ->where('tickets.user_id',Auth::id())
            ->select(
                'tickets.*'
            );
        }
        

        $result = DataTables::of($tickets)

            ->addIndexColumn()

            ->addColumn('product_name', function ($row) {
                return $row->product->short_name ?? '-';
            })
            ->addColumn('_ticket_code', function ($row) {
                return '<a style="text-decoration:underline" class="text-dark underline" href="' . route('tickets.show', $row->id) . '" target="_blank">' . $row->ticket_code . '</a>';
            })
            ->addColumn('_title', function ($row) {
                return '<a style="text-decoration:underline" class="text-dark underline" href="' . route('tickets.edit', $row->id) . '" target="_blank">' . Str::limit($row->title, 50) . '</a>';
            })
            ->addColumn('_raising_date', function ($row) {
                return $row->raising_date;
            })
            ->addColumn('_start_date', function ($row) {
                return $row->start_date;
            })
            ->addColumn('_end_date', function ($row) {
                return $row->end_date;
            })
            ->addColumn('_time', function ($row) {
                return $row->time;
            })
            ->addColumn('status', function ($row) {

                if ($row->status->name == 'Closed') {
                    return '<span class = "badge badge-danger">' . $row->status->name . '</span>';
                } elseif ($row->status->name == 'Created') {
                    return '<span class = "badge badge-primary">' . $row->status->name . '</span>';
                } elseif ($row->status->name == 'Resolved') {
                    return '<span class = "badge badge-success">' . $row->status->name . '</span>';
                } elseif ($row->status->name == 'Inprogress') {
                    return '<span class = "badge badge-info">' . $row->status->name . '</span>';
                } elseif ($row->status->name == 'Postponed') {
                    return '<span class = "badge badge-warning">' . $row->status->name . '</span>';
                } elseif ($row->status->name == 'Rejected') {
                    return '<span class = "badge badge-danger">' . $row->status->name . '</span>';
                } elseif ($row->status->name == 'Feedback') {
                    return '<span class = "badge badge-primary">' . $row->status->name . '</span>';
                }
            })
            ->addColumn('_issue_number', function ($row) {
                return $row->ticket_number;
            })
            ->addColumn('assigine_to', function ($row) {
                return $row->user->name;
            })
            ->addColumn('action', function ($row) {
                return '

                <a href="' . route('tickets.edit', $row->id) . '" title="Edit" class="edit"><img src="' . asset('images/default/edit1.gif') . '" border="0" alt="Payment"></a>


                <a href="' . route('tickets.show', $row->id) . '" title="View" class="View"><img src="' . asset('images/default/view1.gif') . '" border="0" alt="View"></a>
                ';
                //when comes condition then use this =>
                //   $btn ='<a href="'. route('client-visit.destroy', ['id' => $row->visit_id]) .'" onclick="return confirm_delete()"><i title="Delete" style="font-size: 15px" class="fas fa-trash"></i></a>';
            })
            ->rawColumns(['_ticket_code', '_title', 'status', 'action'])
            ->make(true);


        return $result;
    }

    public function assign_to_me()
    {
        $auth_id = Auth::id();
        return view('pages.ticket.internal.assign_to_me', compact('auth_id'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        if (!$this->user->hasPermissionTo('admin-tickets.create')) {
            return abort(403, 'Unauthoeized!');
        }

        $users = User::whereHas('roles', function ($query) {
            $query->where('name', '!=', 'Client');
        })->get();

        $products = Product::all();
        $statuses = Status::all();
        return view('pages.ticket.internal.create', compact('users', 'products', 'statuses'));
    }


    /**
     * type and product_id is come to parameter!
     * @return ticket_id for ticket_code
     */
    public function TicketIdInfo($type, $product_id)
    {
        if ($type == 'P') {
            $t = 'PR';
        } else if ($type == 'N') {
            $t = 'EH';
        } else if ($type == 'C') {
            $t = 'CR';
        } else {
            $t = 'SP';
        }

        $product_info = Product::where('id', $product_id)->select('id', 'short_name')->first();

        $count =  count(Ticket::where('product_id', $product_info->id)->get());
        $c = $count + 1;
        $product_code = $t . '-' . $product_info->short_name . '-' . $c;
        return $product_code;
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
  
    public function store(Request $request)
    {
        if (!$this->user->hasPermissionTo('admin-tickets.create')) {
            return abort(403, 'Unauthoeized!');
        }
        // dd($request->all());
        $request->validate([
            'title'             => 'required',
            'user_id'           => 'required',
            'product_id'        => 'required',
            'details'           => 'required',
            'type'              => 'required',
            'priority'          => 'required',
            'url'               => 'nullable',
            'status_id'         => 'required',
            'ticket_number'     => 'nullable',
            'related_ticket_id' => 'nullable',
            'image'             => 'nullable'

        ]);
        $auth_id = Auth::id();
        $ticket = new Ticket();
        $ticket_user_id = $ticket->user_id = $request->user_id;

        //email send user user
        $userd_email = User::where('id', $ticket_user_id)->first();
        $ticket->title = $request->title;
        $ticket->user_id = $request->user_id;
        $ticket->raised_by = $auth_id;
        $ticket->product_id = $request->product_id;
        $ticket->details = $request->details;
        $ticket->type = $request->type;
        $ticket->raising_date = date("Y/m/d");
        $ticket->start_date = $request->start_date;
        $ticket->end_date = $request->end_date;
        $ticket->time = $request->time;
        $ticket->priority = $request->priority;
        $ticket->url = $request->url;
        $ticket->status_id = $request->status_id;
        $ticket->approved = 1;
        $ticket->ticket_code = $this->TicketIdInfo($request->type, $request->product_id);  //type + product short_name + ticket_id (count)
        $ticket->ticket_number = $request->ticket_number;
        $ticket->save();

        if (isset($request->image) && count($request->image) > 0) {
            $i = 0;
            foreach ($request->image as $image) {
                $reImage = time() . $i . '.' . $image->getClientOriginalExtension();
                $dest = public_path('/images/tickets');
                $image->move($dest, $reImage);
                // save in database
                $image = new TicketImage();
                $image->ticket_id = $ticket->id;
                $image->image = $reImage;
                $image->save();
                $i++;
            }
        }

        // Mail::to($userd_email->email)->send(new ticketSendMail($ticket));

        //if you can send attach file then do this
        // $pdf = PDF::loadView('backend.pages.users.pdf',compact('user'));

        return redirect()->route('tickets.index')->with('success', 'Ticket is successfully saved');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        if (!$this->user->hasPermissionTo('admin-tickets.show')) {
            return abort(403, 'Unauthoeized!');
        }

        $ticket = Ticket::find($id);
        return view('pages.ticket.internal.show', compact('ticket'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        if (!$this->user->hasPermissionTo('admin-tickets.edit')) {
            return abort(403, 'Unauthoeized!');
        }

        $users = User::whereHas('roles', function ($query) {
            $query->where('name', '!=', 'Client');
        })->get();

        $products = Product::all();
        $statuses = Status::all();
        $ticket = Ticket::find($id);
        return view('pages.ticket.internal.edit', compact('ticket', 'products', 'statuses', 'users'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        if (!$this->user->hasPermissionTo('admin-tickets.update')) {
            return abort(403, 'Unauthoeized!');
        }

        $request->validate([
            'title'         => 'required',
            'user_id'       => 'required',
            'product_id'    => 'required',
            'details'       => 'required',
            'type'          => 'required',
            'priority'      => 'required',
            'url'           => 'nullable',
            'status_id'     => 'required',
            'ticket_number' => 'nullable',
            'root_cause'    => 'nullable',
            'image'         => 'nullable'

        ]);

        $ticket = Ticket::find($id);


        $ticket->title = $request->title;
        $ticket->user_id = $request->user_id;

        $ticket->product_id = $request->product_id;
        $ticket->details = $request->details;
        $ticket->type = $request->type;
        $ticket->priority = $request->priority;
        $ticket->start_date = $request->start_date;
        $ticket->end_date = $request->end_date;
        $ticket->time = $request->time;
        $ticket->url = $request->url;
        $ticket->status_id = $request->status_id;
        $ticket->root_cause = $request->root_cause;
        $ticket->ticket_number = $request->ticket_number;
        $ticket->save();
        //1 resolved and 5 closed
        // if ($request->status_id == 1 || $request->status_id == 5) {
        //     $productInfo = Product::where('id', $request->product_id)->first();
        //     //  dd($productInfo);
        //     $userId = User::where('product_id', $request->product_id)
        //         ->whereHas('roles', function ($query) {
        //             $query->where('name', 'Client');
        //         })->first();

        //     $getUserId = $userId->id;
        //     // dd($getUserId);
        //     $getProductName = $productInfo->name;
        //     // dd($getProductName);
        //     NotificationServices::FireBaseNotification($getUserId, $getProductName);
        //     Mail::to($userId->email)->send(new ticketSendMail($ticket));
        // }

        if (isset($request->image) && count($request->image) > 0) {
            TicketImage::where('ticket_id', $id)->delete();
            // previous image delete
            foreach ($ticket->images as $image) {
                if (File::exists('images/tickets/' . $image->image)) {
                    File::delete('images/tickets/' . $image->image);
                }
            }
            $i = 0;
            foreach ($request->image as $image) {
                $reImage = time() . $i . '.' . $image->getClientOriginalExtension();
                $dest = public_path('/images/tickets');
                $image->move($dest, $reImage);
                // save in database
                $image = new TicketImage();
                $image->ticket_id = $ticket->id;
                $image->image = $reImage;
                $image->save();
                $i++;
            }
        }

        //send push notification when status is Resolved

        return redirect()->route('tickets.index')->with('success', 'Data has been updated successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
