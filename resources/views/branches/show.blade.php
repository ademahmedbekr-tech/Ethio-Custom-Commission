@extends('layouts.app')

@section('title', 'Branch Details')

@section('content')

<div class="card">

    <div class="card-header d-flex justify-content-between align-items-center">

        <h4 class="mb-0">
            Branch Details
        </h4>

        <div>

            <a href="{{ route('branches.edit', $branch->id) }}"
               class="btn btn-warning">

                Edit

            </a>

            <a href="{{ route('branches.index') }}"
               class="btn btn-secondary">

                Back

            </a>

        </div>

    </div>

    <div class="card-body">

        <div class="row">

            <div class="col-md-6 mb-4">

                <h6 class="text-muted">
                    Branch Name
                </h6>

                <p class="fw-semibold">
                    {{ $branch->name }}
                </p>

            </div>

            <div class="col-md-6 mb-4">

                <h6 class="text-muted">
                    Branch Code
                </h6>

                <p class="fw-semibold">
                    {{ $branch->code }}
                </p>

            </div>

            <div class="col-md-6 mb-4">

                <h6 class="text-muted">
                    Branch Type
                </h6>

                <p class="fw-semibold">
                    {{ $branch->branch_type ?? 'N/A' }}
                </p>

            </div>

            <div class="col-md-6 mb-4">

                <h6 class="text-muted">
                    Region
                </h6>

                <p class="fw-semibold">
                    {{ $branch->region ?? 'N/A' }}
                </p>

            </div>

            <div class="col-md-6 mb-4">

                <h6 class="text-muted">
                    City
                </h6>

                <p class="fw-semibold">
                    {{ $branch->city ?? 'N/A' }}
                </p>

            </div>

            <div class="col-md-6 mb-4">

                <h6 class="text-muted">
                    Phone
                </h6>

                <p class="fw-semibold">
                    {{ $branch->phone ?? 'N/A' }}
                </p>

            </div>

            <div class="col-md-6 mb-4">

                <h6 class="text-muted">
                    Email
                </h6>

                <p class="fw-semibold">
                    {{ $branch->email ?? 'N/A' }}
                </p>

            </div>

            <div class="col-md-6 mb-4">

                <h6 class="text-muted">
                    Status
                </h6>

                @if($branch->is_active)

                    <span class="badge bg-success">
                        Active
                    </span>

                @else

                    <span class="badge bg-danger">
                        Inactive
                    </span>

                @endif

            </div>

            <div class="col-md-12 mb-4">

                <h6 class="text-muted">
                    Address
                </h6>

                <p class="fw-semibold">
                    {{ $branch->address ?? 'N/A' }}
                </p>

            </div>

            <div class="col-md-6 mb-4">

                <h6 class="text-muted">
                    Created At
                </h6>

                <p class="fw-semibold">
                    {{ $branch->created_at->format('d M Y h:i A') }}
                </p>

            </div>

            <div class="col-md-6 mb-4">

                <h6 class="text-muted">
                    Last Updated
                </h6>

                <p class="fw-semibold">
                    {{ $branch->updated_at->format('d M Y h:i A') }}
                </p>

            </div>

        </div>

    </div>

</div>

@endsection
