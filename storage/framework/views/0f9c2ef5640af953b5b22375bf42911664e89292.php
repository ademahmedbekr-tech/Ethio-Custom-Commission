<!-- Edit Permission Modal -->
<div class="modal fade" id="editPermissionModal<?php echo e($permissions->id); ?>" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-simple">
    <div class="modal-content">
      <div class="modal-body">
        <button type="button" class="btn-close btn-pinned" data-bs-dismiss="modal" aria-label="Close"></button>
        <div class="text-center mb-6">
          <h3>Edit Permission</h3>
          <p class="text-body-secondary">Edit permission as per your requirements.</p>
        </div>
        <div class="alert alert-warning" role="alert">
          <h6 class="alert-heading mb-2">Warning</h6>
          <p class="mb-0">By editing the permission name, you might break <br> the system permissions functionality. Please ensure <br> you're absolutely certain before proceeding.</p>
        </div>
        <form id="editPermissionForm" action="<?php echo e(route('permission.update',$permissions->id)); ?>" method="POST" class="row" onsubmit="return true">
            <?php echo csrf_field(); ?>
            <?php echo method_field('PUT'); ?>
          <div class="col-sm-9 form-control-validation">
            <label class="form-label" for="editPermissionName">Permission Name</label>
            <input type="text" id="editPermissionName" name="name" value="<?php echo e(old('name', $permissions->name)); ?>" class="form-control" placeholder="Permission Name" tabindex="-1" />
          </div>
          <div class="col-sm-9 form-control-validation">
            <label class="form-label" for="editPermissionName">Permission Guard Name</label>
            <input type="text" id="editPermissionName" name="guard_name" value="<?php echo e(old('name', $permissions->guard_name)); ?>" class="form-control" placeholder="Permission Guard Name" tabindex="-1" />
          </div>
          <div class="col-sm-3 mb-4">
            <label class="form-label invisible d-none d-sm-inline-block">Button</label>
            <button type="submit" class="btn btn-primary mt-1 mt-sm-0">Update</button>
          </div>
          <div class="col-12">
            <div class="form-check">
              <input class="form-check-input" type="checkbox" id="editCorePermission" />
              <label class="form-check-label" for="editCorePermission"> Set as core permission </label>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<!--/ Edit Permission Modal -->
<?php /**PATH C:\Users\ODA-IT\Documents\GitHub\ECC\ecc-profiles\resources\views/_partials/_modals/modal-edit-permission.blade.php ENDPATH**/ ?>