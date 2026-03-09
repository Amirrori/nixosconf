{
	boot = {
		initrd.kernelModules = [ "kvmgt" "vfio-iommu-type1" "mdev"];
		# added psr and dc
		kernelParams = [ "i915.enable_gvt=1" "i915.enable_guc=0" "i915.enable_fbc=0" "intel_iommu=on"];
		extraModulePackages = [ ];
	};

}
