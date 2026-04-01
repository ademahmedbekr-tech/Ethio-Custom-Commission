@extends('layouts.components.index2')
@section('model','Announcement')
@section('count',$count)
@section('title','Announcement')
@section('insert','Announcement')
@section('icons','microphone')
@section('route',route('announcement.create'))
@section('import',route('city1.import'))

@section('table')
<table class="table table-bordered table-striped">
    <thead>
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Content</th>
            <th>Image</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        @foreach($reports as $item)
            <tr>
                <td>{{ $item->id }}</td>
                <td>{{ $item->title }}</td>
                <td>{!! $item->content !!}</td>

                {{-- Image --}}
                <td>
                    @if($item->image)
                        <img src="{{ $item->image }}" width="60" height="60" alt="Announcement Image">
                    @endif
                </td>

                {{-- Actions --}}
                <td>
                    <div class="dropdown">
                        <button class="btn btn-sm btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown">
                            Actions
                        </button>
                        <ul class="dropdown-menu">
                            @can('announcement-edit')
                                <li><a class="dropdown-item" href="{{ route('announcement.edit', $item->id) }}">Edit</a></li>
                            @endcan
                            @can('announcement-delete')
                                <li>
                                    <form action="{{ route('announcement.destroy', $item->id) }}" method="POST" onsubmit="return confirm('Are you sure?');">
                                        @csrf
                                        @method('DELETE')
                                        <button class="dropdown-item text-danger">Delete</button>
                                    </form>
                                </li>
                            @endcan
                        </ul>
                    </div>
                </td>
            </tr>
        @endforeach
    </tbody>
</table>

@endsection
