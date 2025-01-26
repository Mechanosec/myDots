{ pkgs, ... }: {
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      intel-vaapi-driver
      libvdpau-va-gl
      vpl-gpu-rt
      #intel-media-sdk #for QSV
    ];
  };

  boot.kernelParams = [ "i915.force_probe=9a49" ];
}
