@extends('layouts.app')

@section('content')

<div class="card">

    <div class="card-header">
        <h4>Edit Department</h4>
    </div>

    <div class="card-body">

        <form action="{{ route('departments.update', $department->id) }}" method="POST">
            @csrf
            @method('PUT')

            <div class="mb-3">
                <label>Directorate</label>
                <select name="directorate_id" class="form-select">

                    @foreach($directorates as $dir)

                        <option value="{{ $dir->id }}"
                            {{ $department->directorate_id == $dir->id ? 'selected' : '' }}>

                            {{ $dir->name }}

                        </option>

                    @endforeach

                </select>
            </div>

            <div class="mb-3">
                <label>Name</label>
                <input type="text" name="name" class="form-control"
                       value="{{ $department->name }}">
            </div>

            <div class="mb-3">
                <label>Code</label>
                <input type="text" name="code" class="form-control"
                       value="{{ $department->code }}">
            </div>

            <div class="mb-3">
                <label>Description</label>
                <textarea name="description" class="form-control">
                    {{ $department->description }}
                </textarea>
            </div>

            <button class="btn btn-success">
                Update Department
            </button>

        </form>

    </div>

</div>

@endsection
