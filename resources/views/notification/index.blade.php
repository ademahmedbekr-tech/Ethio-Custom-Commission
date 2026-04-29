@extends('layouts.app')
@section('content')
    <!-- Permission Table -->
    <div class="card">

        <div class="card-datatable table-responsive">
            <table class="table border-top">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>LogName</th>
                        <th>Description</th>
                        <th>Created Date</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($activity as $notify)
                        <tr>
                            <td> {{ $notify->id }} </td>
                            <td> {{ $notify->log_name }} </td>
                            <td> {{ $notify->description }} </td>
                            <td> {{ $notify->created_at }} </td>

                        </tr>
                    @endforeach

                </tbody>
            </table>
        </div>
        {{ $activity->appends(request()->query())->links('pagination::bootstrap-5') }}

    </div>
    <!--/ Permission Table -->

    <!-- Modal -->

    <!-- /Modal -->
@endsection

