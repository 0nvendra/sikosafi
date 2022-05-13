<?php

use App\Http\Controllers\AdminController;
use App\Http\Controllers\BookingController;
use App\Http\Controllers\FasilitasController;
use App\Http\Controllers\FrontController;
use App\Http\Controllers\RoomController;
use App\Http\Controllers\RuleController;
use App\Http\Controllers\TipeRoomController;
use App\Http\Controllers\UserController;
use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route::get('/', function () {
//     return Inertia::render('Welcome', [
//         'canLogin' => Route::has('login'),
//         'canRegister' => Route::has('register'),
//         'laravelVersion' => Application::VERSION,
//         'phpVersion' => PHP_VERSION,
//     ]);
// });
// 
#User Side / FrontEnd
Route::group(['prefix' => ''], function () {
    Route::get('/', [FrontController::class, 'index'])->name('front.index');
    Route::get('/tata-cara', [FrontController::class, 'tataCara'])->name('front.tata');
    Route::get('/rooms', [FrontController::class, 'room'])->name('front.room');
    Route::get('/peraturan', [FrontController::class, 'peraturan'])->name('front.rule');
    // Route::get('/booking', [FrontController::class, 'booking'])->name('front.booking');
    Route::get('/login', [UserController::class, 'getLogin'])->name('login');
    Route::post('/login', [UserController::class, 'postLogin'])->name('user.login');
    Route::get('/register', [UserController::class, 'getRegister'])->name('register');
    Route::post('/register', [UserController::class, 'postRegister'])->name('user.register');
    Route::get('/logout', [UserController::class, 'logout'])->name('logout');
    Route::get('/evaluasi', [UserController::class, 'evaluasi'])->name('evaluasi');
    Route::group(['middleware' => 'auth:web'], function () {
        Route::post('/order', [FrontController::class, 'newOrder'])->name('order');
        Route::get('/history-saya', [FrontController::class, 'history'])->name('front.history');
    });
});

// Route::get('/dashboard', function () {
//     return redirect()->route('user.index');
//     // return Inertia::render('Dashboard');
// })->middleware(['auth', 'verified'])->name('dashboard');
# Admin side
Route::get('/admin/login', [AdminController::class, 'login'])->name('admin.login');
Route::post('/admin/login', [AdminController::class, 'exec'])->name('admin.login.exec');
Route::get('/admin/logout', [AdminController::class, 'logout'])->name('admin.logout');

Route::group(['prefix' => 'admin', 'middleware' => 'auth:admin'], function () {
    Route::resource('user', UserController::class);
    Route::resource('admin', AdminController::class);
    Route::resource('rule', RuleController::class);
    Route::resource('tipeRoom', TipeRoomController::class);
    Route::resource('fasilitas', FasilitasController::class);
    Route::resource('room', RoomController::class);
    #booking
    Route::get('booking-approval', [BookingController::class, 'index'])->name('approval');
    Route::post('approve', [BookingController::class, 'approve'])->name('approve');
    Route::post('cancelOrder', [BookingController::class, 'cancelOrder'])->name('cancelOrder');
    Route::get('daftar-boking', [BookingController::class, 'listed'])->name('listed');
});
// require __DIR__ . '/auth.php';
