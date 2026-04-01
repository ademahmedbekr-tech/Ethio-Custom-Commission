@extends('layouts.app')







@section('content')
    <!-- Permission Table -->
    <div class="card">
        <div class="card-header border-bottom">
            <h5 class="card-title mb-0">Search Filters</h5>
            <div class="d-flex justify-content-between align-items-center row pt-4 gap-md-0 g-6">
                <div class="col-mb-4 align-content-end text-end">
                    <a href="#" class="btn btn-sm btn-primary" data-bs-toggle="modal"
                        data-bs-target="#addPermissionModal">
                        <i class="bx bx-plus"></i> Add New Permission
                    </a>
                </div>


            </div>
        </div>
        <div class="card-datatable table-responsive">
            <table class="table border-top">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Name</th>
                        <th>Assigned To</th>
                        <th>Created Date</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($permission as $permissions)
                        <tr>
                            <td> {{ $permissions->id }} </td>
                            <td> {{ $permissions->name }} </td>
                            <td> {{ $permissions->guard_name }} </td>
                            <td> {{ $permissions->created_at }} </td>
                            <td>
                                <div class="d-flex align-items-center">
                                    <span class="text-nowrap">
                                        <button class="btn btn-icon me-1" data-bs-target="#editPermissionModal"
                                            data-bs-toggle="modal" data-bs-dismiss="modal">
                                            <i class="icon-base bx bx-edit icon-md"></i>
                                        </button>
                                        <a href="javascript:;" class="btn btn-icon dropdown-toggle hide-arrow"
                                            data-bs-toggle="dropdown">
                                            <i class="icon-base bx bx-dots-vertical-rounded icon-md"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-end m-0">
                                            <a href="javascript:;" class="dropdown-item">Edit</a>
                                            <li>
                                                <form action="{{ route('permission.destroy', $permissions->id) }}" method="POST"
                                                    onsubmit="return confirm('Are you sure?');">
                                                    @csrf
                                                    @method('DELETE')
                                                    <button class="dropdown-item text-danger" type="submit">
                                                        Delete
                                                    </button>
                                                </form>
                                            </li>
                                        </div>
                                    </span>
                                </div>
                            </td>
                        </tr>
                    @endforeach

                </tbody>
            </table>
        </div>
        {{ $permission->appends(request()->query())->links('pagination::bootstrap-5') }}

    </div>
    <!--/ Permission Table -->

    <!-- Modal -->
    @include('_partials._modals.modal-add-permission')
    @include('_partials._modals.modal-edit-permission')
    <!-- /Modal -->
@endsection

