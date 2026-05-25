@extends('layouts.app')

@section('content')

<div class="card">

    <div class="card-header">
        <h4>Department Details</h4>
    </div>

    <div class="card-body">

        <p><b>Name:</b> {{ $department->name }}</p>
        <p><b>Code:</b> {{ $department->code }}</p>
        <p><b>Directorate:</b> {{ $department->directorate->name }}</p>
        <p><b>Branch:</b> {{ $department->directorate->branch->name }}</p>

    </div>

</div>

@endsection
