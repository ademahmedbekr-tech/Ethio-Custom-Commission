@extends('layouts.app')

@section('content')

<div class="card">

    <div class="card-header">
        <h4>Create Department</h4>
    </div>

    <div class="card-body">

        <form action="{{ route('departments.store') }}" method="POST">
            @csrf

            <div class="mb-3">
    <label>Directorate</label>
    <select name="directorate_id" class="form-select">
        <option value="">Select Directorate</option>
        @foreach($directorates as $dir)
            <option value="{{ $dir->id }}">
                {{ $dir->name }}
                ({{ $dir->branch?->name ?? 'No Branch' }})
            </option>
        @endforeach
    </select>
</div>

            <div class="mb-3">
                <label>Name</label>
                <input type="text" name="name" class="form-control">
            </div>

            <div class="mb-3">
                <label>Code</label>
                <input type="text" name="code" class="form-control">
            </div>

            <div class="mb-3">
                <label>Description</label>
                <textarea name="description" class="form-control"></textarea>
            </div>

            <button class="btn btn-primary">
                Save Department
            </button>

        </form>

    </div>

</div>

@endsection
