@extends('layouts.app', [
    'activePage' => 'user',
    'titlePage' => __('User'),
])

@section('title', 'Users')

@section('content')
    <div class="content">
        <div class="content-wrapper">
            <div class="container-xxl flex-grow-1 container-p-y">


                {{-- STAT CARDS --}}
                <div class="row g-6 mb-6">
                    <div class="col-sm-6 col-xl-3">
                        <div class="card">
                            <div class="card-body ">
                                <div class="d-flex align-items-start justify-content-between">
                                    <div class="content-left">
                                        <span class="text-heading">Users</span>
                                        <div class="d-flex align-items-center my-1">
                                            <h4 class="mb-0 me-2">{{ $users }}</h4>
                                            <p class="text-success mb-0">(+29%)</p>
                                        </div>
                                        <small>Total Users</small>
                                    </div>
                                    <div class="avatar">
                                        <span class="avatar-initial rounded bg-label-primary">
                                            <i class="icon-base bx bx-group icon-lg"></i>
                                        </span>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                    <div class="col-sm-6 col-xl-3 mb-3">
                        <div class="card">
                            <div class="card-body d-flex justify-content-between">
                                <div>
                                    <span class="text-heading">Roles</span>
                                    <div class="d-flex align-items-center my-1">
                                        <h4 class="mb-0 me-2"> {{ $userRole }} </h4>
                                        <p class="text-success mb-0">(+18%)</p>
                                    </div>
                                    <small>Total Roles</small>
                                </div>
                                <div class="avatar">
                                    <span class="avatar-initial rounded bg-label-danger">
                                        <i class="bx bx-user-plus icon-lg"></i>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-6 col-xl-3 mb-3">
                        <div class="card">
                            <div class="card-body d-flex justify-content-between">
                                <div>
                                    <span class="text-heading">Central Admin Roles</span>
                                    <div class="d-flex align-items-center my-1">
                                        <h4 class="mb-0 me-2"> {{ $admin }} </h4>
                                        <p class="text-danger mb-0">(-14%)</p>
                                    </div>
                                    <small>Total Admin Roles</small>
                                </div>
                                <div class="avatar">
                                    <span class="avatar-initial rounded bg-label-success">
                                        <i class="bx bx-user-check icon-lg"></i>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-6 col-xl-3 mb-3">
                        <div class="card">
                            <div class="card-body d-flex justify-content-between">
                                <div>
                                    <span class="text-heading">Zones Admin Roles</span>
                                    <div class="d-flex align-items-center my-1">
                                        <h4 class="mb-0 me-2"> {{ $zonal }}</h4>
                                        <p class="text-success mb-0">(+42%)</p>
                                    </div>
                                    <small>Zones & Cities Admin Roles</small>
                                </div>
                                <div class="avatar">
                                    <span class="avatar-initial rounded bg-label-warning">
                                        <i class="bx bx-user-voice icon-lg"></i>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                {{-- USERS TABLE --}}
                <div class="card mt-3">
                    <div class="card">
                        <div class="card-body">

                            <div class="text-end mb-3">
                                <a href="#" class="btn btn-sm btn-success" data-bs-toggle="modal"
                                    data-bs-target="#exampleModal">
                                    Add User
                                </a>
                            </div>

                            @include('users.create')

                            <div class="table-responsive">
                                <table class="table">
                                    <thead class="text-primary">
                                        <tr>
                                            <th>#</th>
                                            <th>Name</th>
                                            <th>Email</th>
                                            <th>Roles</th>
                                            <th class="text-end">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($data as $user)
                                            <tr>
                                                <td>{{ ++$i }}</td>
                                                <td>
                                                        <img src="{{ $user->profile_photo_path }}" class="w-px-40 h-auto rounded-circle"> {{ $user->name }}
                                                </td>
                                                <td>{{ $user->email }}</td>
                                                <td>
                                                    @foreach ($user->getRoleNames() as $role)
                                                        <span class="badge bg-info">{{ $role }}</span>
                                                    @endforeach
                                                </td>
                                                <td class="text-end">
                                                    @can('user-edit')
                                                        <a href="{{ route('users.edit', $user->id) }}"
                                                            class="btn btn-primary btn-sm">
                                                            Edit
                                                        </a>
                                                    @endcan

                                                    @can('user-delete')
                                                        {!! Form::open([
                                                            'method' => 'DELETE',
                                                            'route' => ['users.destroy', $user->id],
                                                            'style' => 'display:inline',
                                                        ]) !!}
                                                        {!! Form::submit('Delete', ['class' => 'btn btn-danger btn-sm']) !!}
                                                        {!! Form::close() !!}
                                                    @endcan
                                                </td>
                                            </tr>
                                        @endforeach
                                    </tbody>
                                </table>

                                {!! $data->links() !!}
                            </div>

                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
@endsection
