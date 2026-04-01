@extends('layouts.components.index2')
@section('model','News')
@section('count',$count)
@section('title','News')
@section('insert','News')
@section('icons','news')
@section('route',route('news.create'))

@section('table')
<table class="table table-bordered table-striped">
    <thead>
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Content</th>
            <th>Image</th>
            <th>Document</th>
            <th>Video</th>
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
                        <img src="{{ $item->image }}" width="60" height="60" alt="News Image">
                    @endif
                </td>

                {{-- Document --}}
                <td>
                    @if($item->document)
                        <a href="{{ $item->document }}" download>{{ basename($item->document) }}</a>
                    @endif
                </td>

                {{-- Video --}}
                <td>
                    @if($item->video)
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#videoModal{{ $item->id }}">
                            Video
                        </button>

                        <div class="modal fade" id="videoModal{{ $item->id }}" tabindex="-1" aria-hidden="true">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title">Video</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                    </div>
                                    <div class="modal-body">
                                        <video width="100%" height="100%" controls>
                                            <source src="{{ $item->video }}" type="video/mp4">
                                            Your browser does not support the video tag.
                                        </video>
                                    </div>
                                </div>
                            </div>
                        </div>
                    @endif
                </td>

                {{-- Actions --}}
                <td>
                    <div class="dropdown">
                        <button class="btn btn-sm btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown">
                            Actions
                        </button>
                        <ul class="dropdown-menu">
                            @can('honorable-edit')
                                <li><a class="dropdown-item" href="{{ route('news.edit', $item->id) }}">Edit</a></li>
                            @endcan
                            @can('honorable-delete')
                                <li>
                                    <form action="{{ route('news.destroy', $item->id) }}" method="POST" onsubmit="return confirm('Are you sure?');">
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
