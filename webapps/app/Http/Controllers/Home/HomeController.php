<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\Ticket;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Spatie\Permission\Contracts\Role;

class HomeController extends Controller
{
    public $user;

    public function __construct()
    {
        $this->middleware(function($request, $next){
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

        if (Auth::user()->hasRole('Client')) {

            $auth_id = Auth::id();

            $get_product_id = User::where('id', $auth_id)->select('product_id')->first();
            // dd($get_product_id);

            // take variable product_wise_issue from var chart
            $product_wise_issue = DB::table('tickets')

                ->join('products', 'products.id', '=', 'tickets.product_id')

                ->select('short_name as label', DB::raw('count(*) as y'))

                ->groupBy('product_id')

                ->where('product_id', '=', $get_product_id->product_id)

                ->where('raised_by', '=', $auth_id)

                ->get();



            //for pie chart
            $pie_chart = DB::table('tickets')

                // ->join('statuses', 'statuses.id', '=', 'tickets.status_id')

                ->select('type as label',DB::raw('(CASE
                WHEN type = "E" THEN "Feature"
                WHEN type = "P" THEN "Problem"
                WHEN type = "C" THEN "Change request"
                WHEN type = "S" THEN "Support"
                ELSE "No"
                END) AS label'),DB::raw('count(*) as y'))

                ->groupBy('type')

                ->where('product_id', '=', $get_product_id->product_id)

                ->where('raised_by', '=', $auth_id)

                ->get();



            $total = Ticket::where('raised_by', $auth_id)
                ->where('product_id', $get_product_id->product_id)
                ->get();

            // created means new  count
            $new = Ticket::where(function ($query) use ($auth_id, $get_product_id) {
                $query->where('raised_by', $auth_id)->where('product_id', $get_product_id->product_id);
            })
                ->whereHas('status', function ($query) {
                    $query->where('name', 'Created');
                })->count();

            //resolved count
            $resolved = Ticket::where(function ($query) use ($auth_id, $get_product_id) {
                $query->where('raised_by', $auth_id)->where('product_id', $get_product_id->product_id);
            })
                ->whereHas('status', function ($query) {
                    $query->where('name', 'Resolved');
                })->count();

            //inprogress count
            $inprogress = Ticket::where(function ($query) use ($auth_id, $get_product_id) {
                $query->where('raised_by', $auth_id)->where('product_id', $get_product_id->product_id);
            })
                ->whereHas('status', function ($query) {
                    $query->where('name', 'Inprogress');
                })->count();

            //for graph
            $bar_chart = json_encode($product_wise_issue);
            $pie_chart = json_encode($pie_chart);


            return view('pages.home.index', compact('total', 'new', 'inprogress', 'resolved', 'bar_chart', 'pie_chart'));
        } else {

            //this query for graph and also bar graph
            $product_wise_issue = DB::table('tickets')

                ->join('products', 'products.id', '=', 'tickets.product_id')

                ->select('short_name as label', DB::raw('count(*) as y'))

                ->groupBy('product_id')

                ->get();

            // pie chart
            $pie_chart = DB::table('tickets')
                // ->join('statuses','statuses.id', '=', 'tickets.status_id')
                ->select('type as label',DB::raw('(CASE
                WHEN type = "E" THEN "Feature"
                WHEN type = "P" THEN "Problem"
                WHEN type = "C" THEN "Change request"
                WHEN type = "S" THEN "Support"
                ELSE "No"
                END) AS label'),DB::raw('count(*) as y'))

                ->groupBy('type')

                ->get();
            //  $pie_chart = DB::table('tickets')
            //  ->where('type',E)
            //  ->get();
            //  dd($pie_chart);


            $total = Ticket::all();

            $new = count(Ticket::whereHas('status', function ($query) {
                $query->where('name', 'Created');
            })->get());

            $resolved = count(Ticket::whereHas('status', function ($query) {
                $query->where('name', 'Resolved');
            })->get());

            $inprogress = count(Ticket::whereHas('status', function ($query) {
                $query->where('name', 'Inprogress');
            })->get());

            //product_wise_issue its taken for graph
            $bar_chart =  json_encode($product_wise_issue);
            $pie_chart = json_encode($pie_chart);

            return view('pages.home.index', compact('new', 'resolved', 'inprogress', 'total', 'bar_chart', 'pie_chart'));
        }
    }
    public function updateToken(Request $request)
    {
        $authUser = Auth::user()->id;
        $user = User::where('id', $authUser)->first();
        $user->fcm_token = $request->token;
        $user->save();
        return response()->json(['Token stored.']);
    }


    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
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
        //
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
