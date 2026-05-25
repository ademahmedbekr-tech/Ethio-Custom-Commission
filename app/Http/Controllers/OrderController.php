<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Notifications\RealTimeNotification;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    public function store(Request $request)
    {
        // Your order logic here

        // Send notification to user
        $user = auth()->user();
        $user->notify(new RealTimeNotification(
            'Order Confirmed! 🎉',
            "Your order #{$order->id} has been confirmed and is being processed.",
            'bx bx-check-circle',
            'success'
        ));

        // Send to admin
        $admin = User::where('role', 'admin')->first();
        if ($admin) {
            $admin->notify(new RealTimeNotification(
                'New Order Received',
                "Order #{$order->id} from {$user->name} needs attention.",
                'bx bx-cart',
                'warning'
            ));
        }

        return redirect()->back();
    }
}
