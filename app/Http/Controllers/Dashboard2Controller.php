<?php

namespace App\Http\Controllers;

use App\Models\Announcement;
use App\Models\Weekly;
use App\Services\FacebookService;

class Dashboard2Controller extends Controller{

    public function index(){
        $urgent = Announcement::latest()->first();

            $citys = [
        'city1s' => 'Adaamaa',
        'city2s' => 'Amboo',
        'city3s' => 'Asallaa',
        'city4s' => 'Baatuu',
        'city5s' => 'Bishoooftuu',
        'city6s' => 'Burraayyuu',
        'city7s' => 'Dukaam',
        'city8s' => 'Finfinnee',
        'city9s' => 'Galaan',
        'city10s' => 'Holotaa',
        'city11s' => 'Jimmaa',
        'city12s' => 'Laga Xaafoo',
        'city13s' => 'Mojoo',
        'city14s' => 'Naqamtee',
        'city15s' => 'Roobee',
        'city16s' => 'Shaashamannee',
        'city17s' => 'Sabbataa',
        'city18s' => 'sulultaa',
        'city19s' => 'Walisoo',
    ];


      $cityCounts = [];

    foreach ($citys as $table => $name) {
        $cityCounts[] = [
            'city' => $name,
            'members' => \DB::table($table)->count()
        ];
    }
 $weekly = Weekly::where('category','zone')->select('zone','percent','total_plan','total_achieve','week')
            ->orderBy('total_achieve','ASC')
            ->get();
            // dd($weekly);

 $totals = Weekly::select([
        \DB::raw('SUM(qonnaa_bulaa) as total_qonnaa_bulaa'),
        \DB::raw('SUM(H_Mootummaa) as total_H_Mootummaa'),
        \DB::raw('SUM(J_magaalaa) as total_J_magaalaa'),
        \DB::raw('SUM(daldalaa_a_c) as total_daldalaa_a_c'),
        \DB::raw('SUM(geejjiba) as total_geejjiba'),
        \DB::raw('SUM(sector) as total_sector'),
        \DB::raw('SUM(total_plan) as total_plan'),
        \DB::raw('SUM(total_achieve) as total_achieve')
    ])->first();

  $category = Weekly::select('category')
        ->distinct()
        ->orderBy('category', 'ASC')
        ->pluck('category');
// $pageInfo = $facebook->getPageInfo();
        return view('dashboard2', [ 'cityCounts' => $cityCounts],compact('cityCounts','urgent','weekly','totals','category'));
    }

}
