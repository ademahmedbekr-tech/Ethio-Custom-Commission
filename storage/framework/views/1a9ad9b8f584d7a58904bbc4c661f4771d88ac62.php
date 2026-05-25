<?php $__env->startSection('content'); ?>
<div class="container mx-auto px-4 py-8 max-w-md">
    <div class="bg-white rounded-lg shadow-lg p-6">
        <div class="text-center mb-6">
            <h1 class="text-2xl font-bold text-gray-800">Verify with Fayda ID</h1>
            <p class="text-gray-600 mt-2">Enter your 12-digit Fayda Identification Number</p>
        </div>

        <?php if(session('error')): ?>
            <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded mb-4">
                <?php echo e(session('error')); ?>

            </div>
        <?php endif; ?>

        <form action="<?php echo e(route('fayda.initiate')); ?>" method="POST">
            <?php echo csrf_field(); ?>

            <div class="mb-4">
                <label for="fin" class="block text-gray-700 font-medium mb-2">Fayda ID Number (FIN)</label>
                <input type="text"
                       name="fin"
                       id="fin"
                       class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 <?php $__errorArgs = ['fin'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> border-red-500 <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>"
                       placeholder="123456789012"
                       maxlength="12"
                       pattern="\d{12}"
                       value="<?php echo e(old('fin')); ?>"
                       required>
                <?php $__errorArgs = ['fin'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                    <p class="text-red-500 text-sm mt-1"><?php echo e($message); ?></p>
                <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                <p class="text-gray-500 text-sm mt-1">Your 12-digit Fayda ID number</p>
            </div>

            <div class="mb-6">
                <label class="flex items-center">
                    <input type="checkbox" name="accept_terms" class="mr-2" required>
                    <span class="text-gray-700 text-sm">
                        I agree to the <a href="#" class="text-blue-600 hover:underline">Terms and Conditions</a> for identity verification
                    </span>
                </label>
            </div>

            <button type="submit"
                    class="w-full bg-blue-600 text-white font-bold py-3 px-4 rounded-lg hover:bg-blue-700 transition duration-200">
                Continue
            </button>
        </form>

        <div class="mt-6 text-center text-sm text-gray-500">
            <p>Don't have a Fayda ID? <a href="#" class="text-blue-600 hover:underline">Register here</a></p>
        </div>
    </div>
</div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\Users\ODA-IT\Documents\GitHub\ECC\ecc-profiles\resources\views/fayda/verify-form.blade.php ENDPATH**/ ?>