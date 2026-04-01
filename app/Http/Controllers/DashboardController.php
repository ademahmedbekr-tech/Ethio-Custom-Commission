<?php

namespace App\Http\Controllers;

use App\Models\News;
use App\Models\Zone1;
use App\Models\Announcement;
use App\Models\Employee;
use Illuminate\Http\Request;

class DashboardController
{
    public function __invoke(Request $request)
    {
$zones = [];
$city = [];

for ($i = 1; $i <= 21; $i++) {
    $zones[] = "zone{$i}s";
}
for($a = 1; $a <=19; $a++){
    $city[] = "city{$a}s";
}
$roles = \DB::table('roles')->count();
$officers = \DB::table('w_officers')->count();

$all = collect($zones)->sum(fn($z) => \DB::table($z)->count());
$allcity = collect($city)->sum(fn($c) => \DB::table($c)->count());
$woreda = \DB::table('woreda')->count();


// Optional: return or dd
// dd($total);

        $news = News::count();
        $count = Zone1::count();
        $announcement = Announcement::count();
        $members = Zone1::count();



    $zones = [

    'zone1s' => 'Addis Ababa',
    'zone2s' => 'Kaliti',
    'zone3s' => 'Modjo',
    'zone4s' => 'Dire Dawa',
    'zone5s' => 'Adama',
    'zone6s' => 'Hawassa',
    'zone7s' => 'Bahir Dar',
    'zone8s' => 'Kombolcha',
    'zone9s' => 'Mekelle',
    'zone10s' => 'Jimma',
    'zone11s' => 'Semera',
    'zone12s' => 'Jijiga',
    'zone13s' => 'Gambella',
    'zone14s' => 'Dawale',
    'zone15s' => 'Galafi',
    'zone16s' => 'Dewele',
    'zone17s' => 'Moyale',
    'zone18s' => 'Metema',
    'zone19s' => 'Humera',
    'zone20s' => 'Togochale',
    'zone21s' => 'Bole Airport',

    ];


      $zoneCounts = [];

    foreach ($zones as $table => $name) {
        $zoneCounts[] = [
            'zone' => $name,
            'members' => \DB::table($table)->count()
        ];
    }






 $orgs = [


    'arsii' => 'Addis Ababa',
    'arsii_lixaa' => 'Kaliti',
    'baalee' => 'Modjo',
    'b_bahaa' => 'Dire Dawa',
    'booranaa' => 'Adama',
    'b_baddalle' => 'Hawassa',
    'finfinnee' => 'Bahir Dar',
    'gujii' => 'Kombolcha',
    'g_lixaa' => 'Mekelle',
    'h_bahaa' => 'Jimma',
    'h_lixaa' => 'Semera',
    'h_g_wallaga' => 'Jijiga',
    'i_a_booraa' => 'Gambella',
    'jimmaa' => 'Dawale',
    'q_wallaga' => 'Galafi',
    'sh_bahaa' => 'Dewele',
    'sh_kaabaa' => 'Moyale',
    'sh_k_lixaa' => 'Metema',
    'sh_lixaa' => 'Humera',
    'wahaa' => 'Togochale',
    'w_lixaa' => 'Bole Airport'
    ];

   $orgacount = [];

    foreach ($orgs as $table => $name) {
        $orgacount[] = [
            'ahmed' => $name,
            'adem' => \DB::table($table)->count()
        ];
    }






$zonesposition =[
          'zone1s','zone2s','zone3s','zone4s','zone5s',
        'zone6s','zone7s','zone8s','zone9s','zone10s',
        'zone11s','zone12s','zone13s','zone14s','zone15s',
        'zone16s','zone17s','zone18s','zone19s','zone20s','zone21s'
    ];

     $positions = [
        'Qonnaan Bulaa',
        'Jiraata Magaala',
        'Daldala-A',
        'Daldala-B',
        'Daldala-C',
        'Hojjeta Motummaa'
    ];

    // Initialize position counters
    $positionCounts = array_fill_keys($positions, 0);

    foreach ($zonesposition as $zone) {
        foreach ($positions as $pos) {
            $count = \DB::table($zone)
                ->where('position', $pos)
                ->count();


            $positionCounts[$pos] += $count;
        }
    }

$zoneCounter = \DB::table('w_officers')
    ->select('zone', \DB::raw('COUNT(name) AS total'))
    ->groupBy('zone')
    ->pluck('total', 'zone')      // returns ["Sh/Kaaabaa" => 8]
    ->toArray();
    // dd($zoneCounter);
                // convert collection → array

$ethinicity = Employee::where('ethnicity','ኦሮሞ')->count();



        return view('dashboard',  compact('news', 'announcement', 'members','count','all','woreda','allcity','roles','officers','zoneCounts','ethinicity','orgacount','positionCounts','zonesposition','zoneCounter'),
        ['positionCounts' => $positionCounts],['zoneCounts' => $zoneCounts],['zoneCounter' => $zoneCounter]);
    }


    public function index2(){
        return view('dashboard2');
    }
}
