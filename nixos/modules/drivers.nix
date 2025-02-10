{ pkgs, ... }: {

  #nixpkgs.config.packageOverrides = pkgs: {
  #    intel-vaapi-driver = pkgs.intel-vaapi-driver.override { enableHybridCodec = true; };
  #};

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      #intel-vaapi-driver
      libvdpau-va-gl
      vpl-gpu-rt
    ];
  };

  boot.kernelParams = [
    "i915.enable_fbc=1"
    "i915.enable_psr=1"
    "i915.enable_guc=3"
  ];

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    xdgOpenUsePortal = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
  };
}
