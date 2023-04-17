<?php

namespace App\Http\Controllers\Ticket\Client;

use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\Ticket;
use App\Models\User;
use App\Mail\ticketSendMail;
use App\Models\TicketImage;
use App\Services\ImageUpload;
use App\Services\NotificationServices;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\File;


class ClientTicketsController extends Controller
{
    public $user;
    public function __construct()
    {
        $this->middleware(function ($request, $next) {
            $this->user = Auth::guard('web')->user();
            return $next($request);
        });
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if (!$this->user->hasPermissionTo('client-tickets.list')) {
            return abort(403, 'Unauthoeized!');
        }
        $auth_id = Auth::id();
        $get_product_id =  User::where('id', $auth_id)->select('product_id')->first();
        $tickets = Ticket::where('raised_by', $auth_id)
            ->orWhere('product_id', $get_product_id->product_id)
            ->orderBy('id', 'desc')
            ->get();
        return view('pages.ticket.client.index', compact('tickets'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        if (!$this->user->hasPermissionTo('client-tickets.create')) {
            return abort(403, 'Unauthoeized!');
        }
        //get Auth Id
        $authId = Auth::id();

        //get ProductId
        $product_id_from_user = User::where('id', $authId)->select('product_id')->first();

        $ticketIds =  Ticket::where('product_id', $product_id_from_user->product_id)->get();



        return view('pages.ticket.client.create', compact('ticketIds'));
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
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
    public function store(Request $request)
    {
        if (!$this->user->hasPermissionTo('client-tickets.create')) {
            return abort(403, 'Unauthoeized!');
        }
        // dd($request->all());
        $request->validate([
            'title'             => 'required',
            'details'           => 'required',
            'type'              => 'required',
            'priority'          => 'required',
            'url'               => 'nullable',
            'ticket_number'     => 'nullable',
            'related_ticket_id' => 'nullable',
            'image'             => 'nullable'

        ]);

        //getting authenitcate id for raised by

        $auth_id = Auth::id();
        $product_id =   User::where('id', $auth_id)->select('product_id')->first();


        $user_id_get = Product::where('id', $product_id->product_id)->select('user_id')->first();

        $userd_email = User::where('id', $user_id_get->user_id)->first();



        $ticket = new Ticket();
        $ticket->title = $request->title;
        $ticket->user_id = $user_id_get->user_id;
        $ticket->raised_by = $auth_id;
        $ticket->product_id = $product_id->product_id;
        $ticket->details = $request->details;
        $ticket->type = $request->type;
        $ticket->raising_date = date("Y/m/d");
        $ticket->priority = $request->priority;
        $ticket->url = $request->url;
        $ticket->status_id = 7;
        $ticket->approved = 1;
        if ($request->related_ticket_id != NULL) {
            $ticket->related_ticket_id = $request->related_ticket_id;
        }

        $ticket->ticket_code = $this->TicketIdInfo($request->type, $product_id->product_id);  //type + product short_name + ticket_id (count)

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
        $ticket->save();

        //send push notification
        $productName = Product::where('id', $product_id->product_id)->select('name')->first();
        NotificationServices::FireBaseNotification($user_id_get->user_id, $productName->name);

        // Mail::to($userd_email->email)->cc('asif.raihan@appinionbd.com')->send(new ticketSendMail($ticket));

        //if you can send attach file then do this
        // $pdf = PDF::loadView('backend.pages.users.pdf',compact('user'));
        return redirect()->route('clients-ticket.index')->with('success', 'Ticket is successfully saved');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        if (!$this->user->hasPermissionTo('client-tickets.show')) {
            return abort(403, 'Unauthoeized!');
        }
        $ticket = Ticket::find($id);
        return view('pages.ticket.client.show', compact('ticket'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        if (!$this->user->hasPermissionTo('client-tickets.edit')) {
            return abort(403, 'Unauthoeized!');
        }
        $ticket = Ticket::find($id);
        $ticketIds = Ticket::get();

        return view('pages.ticket.client.edit', compact('ticket', 'ticketIds'));
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
        if (!$this->user->hasPermissionTo('client-tickets.update')) {
            return abort(403, 'Unauthoeized!');
        }

        // dd($request->all());
        $request->validate([
            'title'             => 'required|max:50|unique:tickets,title,' . $id,
            'details'           => 'required',
            'type'              => 'required',
            'priority'          => 'required',
            'url'               => 'nullable',
            'image'             => 'nullable',
            'related_ticket_id' => 'nullable',

        ]);

        //taking user id from product tavle in user_id
        $user_table_in_product_id = Auth::user()->product_id;
        // dd($user_table_in_product_id);
        $Assigine = Product::where('id', $user_table_in_product_id)->first();
        $assigine_id = $Assigine->user_id;


        $ticket =  Ticket::find($id);
        $ticket->title = $request->title;
        $ticket->user_id = $assigine_id;
        $ticket->product_id = Auth::user()->product_id;
        $ticket->details = $request->details;
        $ticket->type = $request->type;
        $ticket->raising_date = date("Y/m/d");
        $ticket->priority = $request->priority;
        $ticket->url = $request->url;
        $ticket->status_id = 2;
        $ticket->approved = 1;
        $ticket->related_ticket_id = $request->related_ticket_id;
        $ticket->ticket_code = $this->TicketIdInfo($request->type, $user_table_in_product_id);  //type + product short_name + ticket_id (count)
        $ticket->ticket_number = 0;

        $ticket->save();

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
        $ticket->save();

        return redirect()->route('clients-ticket.index')->with('success', 'Data has been updated successfully');
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
