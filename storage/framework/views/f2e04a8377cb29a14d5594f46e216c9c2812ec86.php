 <?php
    //  $notification = \Spatie\Activitylog\Models\Activity::latest()->with('subject')->first();
     $unReadMessages = \Spatie\Activitylog\Models\Activity::where('seen',0)->count();

 ?>

<aside id="layout-menu" class="layout-menu menu-vertical menu">

    <div class="app-brand demo">
        <a href="#" class="app-brand-link">
            <span class="app-brand-logo demo">
                <img src="<?php echo e(asset('front/images/Picture1.jpg')); ?>" height="40em" width="40em"
                    style="border-radius: 50%">
                
            </span>
            <span class="app-brand-text demo menu-text fw-bolder text-capitalize ms-2">ECC-GK</span>
        </a>

        <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto">
            <i class="icon-base bx bx-chevron-left"></i>
        </a>
    </div>

    <div class="menu-inner-shadow"></div>

    <ul class="menu-inner py-1">

        <li class="menu-item <?php echo e(Request::is('admin') ? 'active' : ''); ?> <?php echo e(Request::is('admin') ? 'open' : ''); ?>">
            <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class="menu-icon icon-base bx bx-home-smile"></i>
                <div data-i18n="Dashboards">Dashboards</div>
                
            </a>
            <ul class="menu-sub">
                <li class="menu-item <?php echo e(Request::is('admin') ? 'active' : ''); ?> ">
                    <a href="<?php echo e(route('dashboard')); ?>" class="menu-link">
                        <div data-i18n="Analytics">Analytics</div>
                    </a>
                </li>
                

            </ul>
        </li>
        <!-- Dashboard -->

        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('user-list')): ?>
            <li class="menu-item <?php echo e(Request::is('users') ? 'active' : ''); ?>">
                <a href="<?php echo e(route('users.index')); ?>" class="menu-link">
                    <i class="menu-icon tf-icons bx bx-user-voice"></i>
                    <div data-i18n="Users">Admin Users</div>
                </a>
            </li>
        <?php endif; ?>



        <li class="menu-item <?php echo e(Request::is('roles') ? 'active' : ''); ?> <?php echo e(Request::is('permission') ? 'active' : ''); ?> <?php echo e(Request::is('roles') ? 'open' : ''); ?> <?php echo e(Request::is('permission') ? 'open' : ''); ?>">
            <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class="menu-icon icon-base bx bx-check-shield"></i>
                <div data-i18n="Roles & Permissions">Roles & Permissions</div>
            </a>
            <ul class="menu-sub">
                <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('role-list')): ?>
                    <li class="menu-item  <?php echo e(Request::is('roles') ? 'active' : ''); ?>">
                        <a href="<?php echo e(route('roles.index')); ?>" class="menu-link">
                            <div data-i18n="Roles">Roles</div>
                        </a>
                    </li>
                <?php endif; ?>

                <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('permission-list')): ?>
                    <li class="menu-item <?php echo e(Request::is('permission') ? 'active' : ''); ?>">
                        <a href="<?php echo e(route('permission.index')); ?>" class="menu-link">
                            <div data-i18n="Permissions">Permissions</div>
                        </a>
                    </li>
                <?php endif; ?>
            </ul>
        </li>
         <li class="menu-item <?php echo e(Request::is('branches') ? 'active' : ''); ?> <?php echo e(Request::is('directorates') ? 'active' : ''); ?> <?php echo e(Request::is('branches') ? 'open' : ''); ?> <?php echo e(Request::is('directorates') ? 'open' : ''); ?>">
            <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class="menu-icon icon-base bx bx-check-shield"></i>
                <div data-i18n="Structure">Structure</div>
            </a>
            <ul class="menu-sub">
                <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('role-list')): ?>
                    <li class="menu-item  <?php echo e(Request::is('roles') ? 'active' : ''); ?>">
                        <a href="<?php echo e(route('branches.index')); ?>" class="menu-link">
                            <div data-i18n="Roles">Branches</div>
                        </a>
                    </li>
                <?php endif; ?>
  <li class="menu-item <?php echo e(Request::is('directorates') ? 'active' : ''); ?> open">
            <a href="<?php echo e(route('directorates.index')); ?>" class="menu-link">
                
                <div data-i18n="Directorates">Directorates/Branch Management</div>
            </a>
        </li>
 <li class="menu-item <?php echo e(Request::is('departments') ? 'active' : ''); ?> open">
            <a href="<?php echo e(route('departments.index')); ?>" class="menu-link">
                
                <div data-i18n="Positions">Positions</div>
            </a>
        </li>

            </ul>
        </li>

        <!-- Layouts -->
        <li class="menu-item <?php echo e(Request::is('employees') ? 'active':  ''); ?> <?php echo e(Request::is('employees') ? 'open':  ''); ?> ">
            <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons bx bx-layout"></i>
                <div data-i18n="Head-Office">Head-Office</div>
            </a>

            <ul class="menu-sub">
                <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('zone1-list')): ?>
                    <li class="menu-item  active open">
                        <a href="<?php echo e(route('zone1.index')); ?>" class="menu-link">
                            <div data-i18n="Without menu">Old</div>
                        </a>
                    </li>
                <?php endif; ?>
                <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('profile-list')): ?>
                    <li class="menu-item  <?php echo e(Request::is('employees') ? 'active' : ''); ?>">
                        <a href="<?php echo e(route('employees.index')); ?>" class="menu-link">
                            <div data-i18n="profiles">Employee Profiles</div>
                        </a>
                    </li>
                <?php endif; ?>

            </ul>


        </li>


        <li class="menu-item <?php echo e(Request::is('jigjiga') ? 'active' : ''); ?> <?php echo e(Request::is('jigjiga') ? 'open':  ''); ?>">
            <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons bx bx-layout"></i>
                <div data-i18n="Branches">Branches</div>
            </a>

            <ul class="menu-sub">
                <li class="menu-item  <?php echo e(Request::is('jigjiga') ? 'active' : ''); ?>">
                    <a href="<?php echo e(route('jigjiga.index')); ?>" class="menu-link">
                        <div data-i18n="Without menu">Jigjiga</div>
                    </a>
                </li>



            </ul>


        </li>




        

        <li class="menu-item <?php echo e(Request::is('experiences') ? 'active' : ''); ?> open">
            <a href="<?php echo e(route('experiences.index')); ?>" class="menu-link">
                <i class="menu-icon tf-icons bx bx-home-circle"></i>
                <div data-i18n="Expriences">Expriences</div>
            </a>
        </li>

        <li class="menu-item <?php echo e(Request::is('document') ? 'active' : ''); ?> open">
            <a href="<?php echo e(route('document.index')); ?>" class="menu-link">
                <i class="menu-icon tf-icons bx bx-folder"></i>
                <div data-i18n="Document">Documents</div>
            </a>
        </li>
        <li class="menu-item <?php echo e(Request::is('managers') ? 'active' : ''); ?> open">
            <a href="<?php echo e(route('managers.index')); ?>" class="menu-link">
                <i class="menu-icon tf-icons bx bx-user-circle"></i>
                <div data-i18n="Managers">Directors</div>
            </a>
        </li>
         <li class="menu-item <?php echo e(Request::is('notification') ? 'active' : ''); ?>">
            <a href="<?php echo e(route('notification.index')); ?>" class="menu-link">
                <i class="menu-icon tf-icons icon-base bx bx-bell icon-md"></i>
                <div data-i18n="Notifications">Notifications</div>
              <div class="badge text-bg-danger rounded-pill ms-auto"> <?php echo e($unReadMessages); ?> </div>

            </a>
        </li>
         <li class="menu-item <?php echo e(Request::is('maintainance-mode') ? 'active' : ''); ?>">
            <a href="<?php echo e(route('maintainance-mode')); ?>" class="menu-link">
                <i class="menu-icon tf-icons icon-base bx bx-cog"></i>
                <div data-i18n="Mantenance">Maintenance Mode</div>
              

            </a>
        </li>

    </ul>
</aside>
<?php /**PATH C:\Users\ODA-IT\Documents\GitHub\ECC\ecc-profiles\resources\views/layouts/sidebar.blade.php ENDPATH**/ ?>