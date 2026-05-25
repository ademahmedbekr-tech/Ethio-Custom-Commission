@extends('layouts.app')
@section('content')
<div class="row g-6">
    <div class="col-md-6">
        <div class="card">
            <h5 class="card-header">{{ __('Maintainance Mode') }}</h5>
            <div class="card-body">
                <form action="{{ route('maintainance-mode-update') }}" method="POST" enctype="multipart/form-data">
                    @csrf
                    @method('PUT')

                    <div class="mb-4">
    <div class="col-sm-6 p-6">
        <div class="small fw-medium mb-4">{{ __('Maintainance Mode') }}</div>
        <label for="">{{ __('Maintainance Mode') }}</label>
        <div class="form-check form-switch">
            @if ($maintainance->status == 1)
                <input class="form-check-input" type="checkbox" id="status_toggle"
                       checked role="switch" name="maintainance_mode">
            @else
                <input class="form-check-input" type="checkbox" id="status_toggle"
                       role="switch" name="maintainance_mode">
            @endif
            <label class="form-check-label" for="status_toggle">
                {{ $maintainance->status == 1 ? __('Enabled') : __('Disabled') }}
            </label>
        </div>
    </div>
</div>

<script>
    // Update label text when toggled
    document.getElementById('status_toggle')?.addEventListener('change', function(e) {
        const label = document.querySelector('label[for="status_toggle"]');
        if (label) {
            label.textContent = e.target.checked ? '{{ __("Enabled") }}' : '{{ __("Disabled") }}';
        }
    });
</script>

                    <div class="mb-4">
                        <label for="existingImage" class="form-label">{{ __('Existing Image') }}</label>
                        <div class="mb-3">
                            <img src="{{ asset($maintainance->image) }}" width="200px" alt="Current image">
                        </div>
                    </div>

                    <div class="mb-4">
                        <label for="formFile" class="form-label">{{ __('New Image') }}</label>
                        <input class="form-control" type="file" id="formFile" name="image" />
                    </div>

                    <div class="mb-4">
                        <label class="form-label">{{ __('Description') }}</label>
                        <div id="snow-toolbar">
                            <span class="ql-formats">
                                <select class="ql-font"></select>
                                <select class="ql-size"></select>
                            </span>
                            <span class="ql-formats">
                                <button class="ql-bold"></button>
                                <button class="ql-italic"></button>
                                <button class="ql-underline"></button>
                                <button class="ql-strike"></button>
                            </span>
                            <span class="ql-formats">
                                <select class="ql-color"></select>
                                <select class="ql-background"></select>
                            </span>
                            <span class="ql-formats">
                                <button class="ql-script" value="sub"></button>
                                <button class="ql-script" value="super"></button>
                            </span>
                            <span class="ql-formats">
                                <button class="ql-header" value="1"></button>
                                <button class="ql-header" value="2"></button>
                                <button class="ql-blockquote"></button>
                                <button class="ql-code-block"></button>
                            </span>
                        </div>
                        <div id="snow-editor">
                            {!! $maintainance->description !!}
                        </div>
                        <textarea name="description" id="description-hidden" style="display:none;">{{ $maintainance->description }}</textarea>
                    </div>

                    <button class="btn btn-primary" type="submit">{{ __('Update') }}</button>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection
<script>
    // Update label text when toggled
    document.getElementById('status_toggle')?.addEventListener('change', function(e) {
        const label = document.querySelector('label[for="status_toggle"]');
        if (label) {
            label.textContent = e.target.checked ? '{{ __("Enabled") }}' : '{{ __("Disabled") }}';
        }
    });
</script>
