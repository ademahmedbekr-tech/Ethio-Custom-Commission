<aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
    <div class="app-brand demo">
        <a href="#" class="app-brand-link">
            <span class="app-brand-logo demo">
                <img src="<?php echo e(asset('front/images/Picture1.jpg')); ?>" height="40em" width="40em" style="border-radius: 50%">
                
            </span>
            <span class="app-brand-text demo menu-text fw-bolder text-capitalize ms-2">ECC(GK)</span>
        </a>

        <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto">
            <i class="icon-base bx bx-chevron-left"></i>
        </a>
    </div>

    <div class="menu-inner-shadow"></div>

    <ul class="menu-inner py-1">
        <!-- Dashboard -->
        <li class="menu-item <?php echo e(Request::is('admin') ? 'active' : ''); ?> open">
            <a href="<?php echo e(route('dashboard')); ?>" class="menu-link">
                <i class="menu-icon tf-icons bx bx-home-circle"></i>
                <div data-i18n="Analytics">Dashboard</div>
            </a>
        </li>
        <li class="menu-item <?php echo e(Request::is('dashboard2') ? 'active' : ''); ?>">
            <a href="<?php echo e(route('dashboard2.index')); ?>" class="menu-link">
                <i class="menu-icon tf-icons bx bx-home-circle"></i>
                <div data-i18n="Analytics">Dashboard-2</div>
            </a>
        </li>
        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('user-list')): ?>
            <li class="menu-item <?php echo e(Request::is('users') ? 'active' : ''); ?>">
                <a href="<?php echo e(route('users.index')); ?>" class="menu-link">
                    <i class="menu-icon tf-icons bx bx-user"></i>
                    <div data-i18n="Analytics">Users</div>
                </a>
            </li>
        <?php endif; ?>
        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('role-list')): ?>
            <li class="menu-item <?php echo e(Request::is('roles') ? 'active' : ''); ?>">
                <a href="<?php echo e(route('roles.index')); ?>" class="menu-link">
                    <i class="menu-icon tf-icons bx bx-user-plus"></i>
                    <div data-i18n="Analytics">Roles</div>
                </a>
            </li>
        <?php endif; ?>

        <!-- Layouts -->
        <li class="menu-item">
            <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons bx bx-layout"></i>
                <div data-i18n="Layouts">Profiles</div>
            </a>

            <ul class="menu-sub">
                <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('zone1-list')): ?>
                    <li class="menu-item  <?php echo e(Request::is('zone1') ? 'active' : ''); ?>">
                        <a href="<?php echo e(route('zone1.index')); ?>" class="menu-link">
                            <div data-i18n="Without menu">Old</div>
                        </a>
                    </li>
                <?php endif; ?>
                    <li class="menu-item  <?php echo e(Request::is('zone1') ? 'active' : ''); ?>">
                        <a href="<?php echo e(route('employees.index')); ?>" class="menu-link">
                            <div data-i18n="Without menu">Head-Office</div>
                        </a>
                    </li>


            </ul>
        </li>









    </ul>
</aside>
<?php /**PATH C:\Users\ODA-IT\Documents\GitHub\ECC\ODA-Membership\ODA-Membership\resources\views/layouts/sidebar.blade.php ENDPATH**/ ?>