@extends('layouts.app')
@section('content')
    <!-- Permission Table -->
    <div class="card">
        <div class="card-datatable table-responsive">
            <table class="table border-top table-striped">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>LogName</th>
                        <th>Description</th>
                        <th>Changes</th>
                        <th>Created Date</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($activity as $notify)
                        <tr>
                            <td> {{ $notify->id }} </td>
                            <td> {{ $notify->log_name }} </td>
                            <td> {{ $notify->description }} </td>
                            <td>
                                @php
                                    $props = json_decode($notify->properties, true);
                                    $changes = [];

                                    if(isset($props['attributes']) && isset($props['old'])) {
                                        foreach($props['attributes'] as $key => $newValue) {
                                            $oldValue = $props['old'][$key] ?? null;
                                            if($oldValue != $newValue) {
                                                $changes[] = "<strong>{$key}:</strong> {$oldValue} → {$newValue}";
                                            }
                                        }
                                    }
                                @endphp

                                @if(!empty($changes))
                                    <small>{!! implode('<br>', $changes) !!}</small>
                                @else
                                    <small class="text-muted">No changes</small>
                                @endif
                            </td>
                            <td> {{ $notify->created_at->format('Y-m-d H:i:s') }} </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
        {{ $activity->appends(request()->query())->links('pagination::bootstrap-5') }}
    </div>
@endsection
