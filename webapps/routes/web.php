<?php

namespace App;

use Artisan;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Home\HomeController;
use App\Http\Controllers\Exports\ExportsController;
use App\Http\Controllers\User\Internal\UsersController;
use App\Http\Controllers\RolePermission\RolesController;
use App\Http\Controllers\Configuration\ProductsController;
use App\Http\Controllers\Ticket\Internal\TicketsController;
use App\Http\Controllers\User\Client\UsersClientController;
use App\Http\Controllers\RolePermission\PermissionsController;
use App\Http\Controllers\Configuration\OrganizationsController;
use App\Http\Controllers\Notification\ShowNotificationController;
use App\Http\Controllers\Report\TicketReportController;
use App\Http\Controllers\Ticket\Client\ClientTicketsController;


Route::get('/', function () {
    return redirect()->route('home.index');
})->middleware('auth');

//HOME VIEW
Route::resource('home', HomeController::class)->middleware(['auth']);

Route::group(['prefix' => 'user'], function () {
    //Authenticate user change password
    Route::get('change-password', [UsersController::class, 'changePasswordView'])->name('change.password');
    Route::post('change-password/{id}', [UsersController::class, 'changePassword'])->name('change_password.post');

    Route::group(['middleware' => ['auth']], function () {
        //USER
        Route::resource('users', UsersController::class);
         Route::get('update-profile/{id}',[UsersController::class,'updateProfile'])
        ->name('user.update.profile');
        Route::post('update-profile/{id}',[UsersController::class,'updateProfileStore'])
        ->name('user.update.profile.store');

        //CLIENT
        Route::resource('clients', UsersClientController::class);

        //ROLES
        Route::resource('roles', RolesController::class);

        //PERMISSIONS
        Route::resource('permissions', PermissionsController::class);

        //TICKETS:

        //INTERNAL
        Route::resource('tickets', TicketsController::class);
        route::get('load_ticket', [TicketsController::class, 'index_new'])->name('tickets.index_new');
        Route::get('assign_to_me/ticket',[TicketsController::class,'assign_to_me'])->name('assign_to_me');
        //TICKET REPORT
        Route::get('report/ticket', [TicketReportController::class, 'index'])->name('report.ticket');
        Route::get('report/ticket/index_new/{?id}', [TicketReportController::class, 'ticket_index_new'])->name('report.ticket.ajax');


        //EXPORT EXCEL FROM TICKETS
        Route::get('ticket/export', [ExportsController::class, 'ticketExport'])->name('tickets.export');
    });
});

//CLIENTS TICKET
Route::group(['prefix' => 'client', 'middleware' => ['auth']], function () {
    Route::resource('clients-ticket', ClientTicketsController::class);
});

//CONFIGURATION
Route::group(['prefix' => 'configuration', 'middleware' => ['auth']], function () {
    //ORGANIZATIONS
    Route::resource('organizations', OrganizationsController::class);

    //PRODUCTS
    Route::resource('products', ProductsController::class);

    Route::get('get/product/{id?}', [ProductsController::class, 'getProduct'])->name('get.product');
});


//FIREBASE NOTIFICATION
Route::post('/fcm-token', [HomeController::class, 'updateToken'])->name('fcmToken');
// Route::post('/send',[TicketsController::class,'notification'])->name('notification');
require __DIR__ . '/auth.php';



Route::get('seen-notification', [ShowNotificationController::class, 'store'])->name('seen.notification');
Route::get('count-notification', [ShowNotificationController::class, 'index'])->name('count.notification');


Route::get('/clear',function(){
     Artisan::call('cache:clear');
    return back();
});
