@extends('layouts.components.index2')
@section('model','Honorable')
@section('count',$count)
@section('title','Honorable')
@section('insert','Honorable')
@section('icons','medal')
@section('route',route('honorable.create'))
@section('import',route('honorable.import'))

@section('table')
   <table class="table table-bordered table-striped">
        <thead>
            <tr>
                {{-- <th>#</th> --}}
                <th>id</th>
                <th>First Name</th>
                <th>Middle Name</th>
                <th>Last Name</th>

                <th>Gender</th>
                <th>Age</th>
                <th>Woreda</th>
                <th>Address</th>
                <th>Contact</th>
                <th>Email</th>
                <th>Position</th>
                <th>Membership Type</th>
                <th>Membership Fee</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($reports as $key => $report)
                <tr>
                    {{-- <td>{{ ++$i }}</td> --}}
                    <td>{{ $report->id }}</td>
                    <td>{{ $report->first_name }}</td>
                    <td>{{ $report->middle_name }}</td>
                    <td>{{ $report->last_name }}</td>
                    <td>{{ $report->gender }}</td>
                    <td>{{ $report->age }}</td>
                    <td>{{ $report->woreda }}</td>
                    <td>{{ $report->address }}</td>
                    <td>{{ $report->contact_number }}</td>
                    <td>{{ $report->email }}</td>
                    <td>{{ $report->position }}</td>
                    <td>{{ $report->membership_type }}</td>
                    <td>{{ $report->membership_fee }}</td>
                    <td>
                        <div class="dropdown">
                            <button class="btn btn-sm btn-secondary dropdown-toggle" type="button"
                                id="actionDropdown{{ $report->id }}" data-bs-toggle="dropdown" aria-expanded="false">
                                Actions
                            </button>
                            <ul class="dropdown-menu" aria-labelledby="actionDropdown{{ $report->id }}">
                                {{-- Edit --}}
                                @can('honorable-edit')
                                    <li>
                                        <a class="dropdown-item" href="{{ route('honorable.edit', $report->id) }}">Edit</a>
                                    </li>
                                @endcan

                                {{-- Delete --}}
                                @can('honorable-delete')
                                    <li>
                                        <form action="{{ route('honorable.destroy', $report->id) }}" method="POST"
                                            onsubmit="return confirm('Are you sure?');">
                                            @csrf
                                            @method('DELETE')
                                            <button class="dropdown-item text-danger" type="submit">Delete</button>
                                        </form>
                                    </li>
                                @endcan

                                {{-- Pay / Paid --}}
                                <li>
                                    @if ($report->has_paid)
                                        <span class="dropdown-item text-success">Paid</span>
                                    @else
                                        <a class="dropdown-item text-warning"
                                            href="{{ route('honorable.pay', $report->id) }}">Pay</a>
                                    @endif
                                </li>
                            </ul>
                        </div>
                    </td>

                </tr>
            @endforeach
        </tbody>
    </table>
@endsection
