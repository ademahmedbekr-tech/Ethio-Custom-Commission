<?php
// app/Providers/FaydaServiceProvider.php

namespace App\Providers;

use App\Services\FaydaIDAService;
use Illuminate\Support\ServiceProvider;

class FaydaServiceProvider extends ServiceProvider
{
    public function register()
    {
        $this->app->singleton(FaydaIDAService::class, function ($app) {
            return new FaydaIDAService();
        });
    }

    public function boot()
    {
        // Publish configuration
        $this->publishes([
            __DIR__.'/../../config/fayda.php' => config_path('fayda.php'),
        ], 'fayda-config');
    }
}
