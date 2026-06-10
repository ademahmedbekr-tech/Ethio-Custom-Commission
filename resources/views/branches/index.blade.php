@extends('layouts.app')

@section('title', 'Branches')

@section('content')

    <div class="card">

        <div class="card-header d-flex justify-content-between">

            <h4 class="mb-0">Branches</h4>

            <a href="{{ route('branches.create') }}" class="btn btn-primary">

                Add Branch

            </a>

        </div>

        <div class="table-responsive">

            <table class="table">

                <thead>

                    <tr>
                        <th>#</th>
                        <th>Name</th>
                        <th>Code</th>
                        <th>Type</th>
                        <th>City</th>
                        <th>Directorates</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>

                </thead>

                <tbody>

                    @forelse($branches as $branch)
                        <tr>

                            <td>{{ $loop->iteration }}</td>

                            <td>{{ $branch->name }}</td>

                            <td>{{ $branch->code }}</td>

                            <td>{{ $branch->branch_type }}</td>

                            <td>{{ $branch->city }}</td>
                            <td>{{ $branch->directorates?->count() }}</td>

                            <td>

                                @if ($branch->is_active)
                                    <span class="badge bg-success">
                                        Active
                                    </span>
                                @else
                                    <span class="badge bg-danger">
                                        Inactive
                                    </span>
                                @endif

                            </td>

                            <td>
                                <a href="{{ route('branches.show', $branch->id) }}" class="btn btn-sm btn-info">

                                    <i class="bx bx-show"></i>


                                </a>

                                <a href="{{ route('branches.edit', $branch->id) }}" class="btn btn-sm btn-warning">

                                    <i class="bx bx-edit"></i>


                                </a>

                                <form action="{{ route('branches.destroy', $branch->id) }}" method="POST" class="d-inline">

                                    @csrf
                                    @method('DELETE')

                                    <button class="btn btn-sm btn-danger" onclick="return confirm('Delete branch?')">

                                        <i class="bx bx-trash"></i>


                                    </button>

                                </form>

                            </td>

                        </tr>

                    @empty

                        <tr>
                            <td colspan="7" class="text-center">
                                No branches found.
                            </td>
                        </tr>
                    @endforelse

                </tbody>

            </table>

        </div>
        <div class="mt-3">
            {{ $branches->appends(request()->query())->links('pagination::bootstrap-5') }}
        </div>
    </div>

@endsection
