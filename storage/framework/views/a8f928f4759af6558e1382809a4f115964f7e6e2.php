<?php $__env->startSection('content'); ?>

    <div class="row g-6">
        <div class="col-lg-8 mb-4 order-0">
            <div class="card">
                <div class="d-flex align-items-end row">
                    <div class="col-sm-7">
                        <div class="card-body">
                            <h5 class="card-title text-primary mb-3">Hi,<?php echo e(Auth::user()->name); ?></h5>
                                <p class="mb-4">
                                   <strong style="color: #36e43b;">Ethiopian Customs Commission</strong>  <span class="fw-bold"> (ODA) </span>
                                    works to eradicate poverty, gender inequality, and health disparities.
                                </p>

                                <a href="javascript:;" class="btn btn-sm btn-outline-primary">View Badges</a>
                        </div>
                    </div>
                    <div class="col-sm-5 text-center text-sm-left">
                        <div class="card-body pb-0 px-0 px-md-4">
                            <img src="<?php echo e(asset('Photo/Picture1.jpg')); ?>" height="140" alt="View Badge User"
                                />
                        </div>
                    </div>
                </div>
            </div>
        </div>
           
        <div class="col-lg-4 col-md-4 order-1">
            <div class="row">
                <div class="col-lg-6 col-md-12 col-6 mb-4">
                    <div class="card">
                        <div class="card-body">
                            <div class="card-title d-flex align-items-start justify-content-between">
                                <div class="avatar flex-shrink-0">
                                    <img src="<?php echo e(asset('dash/assets/img/front-pages/icons/user-success.svg')); ?>"
                                        alt="chart success" class="rounded" />
                                </div>
                                <div class="dropdown">
                                    <button class="btn p-0" type="button" id="cardOpt3" data-bs-toggle="dropdown"
                                        aria-haspopup="true" aria-expanded="false">
                                        <i class="bx bx-dots-vertical-rounded"></i>
                                    </button>
                                    <div class="dropdown-menu dropdown-menu-end" aria-labelledby="cardOpt3">
                                        <a class="dropdown-item" href="javascript:void(0);">View More</a>
                                        <a class="dropdown-item" href="javascript:void(0);">Delete</a>
                                    </div>
                                </div>
                            </div>
                            <span class="fw-semibold d-block mb-1">Total Members</span>
                            <h3 class="card-title mb-2"> <?php echo e($all); ?> </h3>
                            <small class="text-success fw-semibold"><i class="bx bx-up-arrow-alt"></i> <?php echo e(__('updates')); ?>

                            </small>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-12 col-6 mb-4">
                    <div class="card">
                        <div class="card-body">
                            <div class="card-title d-flex align-items-start justify-content-between">
                                <div class="avatar flex-shrink-0">
                                    
                                    <i class="bx bx-group rounded-circle"
                                        style="font-size: 30px; color:rgb(132, 219, 132)"></i>

                                </div>
                                <div class="dropdown">
                                    <button class="btn p-0" type="button" id="cardOpt6" data-bs-toggle="dropdown"
                                        aria-haspopup="true" aria-expanded="false">
                                        <i class="bx bx-dots-vertical-rounded"></i>
                                    </button>
                                    <div class="dropdown-menu dropdown-menu-end" aria-labelledby="cardOpt6">
                                        <a class="dropdown-item" href="javascript:void(0);">View More</a>
                                        <a class="dropdown-item" href="javascript:void(0);">Delete</a>
                                    </div>
                                </div>
                            </div>
                            <span> <?php echo e(__('Member officers')); ?> </span>
                            <h3 class="card-title text-nowrap mb-1"> <?php echo e($officers); ?> </h3>
                            <small class="text-success fw-semibold"><i class="bx bx-up-arrow-alt"></i> <?php echo e(__('updates')); ?>

                            </small>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="col-12 col-lg-8 order-2 order-md-3 order-lg-2 mb-4">
            <div class="card">
                <h5 class="card-header m-0 pb-3">Individuals & Organization Members</h5>
                <div id="zoneMembersChart" class="px-2" style="min-height: 200px;"></div>
            </div>
        </div>




        <!--/ Total Revenue -->
        <div class="col-12 col-md-8 col-lg-4 order-3 order-md-2">
            <div class="row">
                <div class="col-6 mb-4">
                    <div class="card">
                        <div class="card-body">
                            <div class="card-title d-flex align-items-start justify-content-between">
                                <div class="avatar flex-shrink-0">
                                    
                                    <i class="bx bx-map-alt" style="font-size: 50px; color:rgb(123, 207, 123)"></i>
                                    
                                    
                                </div>
                                <div class="dropdown">
                                    <button class="btn p-0" type="button" id="cardOpt4" data-bs-toggle="dropdown"
                                        aria-haspopup="true" aria-expanded="false">
                                        <i class="bx bx-dots-vertical-rounded"></i>
                                    </button>
                                    <div class="dropdown-menu dropdown-menu-end" aria-labelledby="cardOpt4">
                                        <a class="dropdown-item" href="javascript:void(0);">View More</a>
                                        <a class="dropdown-item" href="javascript:void(0);">Delete</a>
                                    </div>
                                </div>
                            </div>
                            <span class="d-block mb-1">Woreda</span>
                            <h3 class="card-title text-nowrap mb-2"> <?php echo e($woreda); ?> </h3>
                            <small class="text-success fw-semibold"><i class="bx bx-up-arrow-alt"></i>
                                <?php echo e(__('live updates')); ?></small>
                        </div>
                    </div>
                </div>
                <div class="col-6 mb-4">
                    <div class="card">
                        <div class="card-body">
                            <div class="card-title d-flex align-items-start justify-content-between">
                                <div class="avatar flex-shrink-0">
                                    
                                    <i class="bx bxs-group" style="font-size: 40px; color: #82cc85;"></i>

                                </div>
                                <div class="dropdown">
                                    <button class="btn p-0" type="button" id="cardOpt1" data-bs-toggle="dropdown"
                                        aria-haspopup="true" aria-expanded="false">
                                        <i class="bx bx-dots-vertical-rounded"></i>
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="cardOpt1">
                                        <a class="dropdown-item" href="javascript:void(0);">View More</a>
                                        <a class="dropdown-item" href="javascript:void(0);">Delete</a>
                                    </div>
                                </div>
                            </div>
                            <span class="fw-semibold d-block mb-1">Roles</span>
                            <h3 class="card-title mb-2"> <?php echo e($roles); ?> </h3>
                            <small class="text-success fw-semibold"><i class="bx bx-up-arrow-alt"></i>
                                <?php echo e(__('live updates')); ?></small>
                        </div>
                    </div>
                </div>
                <!-- </div>
                                                <div class="row"> -->
                <div class="col-12 mb-6">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex justify-content-between flex-sm-row flex-column gap-3">
                                <div class="d-flex flex-sm-column flex-row align-items-start justify-content-between">
                                    <div class="card-title">
                                        <h5 class="text-nowrap mb-2">Galii </h5>
                                        <span class="badge bg-label-warning rounded-pill">Year 2025</span>
                                    </div>
                                    <div class="mt-sm-auto">
                                        <small class="text-success text-nowrap fw-semibold"><i
                                                class="bx bx-chevron-up"></i>galii</small>
                                        <h3 class="mb-0"> ETB1.5B</h3>
                                    </div>
                                </div>
                                <div id="profileReportChart"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>



    









    <div class="row g-6">
        <!-- Order Statistics -->
        <div class="col-md-6 col-lg-4 col-xl-4 order-0 mb-4">
            <div class="card h-100">
                <div class="card-header d-flex align-items-center justify-content-between pb-0">
                    <div class="card-title mb-0">
                        <h5 class="m-0 me-2">Types Statistics</h5>
                        <small class="text-muted">119k Total Types</small>
                    </div>
                    <div class="dropdown">
                        <button class="btn p-0" type="button" id="orederStatistics" data-bs-toggle="dropdown"
                            aria-haspopup="true" aria-expanded="false">
                            <i class="bx bx-dots-vertical-rounded"></i>
                        </button>
                        <div class="dropdown-menu dropdown-menu-end" aria-labelledby="orederStatistics">
                            <a class="dropdown-item" href="javascript:void(0);">Select All</a>
                            <a class="dropdown-item" href="javascript:void(0);">Refresh</a>
                            <a class="dropdown-item" href="javascript:void(0);">Share</a>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <div class="d-flex flex-column align-items-center gap-1">
                            <h2 class="mb-2">
                                <?php echo e($positionCounts['Qonnaan Bulaa'] + $positionCounts['Daldala-C'] + $positionCounts['Daldala-B'] + $positionCounts['Daldala-A'] + $positionCounts['Hojjeta Motummaa']); ?>

                            </h2>
                            <span>Total Types</span>
                        </div>
                        <div id="positionPieChart"></div>
                    </div>
                    <ul class="p-0 m-0">
                        <li class="d-flex mb-4 pb-1">
                            <div class="avatar flex-shrink-0 me-3">
                                <span class="avatar-initial rounded bg-label-primary"><i class="bx bxs-group"></i></span>
                            </div>
                            <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                                <div class="me-2">
                                    <h6 class="mb-0">Qonnaan Bulaa</h6>
                                    <small class="text-muted">Farmers, Pastoralists</small>
                                </div>
                                <div class="user-progress">
                                    <small class="fw-semibold"> <?php echo e($positionCounts['Qonnaan Bulaa']); ?> </small>
                                </div>
                            </div>
                        </li>
                        <li class="d-flex mb-4 pb-1">
                            <div class="avatar flex-shrink-0 me-3">
                                <span class="avatar-initial rounded bg-label-success"><i class="bx bxs-group"></i></span>
                            </div>
                            <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                                <div class="me-2">
                                    <h6 class="mb-0">Daldalaa-C</h6>
                                    <small class="text-muted">C-Level Merchants</small>
                                </div>
                                <div class="user-progress">
                                    <small class="fw-semibold"> <?php echo e($positionCounts['Daldala-C']); ?> </small>
                                </div>
                            </div>
                        </li>
                        <li class="d-flex mb-4 pb-1">
                            <div class="avatar flex-shrink-0 me-3">
                                <span class="avatar-initial rounded bg-label-info"><i class="bx bxs-group"></i></span>
                            </div>
                            <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                                <div class="me-2">
                                    <h6 class="mb-0">Daldalaa-B + A</h6>
                                    <small class="text-muted">A+B</small>
                                </div>
                                <div class="user-progress">
                                    <small class="fw-semibold">
                                        <?php echo e($positionCounts['Daldala-A'] + $positionCounts['Daldala-B']); ?> </small>
                                </div>
                            </div>
                        </li>
                        <li class="d-flex">
                            <div class="avatar flex-shrink-0 me-3">
                                <span class="avatar-initial rounded bg-label-secondary"><i
                                        class="bx bxs-group"></i></span>
                            </div>
                            <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                                <div class="me-2">
                                    <h6 class="mb-0">Hojjeta Motummaa</h6>
                                    <small class="text-muted">Government Workers</small>
                                </div>
                                <div class="user-progress">
                                    <small class="fw-semibold"> <?php echo e($positionCounts['Hojjeta Motummaa']); ?> </small>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!--/ Order Statistics -->

        <!-- Expense Overview -->
        <div class="col-md-6 col-lg-4 order-1 mb-4">
            <div class="card h-100">
                
                <div class="card-body px-0">
                    <div class="tab-content p-0">
                        <div class="tab-pane fade show active" id="navs-tabs-line-card-income" role="tabpanel">
                            <div class="d-flex p-4 pt-3">
                                <div class="avatar flex-shrink-0 me-3">
                                    <img src="../assets/img/icons/unicons/wallet.png" alt="User" />
                                </div>
                                <div>
                                    <small class="text-muted d-block">Officer Members</small>
                                    <div class="d-flex align-items-center">
                                        <h6 class="mb-0 me-1"> <?php echo e($officers); ?> </h6>
                                        <small class="text-success fw-semibold">
                                            <i class="bx bx-group"></i>
                                            Members
                                        </small>
                                    </div>
                                </div>
                            </div>

                            <div id="zoneBarChart"></div>
                            
                        </div>
                    </div>
                </div>


            </div>
        </div>
        <div class="col-md-6 col-lg-4 order-1 mb-4">
            <div class="card h-100">
                
                <div class="card-body px-0">
                    <div class="tab-content p-0">
                        <div class="tab-pane fade show active" id="navs-tabs-line-card-income" role="tabpanel">
                            <div class="d-flex p-4 pt-3">
                                <div class="avatar flex-shrink-0 me-3">
                                    <img src="../assets/img/icons/unicons/wallet.png" alt="User" />
                                </div>
                                <div>
                                    <small class="text-muted d-block">Organization Members</small>
                                    <div class="d-flex align-items-center">
                                        <h6 class="mb-0 me-1"> <?php echo e($officers); ?> </h6>
                                        <small class="text-success fw-semibold">
                                            <i class="bx bx-group"></i>
                                            Members
                                        </small>
                                    </div>
                                </div>
                            </div>

                            <div id="Organization"></div>

                        </div>
                    </div>
                </div>


            </div>
        </div>
        <!--/ Expense Overview -->

        <!-- Transactions -->


        <!--/ Transactions -->
    </div>

      <div class="row">
        <div class="col-md-6 order-3 order-lg-4 mb-6 mb-lg-0">
                  <div class="card text-center h-100">
                    <div class="card-header nav-align-top">
                      <ul class="nav nav-pills flex-wrap row-gap-2" role="tablist">
                        <li class="nav-item">
                          <button
                            type="button"
                            class="nav-link active"
                            role="tab"
                            data-bs-toggle="tab"
                            data-bs-target="#navs-pills-browser"
                            aria-controls="navs-pills-browser"
                            aria-selected="true">
                            Browser
                          </button>
                        </li>
                        <li class="nav-item">
                          <button
                            type="button"
                            class="nav-link"
                            role="tab"
                            data-bs-toggle="tab"
                            data-bs-target="#navs-pills-os"
                            aria-controls="navs-pills-os"
                            aria-selected="false">
                            Operating System
                          </button>
                        </li>
                        <li class="nav-item">
                          <button
                            type="button"
                            class="nav-link"
                            role="tab"
                            data-bs-toggle="tab"
                            data-bs-target="#navs-pills-country"
                            aria-controls="navs-pills-country"
                            aria-selected="false">
                            Country
                          </button>
                        </li>
                      </ul>
                    </div>
                    <div class="tab-content pt-0 pb-4">
                      <div class="tab-pane fade show active" id="navs-pills-browser" role="tabpanel">
                        <div class="table-responsive text-start text-nowrap">
                          <table class="table table-borderless">
                            <thead>
                              <tr>
                                <th>No</th>
                                <th>Browser</th>
                                <th>Visits</th>
                                <th class="w-50">Data In Percentage</th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr>
                                <td>1</td>
                                <td>
                                  <div class="d-flex align-items-center">
                                    <img
                                      src="<?php echo e(asset('dash/assets/img/icons/brands/chrome.png')); ?>"
                                      alt="Chrome"
                                      height="24"
                                      class="me-3" />
                                    <span class="text-heading">Chrome</span>
                                  </div>
                                </td>
                                <td class="text-heading">8.92k</td>
                                <td>
                                  <div class="d-flex justify-content-between align-items-center gap-4">
                                    <div class="progress w-100" style="height: 10px">
                                      <div
                                        class="progress-bar bg-success"
                                        role="progressbar"
                                        style="width: 64.75%"
                                        aria-valuenow="64.75"
                                        aria-valuemin="0"
                                        aria-valuemax="100"></div>
                                    </div>
                                    <small class="fw-medium">64.75%</small>
                                  </div>
                                </td>
                              </tr>
                              <tr>
                                <td>2</td>
                                <td>
                                  <div class="d-flex align-items-center">
                                    <img
                                      src="<?php echo e(asset('dash/assets/img/icons/brands/safari.png')); ?>"
                                      alt="Safari"
                                      height="24"
                                      class="me-3" />
                                    <span class="text-heading">Safari</span>
                                  </div>
                                </td>
                                <td class="text-heading">1.29k</td>
                                <td>
                                  <div class="d-flex justify-content-between align-items-center gap-4">
                                    <div class="progress w-100" style="height: 10px">
                                      <div
                                        class="progress-bar bg-primary"
                                        role="progressbar"
                                        style="width: 18.43%"
                                        aria-valuenow="18.43"
                                        aria-valuemin="0"
                                        aria-valuemax="100"></div>
                                    </div>
                                    <small class="fw-medium">18.43%</small>
                                  </div>
                                </td>
                              </tr>
                              <tr>
                                <td>3</td>
                                <td>
                                  <div class="d-flex align-items-center">
                                    <img
                                      src="<?php echo e(asset('dash/assets/img/icons/brands/firefox.png')); ?>"
                                      alt="Firefox"
                                      height="24"
                                      class="me-3" />
                                    <span class="text-heading">Firefox</span>
                                  </div>
                                </td>
                                <td class="text-heading">328</td>
                                <td>
                                  <div class="d-flex justify-content-between align-items-center gap-4">
                                    <div class="progress w-100" style="height: 10px">
                                      <div
                                        class="progress-bar bg-info"
                                        role="progressbar"
                                        style="width: 8.37%"
                                        aria-valuenow="8.37"
                                        aria-valuemin="0"
                                        aria-valuemax="100"></div>
                                    </div>
                                    <small class="fw-medium">8.37%</small>
                                  </div>
                                </td>
                              </tr>
                              <tr>
                                <td>4</td>
                                <td>
                                  <div class="d-flex align-items-center">
                                    <img
                                      src="<?php echo e(asset('dash/assets/img/icons/brands/edge.png')); ?>"
                                      alt="Edge"
                                      height="24"
                                      class="me-3" />
                                    <span class="text-heading">Edge</span>
                                  </div>
                                </td>
                                <td class="text-heading">142</td>
                                <td>
                                  <div class="d-flex justify-content-between align-items-center gap-4">
                                    <div class="progress w-100" style="height: 10px">
                                      <div
                                        class="progress-bar bg-warning"
                                        role="progressbar"
                                        style="width: 6.12%"
                                        aria-valuenow="6.12"
                                        aria-valuemin="0"
                                        aria-valuemax="100"></div>
                                    </div>
                                    <small class="fw-medium">6.12%</small>
                                  </div>
                                </td>
                              </tr>
                              <tr>
                                <td>5</td>
                                <td>
                                  <div class="d-flex align-items-center">
                                    <img
                                      src="<?php echo e(asset('dash/assets/img/icons/brands/opera.png')); ?>"
                                      alt="Opera"
                                      height="24"
                                      class="me-3" />
                                    <span class="text-heading">Opera</span>
                                  </div>
                                </td>
                                <td class="text-heading">82</td>
                                <td>
                                  <div class="d-flex justify-content-between align-items-center gap-4">
                                    <div class="progress w-100" style="height: 10px">
                                      <div
                                        class="progress-bar bg-danger"
                                        role="progressbar"
                                        style="width: 2.12%"
                                        aria-valuenow="1.94"
                                        aria-valuemin="0"
                                        aria-valuemax="100"></div>
                                    </div>
                                    <small class="fw-medium">2.12%</small>
                                  </div>
                                </td>
                              </tr>
                              <tr>
                                <td>6</td>
                                <td>
                                  <div class="d-flex align-items-center">
                                    <img src="<?php echo e(asset('dash/assets/img/icons/brands/uc.png')); ?>" alt="uc" height="24" class="me-3" />
                                    <span class="text-heading">UC Browser</span>
                                  </div>
                                </td>
                                <td class="text-heading">328</td>
                                <td>
                                  <div class="d-flex justify-content-between align-items-center gap-4">
                                    <div class="progress w-100" style="height: 10px">
                                      <div
                                        class="progress-bar bg-danger"
                                        role="progressbar"
                                        style="width: 20.14%"
                                        aria-valuenow="1.94"
                                        aria-valuemin="0"
                                        aria-valuemax="100"></div>
                                    </div>
                                    <small class="fw-medium">20.14%</small>
                                  </div>
                                </td>
                              </tr>
                            </tbody>
                          </table>
                        </div>
                      </div>
                      <div class="tab-pane fade" id="navs-pills-os" role="tabpanel">
                        <div class="table-responsive text-start text-nowrap">
                          <table class="table table-borderless">
                            <thead>
                              <tr>
                                <th>No</th>
                                <th>System</th>
                                <th>Visits</th>
                                <th class="w-50">Data In Percentage</th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr>
                                <td>1</td>
                                <td>
                                  <div class="d-flex align-items-center">
                                    <img
                                      src="../../assets/img/icons/brands/windows.png"
                                      alt="Windows"
                                      height="24"
                                      class="me-3" />
                                    <span class="text-heading">Windows</span>
                                  </div>
                                </td>
                                <td class="text-heading">875.24k</td>
                                <td>
                                  <div class="d-flex justify-content-between align-items-center gap-4">
                                    <div class="progress w-100" style="height: 10px">
                                      <div
                                        class="progress-bar bg-success"
                                        role="progressbar"
                                        style="width: 61.5%"
                                        aria-valuenow="61.50"
                                        aria-valuemin="0"
                                        aria-valuemax="100"></div>
                                    </div>
                                    <small class="fw-medium">61.50%</small>
                                  </div>
                                </td>
                              </tr>
                              <tr>
                                <td>2</td>
                                <td>
                                  <div class="d-flex align-items-center">
                                    <img
                                      src="../../assets/img/icons/brands/mac.png"
                                      alt="Mac"
                                      height="24"
                                      class="me-3" />
                                    <span class="text-heading">Mac</span>
                                  </div>
                                </td>
                                <td class="text-heading">89.68k</td>
                                <td>
                                  <div class="d-flex justify-content-between align-items-center gap-4">
                                    <div class="progress w-100" style="height: 10px">
                                      <div
                                        class="progress-bar bg-primary"
                                        role="progressbar"
                                        style="width: 16.67%"
                                        aria-valuenow="16.67"
                                        aria-valuemin="0"
                                        aria-valuemax="100"></div>
                                    </div>
                                    <small class="fw-medium">16.67%</small>
                                  </div>
                                </td>
                              </tr>
                              <tr>
                                <td>3</td>
                                <td>
                                  <div class="d-flex align-items-center">
                                    <img
                                      src="../../assets/img/icons/brands/ubuntu.png"
                                      alt="Ubuntu"
                                      height="24"
                                      class="me-3" />
                                    <span class="text-heading">Ubuntu</span>
                                  </div>
                                </td>
                                <td class="text-heading">37.68k</td>
                                <td>
                                  <div class="d-flex justify-content-between align-items-center gap-4">
                                    <div class="progress w-100" style="height: 10px">
                                      <div
                                        class="progress-bar bg-info"
                                        role="progressbar"
                                        style="width: 12.82%"
                                        aria-valuenow="12.82"
                                        aria-valuemin="0"
                                        aria-valuemax="100"></div>
                                    </div>
                                    <small class="fw-medium">12.82%</small>
                                  </div>
                                </td>
                              </tr>
                              <tr>
                                <td>4</td>
                                <td>
                                  <div class="d-flex align-items-center">
                                    <img
                                      src="../../assets/img/icons/brands/chrome.png"
                                      alt="Chrome"
                                      height="24"
                                      class="me-3" />
                                    <span class="text-heading">Chrome</span>
                                  </div>
                                </td>
                                <td class="text-heading">8.34k</td>
                                <td>
                                  <div class="d-flex justify-content-between align-items-center gap-4">
                                    <div class="progress w-100" style="height: 10px">
                                      <div
                                        class="progress-bar bg-warning"
                                        role="progressbar"
                                        style="width: 6.25%"
                                        aria-valuenow="6.25"
                                        aria-valuemin="0"
                                        aria-valuemax="100"></div>
                                    </div>
                                    <small class="fw-medium">6.25%</small>
                                  </div>
                                </td>
                              </tr>
                              <tr>
                                <td>5</td>
                                <td>
                                  <div class="d-flex align-items-center">
                                    <img
                                      src="../../assets/img/icons/brands/cent.png"
                                      alt="Cent"
                                      height="24"
                                      class="me-3" />
                                    <span class="text-heading">Cent</span>
                                  </div>
                                </td>
                                <td class="text-heading">2.25k</td>
                                <td>
                                  <div class="d-flex justify-content-between align-items-center gap-4">
                                    <div class="progress w-100" style="height: 10px">
                                      <div
                                        class="progress-bar bg-danger"
                                        role="progressbar"
                                        style="width: 2.76%"
                                        aria-valuenow="2.76"
                                        aria-valuemin="0"
                                        aria-valuemax="100"></div>
                                    </div>
                                    <small class="fw-medium">2.76%</small>
                                  </div>
                                </td>
                              </tr>
                              <tr>
                                <td>6</td>
                                <td>
                                  <div class="d-flex align-items-center">
                                    <img
                                      src="../../assets/img/icons/brands/linux.png"
                                      alt="linux"
                                      height="24"
                                      class="me-3" />
                                    <span class="text-heading">Linux</span>
                                  </div>
                                </td>
                                <td class="text-heading">328k</td>
                                <td>
                                  <div class="d-flex justify-content-between align-items-center gap-4">
                                    <div class="progress w-100" style="height: 10px">
                                      <div
                                        class="progress-bar bg-danger"
                                        role="progressbar"
                                        style="width: 20.14%"
                                        aria-valuenow="2.76"
                                        aria-valuemin="0"
                                        aria-valuemax="100"></div>
                                    </div>
                                    <small class="fw-medium">20.14%</small>
                                  </div>
                                </td>
                              </tr>
                            </tbody>
                          </table>
                        </div>
                      </div>
                      <div class="tab-pane fade" id="navs-pills-country" role="tabpanel">
                        <div class="table-responsive text-start text-nowrap">
                          <table class="table table-borderless">
                            <thead>
                              <tr>
                                <th>No</th>
                                <th>Country</th>
                                <th>Visits</th>
                                <th class="w-50">Data In Percentage</th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr>
                                <td>1</td>
                                <td>
                                  <div class="d-flex align-items-center">
                                    <i class="fis fi fi-us rounded-circle fs-4 me-3"></i>
                                    <span class="text-heading">USA</span>
                                  </div>
                                </td>
                                <td class="text-heading">87.24k</td>
                                <td>
                                  <div class="d-flex justify-content-between align-items-center gap-4">
                                    <div class="progress w-100" style="height: 10px">
                                      <div
                                        class="progress-bar bg-success"
                                        role="progressbar"
                                        style="width: 38.12%"
                                        aria-valuenow="38.12"
                                        aria-valuemin="0"
                                        aria-valuemax="100"></div>
                                    </div>
                                    <small class="fw-medium">38.12%</small>
                                  </div>
                                </td>
                              </tr>
                              <tr>
                                <td>2</td>
                                <td>
                                  <div class="d-flex align-items-center">
                                    <i class="fis fi fi-br rounded-circle fs-4 me-3"></i>
                                    <span class="text-heading">Brazil</span>
                                  </div>
                                </td>
                                <td class="text-heading">42.68k</td>
                                <td>
                                  <div class="d-flex justify-content-between align-items-center gap-4">
                                    <div class="progress w-100" style="height: 10px">
                                      <div
                                        class="progress-bar bg-primary"
                                        role="progressbar"
                                        style="width: 28.23%"
                                        aria-valuenow="28.23"
                                        aria-valuemin="0"
                                        aria-valuemax="100"></div>
                                    </div>
                                    <small class="fw-medium">28.23%</small>
                                  </div>
                                </td>
                              </tr>
                              <tr>
                                <td>3</td>
                                <td>
                                  <div class="d-flex align-items-center">
                                    <i class="fis fi fi-in rounded-circle fs-4 me-3"></i>
                                    <span class="text-heading">India</span>
                                  </div>
                                </td>
                                <td class="text-heading">12.58k</td>
                                <td>
                                  <div class="d-flex justify-content-between align-items-center gap-4">
                                    <div class="progress w-100" style="height: 10px">
                                      <div
                                        class="progress-bar bg-info"
                                        role="progressbar"
                                        style="width: 14.82%"
                                        aria-valuenow="14.82"
                                        aria-valuemin="0"
                                        aria-valuemax="100"></div>
                                    </div>
                                    <small class="fw-medium">14.82%</small>
                                  </div>
                                </td>
                              </tr>
                              <tr>
                                <td>4</td>
                                <td>
                                  <div class="d-flex align-items-center">
                                    <i class="fis fi fi-au rounded-circle fs-4 me-3"></i>
                                    <span class="text-heading">Australia</span>
                                  </div>
                                </td>
                                <td class="text-heading">4.13k</td>
                                <td>
                                  <div class="d-flex justify-content-between align-items-center gap-4">
                                    <div class="progress w-100" style="height: 10px">
                                      <div
                                        class="progress-bar bg-warning"
                                        role="progressbar"
                                        style="width: 12.72%"
                                        aria-valuenow="12.72"
                                        aria-valuemin="0"
                                        aria-valuemax="100"></div>
                                    </div>
                                    <small class="fw-medium">12.72%</small>
                                  </div>
                                </td>
                              </tr>
                              <tr>
                                <td>5</td>
                                <td>
                                  <div class="d-flex align-items-center">
                                    <i class="fis fi fi-fr rounded-circle fs-4 me-3"></i>
                                    <span class="text-heading">France</span>
                                  </div>
                                </td>
                                <td class="text-heading">2.21k</td>
                                <td>
                                  <div class="d-flex justify-content-between align-items-center gap-4">
                                    <div class="progress w-100" style="height: 10px">
                                      <div
                                        class="progress-bar bg-danger"
                                        role="progressbar"
                                        style="width: 7.11%"
                                        aria-valuenow="7.11"
                                        aria-valuemin="0"
                                        aria-valuemax="100"></div>
                                    </div>
                                    <small class="fw-medium">7.11%</small>
                                  </div>
                                </td>
                              </tr>
                              <tr>
                                <td>6</td>
                                <td>
                                  <div class="d-flex align-items-center">
                                    <i class="fis fi fi-ca rounded-circle fs-4 me-3"></i>
                                    <span class="text-heading">Canada</span>
                                  </div>
                                </td>
                                <td class="text-heading">22.35k</td>
                                <td>
                                  <div class="d-flex justify-content-between align-items-center gap-4">
                                    <div class="progress w-100" style="height: 10px">
                                      <div
                                        class="progress-bar bg-danger"
                                        role="progressbar"
                                        style="width: 15.13%"
                                        aria-valuenow="7.11"
                                        aria-valuemin="0"
                                        aria-valuemax="100"></div>
                                    </div>
                                    <small class="fw-medium">15.13%</small>
                                  </div>
                                </td>
                              </tr>
                            </tbody>
                          </table>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
        <div class="col-xxl-6 col-lg-7 order-1">
            <div class="card h-100">
                <div class="card-header d-flex align-items-center justify-content-between">
                    <div class="card-title mb-0">
                        <h5 class="mb-1">Shipment statistics</h5>
                        <p class="card-subtitle">Total number of deliveries 23.8k</p>
                    </div>
                    <div class="btn-group">
                        <button type="button" class="btn btn-label-primary">January</button>
                        <button type="button" class="btn btn-label-primary dropdown-toggle dropdown-toggle-split"
                            data-bs-toggle="dropdown" aria-expanded="false">
                            <span class="visually-hidden">Toggle Dropdown</span>
                        </button>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="javascript:void(0);">January</a></li>
                            <li><a class="dropdown-item" href="javascript:void(0);">February</a></li>
                            <li><a class="dropdown-item" href="javascript:void(0);">March</a></li>
                            <li><a class="dropdown-item" href="javascript:void(0);">April</a></li>
                            <li><a class="dropdown-item" href="javascript:void(0);">May</a></li>
                            <li><a class="dropdown-item" href="javascript:void(0);">June</a></li>
                            <li><a class="dropdown-item" href="javascript:void(0);">July</a></li>
                            <li><a class="dropdown-item" href="javascript:void(0);">August</a></li>
                            <li><a class="dropdown-item" href="javascript:void(0);">September</a></li>
                            <li><a class="dropdown-item" href="javascript:void(0);">October</a></li>
                            <li><a class="dropdown-item" href="javascript:void(0);">November</a></li>
                            <li><a class="dropdown-item" href="javascript:void(0);">December</a></li>
                        </ul>
                    </div>
                </div>
                <div class="card-body">
                    <div id="shipmentStatisticsChart"></div>
                </div>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        var options = {
            chart: {
                height: 350,
                stacked: false,
                type: 'area',
                toolbar: {
                    show: true
                }
            },



            dataLabels: {
                enabled: false
            },

            stroke: {
                curve: 'smooth',
                width: 2.5,
                lineCap: 'round'
            },

            legend: {
                show: true,
                horizontalAlign: 'center',
                position: 'top',
                markers: {
                    height: 8,
                    width: 8,
                    radius: 12,
                    offsetX: -3
                },
                itemMargin: {
                    horizontal: 10
                }
            },

            // 🔥 Two datasets, separate Y-axes
            series: [{
                    name: 'Individual Members',
                    data: <?php echo json_encode(array_column($zoneCounts, 'members'), 512) ?>,
                    yAxisIndex: 0
                },
                {
                    name: 'Organization Members',
                    data: <?php echo json_encode(array_column($orgacount, 'adem'), 512) ?>,
                    yAxisIndex: 1
                }
            ],

            // 🔥 Dual Y-axis fix
            yaxis: [{
                    title: {
                        text: "Individual Members"
                    },
                    labels: {
                        formatter: val => val.toLocaleString()
                    }
                },
                {
                    opposite: true,
                    title: {
                        text: "Organization Members"
                    },
                    labels: {
                        formatter: val => val.toLocaleString()
                    }
                }
            ],

            xaxis: {
                categories: <?php echo json_encode(array_column($zoneCounts, 'zone'), 512) ?>
            },

            title: {
                text: 'Members in Each Zone',
                align: 'center'
            }
        };

        var chart = new ApexCharts(document.querySelector("#zoneMembersChart"), options);
        chart.render();
    });
</script>


<script>
    document.addEventListener("DOMContentLoaded", function() {
        var options = {
            chart: {
                type: 'area',
                height: 300
            },
            stroke: {
                curve: 'smooth',
                width: 3,
                lineCap: 'round'
            },
            legend: {
                show: true,
                horizontalAlign: 'left',
                position: 'top',
                markers: {
                    height: 8,
                    width: 8,
                    radius: 12,
                    offsetX: -3
                },

                itemMargin: {
                    horizontal: 10
                }
            },



            series: [{
                name: 'Members',
                data: <?php echo json_encode(array_column($orgacount, 'adem'), 512) ?>
            }],
            xaxis: {
                categories: <?php echo json_encode(array_column($orgacount, 'ahmed'), 512) ?>
            },
            plotOptions: {
                bar: {
                    borderRadius: 20,
                    horizontal: false,
                }
            },
            stroke: {
                curve: 'smooth' // This makes the line smooth instead of jagged
            },
            dataLabels: {
                enabled: false
            },
            title: {
                text: 'Organization Members',
                align: 'center'
            }
        };

        var chart = new ApexCharts(document.querySelector("#Organization"), options);
        chart.render();
    });
</script>

<script>
    document.addEventListener("DOMContentLoaded", function() {

        var positionCounts = <?php echo json_encode($positionCounts, 15, 512) ?>;

        var options = {
            chart: {
                type: 'donut',
                height: 200
            },
            grid: {
                padding: {
                    top: 0,
                    bottom: 0,
                    right: 15
                }
            },



            series: Object.values(positionCounts),
            labels: Object.keys(positionCounts),
            //  colors: [config.colors.danger, config.colors.secondary, config.colors.info, config.colors.success,config.colors.primary],
            legend: {
                show: false
            },
            dataLabels: {
                enabled: false
            }
        };



        var chart = new ApexCharts(
            document.querySelector("#positionPieChart"),
            options
        );

        chart.render();
    });
</script>




<script>
    document.addEventListener("DOMContentLoaded", function() {

        const typeMemberChart = document.querySelector('#zoneBarChart');

        if (!typeMemberChart) {
            console.error("Chart container #typeMember not found!");
            return;
        }

        const zoneLabels = <?php echo json_encode(array_keys($zoneCounter), 15, 512) ?>;
        const zoneValues = <?php echo json_encode(array_values($zoneCounter), 15, 512) ?>;

        const chartConfig = {
            chart: {
                type: 'area',
                height: 300
            },
            dataLabels: {
                enabled: false
            },

            markers: {
                size: 6,
                colors: 'transparent',
                strokeColors: 'transparent',
                strokeWidth: 3,
                discrete: [{
                    fillColor: config.colors.success,
                    seriesIndex: 0,
                    dataPointIndex: 20,
                    strokeColor: config.colors.success,
                    strokeWidth: 2,
                    size: 6,
                    radius: 8
                }],
                hover: {
                    size: 7
                }
            },
            series: [{
                name: 'Officers',
                data: zoneValues
            }],
            xaxis: {
                categories: zoneLabels
            },
            // colors: [config.colors.primary]
        };

        const chart = new ApexCharts(typeMemberChart, chartConfig);
        chart.render();

    });
</script>






<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\Users\ODA-IT\Documents\GitHub\ECC\ODA-Membership\ODA-Membership\resources\views/dashboard.blade.php ENDPATH**/ ?>