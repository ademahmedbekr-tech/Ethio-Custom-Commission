@extends('layouts.app')

@section('title', 'Create Branch')

@section('content')

<div class="card">

    <div class="card-header">

        <h4>Create Branch</h4>

    </div>

    <div class="card-body">

        <form action="{{ route('branches.store') }}"
              method="POST">

            @csrf

            <div class="row">

                <div class="col-md-6 mb-3">

                    <label>Name</label>

                    <input type="text"
                           name="name"
                           class="form-control"
                           required>

                </div>

                <div class="col-md-6 mb-3">

                    <label>Code</label>

                    <input type="text"
                           name="code"
                           class="form-control"
                           required>

                </div>

                <div class="col-md-6 mb-3">

                    <label>Branch Type</label>

                    <input type="text"
                           name="branch_type"
                           class="form-control">

                </div>

                <div class="col-md-6 mb-3">

                    <label>City</label>

                    <input type="text"
                           name="city"
                           class="form-control">

                </div>

                <div class="col-md-12 mb-3">

                    <label>Address</label>

                    <textarea name="address"
                              class="form-control"></textarea>

                </div>

            </div>

            <button class="btn btn-primary">
                Save Branch
            </button>

        </form>

    </div>

</div>

@endsection
