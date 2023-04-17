<?php

namespace App\Http\Controllers\Exports;

use App\Exports\TicketsExport;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Maatwebsite\Excel\Excel;

class ExportsController extends Controller
{
    public $excel ;
    public function __construct(Excel $excel)
    {
       $this->excel = $excel;
    }
    /**
     * search product wise
     * @param data for download excel
     */

    public function ticketExport(){
        
        return $this->excel->download(new TicketsExport, 'tickets.xlsx') ;
     }
}
