{{-- <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
    Launch demo modal
</button> --}}

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="card">
                <div class="card-body">

                    <div class="row">

                        <div class="col-lg-12 margin-tb">

                            <div class="pull-left">

                                <h2>Create New User</h2>

                            </div>



                        </div>

                    </div>


                    @if (count($errors) > 0)

                        <div class="alert alert-danger">

                            <strong>Whoops!</strong> There were some problems with your input.<br><br>

                            <ul>

                                @foreach ($errors->all() as $error)
                                    <li>{{ $error }}</li>
                                @endforeach

                            </ul>

                        </div>

                    @endif



                    {!! Form::open(['route' => 'users.store', 'method' => 'POST']) !!}

                    <div class="row">

                        <div class="col-xs-12 col-sm-12 col-md-12">

                            <div class="form-group">

                                <strong>Name:</strong>

                                {!! Form::text('name', null, ['placeholder' => 'Name', 'class' => 'form-control']) !!}

                            </div>

                        </div>

                        <div class="col-xs-12 col-sm-12 col-md-12">

                            <div class="form-group">

                                <strong>Email:</strong>

                                {!! Form::text('email', null, ['placeholder' => 'Email', 'class' => 'form-control']) !!}

                            </div>

                        </div>
                        {{-- <div class="col-xs-12 col-sm-12 col-md-12">

                            <div class="form-group">

                                <strong>Zone:</strong>

                                <select name="zone" id="zone" class="form-select">
                                    options from zone 1 to zone 21
                                    @for ($i = 1; $i <= 21; $i++) <option value="zone {{ $i }}">zone {{ $i }}</option>
                                        @endfor
                                </select>
                            </div>
                        </div> --}}


                        <div class="col-xs-12 col-sm-12 col-md-12">

                            <div class="form-group">

                                <strong>Password:</strong>

                                {!! Form::password('password', ['placeholder' => 'Password', 'class' => 'form-control']) !!}

                            </div>

                        </div>

                        <div class="col-xs-12 col-sm-12 col-md-12">

                            <div class="form-group">

                                <strong>Confirm Password:</strong>

                                {!! Form::password('confirm-password', ['placeholder' => 'Confirm Password', 'class' => 'form-control']) !!}

                            </div>

                        </div>
                        {{-- <div class="col-xs-12 col-sm-12 col-md-12">
                            <label class="form-label font-weight-bold text-dark">Branch Office <span
                                    class="text-danger">*</span></label>
                            <select name="branch_id" id="branch_selector" class="form-select" required>
                                <option value="" selected disabled>Select Branch</option>
                                @foreach ($branch as $branches)
                                    <option value="{{ $branches->id }}">{{ $branches->name }}</option>
                                @endforeach
                            </select>
                        </div> --}}

                        <div class="col-xs-12 col-sm-12 col-md-12">

                            <div class="form-group">

                                <strong>Role:</strong>

                                {!! Form::select('roles[]', $roles, [], ['class' => 'form-select']) !!}

                            </div>

                        </div>

                        <div class="col-xs-12 col-sm-12 col-md-12 text-center mt-3">

                            <button type="submit" class="btn btn-primary">Submit</button>

                        </div>

                    </div>

                    {!! Form::close() !!}

                </div>
            </div>
        </div>
    </div>
</div>
