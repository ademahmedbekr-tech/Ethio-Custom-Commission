@extends('layouts.app')

@section('content')
    <div class="card">

        <div class="card-header d-flex justify-content-between">

            <h4 class="mb-0">Positions</h4>

            <a href="{{ route('departments.create') }}" class="btn btn-primary">

                Add Positions

            </a>

        </div>

        <div class="card-datatable table-responsive">

            <table class="table border-top table-striped">

                <thead>
                    <tr>
                        <th>#</th>
                        <th>Name</th>
                        <th>Capacity</th>
                        <th>Description</th>
                        <th>Directorate</th>
                        <th>Branch</th>
                        <th>Actions</th>
                    </tr>
                </thead>

                <tbody>

                    @foreach ($departments as $dept)
                        <tr>

                            <td>{{ $loop->iteration }}</td>

                            <td>{{ $dept->name }}</td>
                            <td>{{ $dept->capacity }}</td>
                            <td>{{ $dept->description }}</td>

                            <td>{{ $dept->directorate->name ?? 'N/A' }}</td>
                            <td>{{ $dept->branch?->name ?? 'N/A' }}</td>

                            <td>
                                <div class="d-flex gap-2">
                                    <a href="{{ route('departments.edit', $dept->id) }}" class="btn btn-warning btn-sm">

                                        <i class="bx bx-edit"></i>
                                    </a>

                                    <form action="{{ route('departments.destroy', $dept->id) }}" method="POST"
                                        class="d-inline">
                                        @csrf
                                        @method('DELETE')

                                        <button class="btn btn-danger btn-sm"
                                            onclick="return confirm('Delete department?')">
                                            <i class="bx bx-trash"></i>
                                        </button>
                                    </form>
                                </div>
                            </td>

                        </tr>
                    @endforeach

                </tbody>

            </table>

        </div>
        <div class="mt-3">
            {{ $departments->appends(request()->query())->links('pagination::bootstrap-5') }}
        </div>

    </div>
@endsection
