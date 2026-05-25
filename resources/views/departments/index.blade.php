@extends('layouts.app')

@section('content')

<div class="card">

     <div class="card-header d-flex justify-content-between">

        <h4 class="mb-0">Positions</h4>

        <a href="{{ route('departments.create') }}"
           class="btn btn-primary">

            Add Positions

        </a>

    </div>

    <div class="table-responsive">

        <table class="table">

            <thead>
                <tr>
                    <th>#</th>
                    <th>Name</th>
                    <th>Code</th>
                    <th>Directorate</th>
                    <th>Branch</th>
                    <th>Actions</th>
                </tr>
            </thead>

            <tbody>

                @foreach($departments as $dept)

                <tr>

                    <td>{{ $loop->iteration }}</td>

                    <td>{{ $dept->name }}</td>
                    <td>{{ $dept->code }}</td>

                    <td>{{ $dept->directorate->name ?? 'N/A' }}</td>
                    <td>{{ $dept->directorate?->branch?->name ?? 'N/A' }}</td>

                    <td>
                        <a href="{{ route('departments.edit', $dept->id) }}" class="btn btn-warning btn-sm">
                            Edit
                        </a>

                        <form action="{{ route('departments.destroy', $dept->id) }}" method="POST" class="d-inline">
                            @csrf
                            @method('DELETE')

                            <button class="btn btn-danger btn-sm"
                                    onclick="return confirm('Delete department?')">
                                Delete
                            </button>
                        </form>
                    </td>

                </tr>

                @endforeach

            </tbody>

        </table>

    </div>

</div>

@endsection
