@extends('layouts.app')

@section('content')
    <div class="container">
        @if (session('success'))
            <div class="alert alert-success">{{ session('success') }}</div>
        @endif

        <div class="card">
            <div class="card-header">Create Report</div>
            <div class="card-body">
                <form action="{{ route('weekly.store') }}" method="POST" enctype="multipart/form-data">
                    @csrf


                    {{-- <div class="row mb-3">
                    <div class="col-md-6">
                        <label>Zone</label>
                        <select name="zone" id="zone" class="form-control">
                            <option value="">Select Zone</option>
                            @foreach ($zones as $zone)
                                <option value="{{ $zone }}">{{ $zone }}</option>
                            @endforeach
                        </select>
                    </div>

                    <div class="col-md-6">
                        <label>Week</label>
                        <select name="week" id="week" class="form-control">
                            <option value="">Select </option>
                        </select>
                    </div>
                </div> --}}
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <input type="text" name="zone" placeholder="Godina/City"
                                class="form-control @error('zone') is-invalid @enderror">
                            @error('zone')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>
                        <div class="col-md-6">
                            <input type="text" name="week" placeholder="week"
                                class="form-control @error('week') is-invalid @enderror">
                            @error('week')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-md-6">
                            <input type="number" name="qonnaa_bulaa" placeholder="Buusii Qonnaa Bulaa"
                                value="{{ old('qonnaa_bulaa') }}"
                                class="form-control @error('qonnaa_bulaa') is-invalid @enderror">
                            @error('qonnaa_bulaa')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>
                        <div class="col-md-6">
                            <input type="number" name="H_Mootummaa" placeholder="Hojjataa Mootummaa"
                                value="{{ old('H_Mootummaa') }}"
                                class="form-control @error('H_Mootummaa') is-invalid @enderror">
                            @error('H_Mootummaa')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-md-6">
                            <input type="number" name="J_magaalaa" placeholder="Jiraataa Magaalaa"
                                value="{{ old('J_magaalaa') }}"
                                class="form-control @error('J_magaalaa') is-invalid @enderror">
                            @error('J_magaalaa')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        <div class="col-md-6">
                            <input type="number" name="daldalaa_a_c" placeholder="Daladalaa A-C"
                                value="{{ old('daldalaa_a_c') }}"
                                class="form-control @error('daldalaa_a_c') is-invalid @enderror">
                            @error('daldalaa_a_c')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-md-6">
                            <input type="number" name="geejjiba" placeholder="Geejibaa fi Galii adda addaa"
                                value="{{ old('geejjiba') }}" class="form-control @error('geejjiba') is-invalid @enderror">
                            @error('geejjiba')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        <div class="col-md-6">
                            <input type="number" name="sector" placeholder="Sektaroota" value="{{ old('sector') }}"
                                class="form-control @error('sector') is-invalid @enderror">
                            @error('sector')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <select class="form-select" name="category">
                                <option value="">{{ __('--Select Category--') }}</option>
                                <option value="zone">Zone</option>
                                <option value="city">City</option>

                            </select>
                        </div>
                         <div class="col-md-6">
                            <input type="number" name="total_plan" placeholder="Plan" value="{{ old('total_plan') }}"
                                class="form-control @error('total_plan') is-invalid @enderror">
                            @error('total_plan')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                    </div>






                    <button class="btn btn-success" type="submit">Submit Report</button>
                </form>

            </div>
        </div>
    </div>
@endsection

@section('scripts')
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $('#zone').on('change', function() {
            let selectedZone = $(this).val();
            $('#week').html('<option value="">Loading...</option>');

            if (selectedZone) {
                $.ajax({
                    url: "/fetch-week/" + selectedZone,
                    type: "GET",
                    success: function(data) {
                        $('#week').empty();
                        $('#week').append('<option value="">Select Week</option>');
                        $.each(data, function(key, value) {
                            $('#week').append('<option value="' + value + '">' + value +
                                '</option>');
                        });
                    }
                });
            } else {
                $('#week').html('<option value="">Select week</option>');
            }
        });
    </script>
@endsection
