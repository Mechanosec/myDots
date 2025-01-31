{ pkgs, ... }: {
  hardware.pulseaudio.enable = false;

  # rtkit is optional but recommended
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;

    wireplumber.enable = true;

    alsa.enable = true;
    alsa.support32Bit = true;

    pulse.enable = true;

    # If you want to use JACK applications, uncomment this
    jack.enable = true;
  };

   #programs.firefox = {
   #  enable = true;
   #  package = pkgs.firefox.override {
   #    pipewireSupport = true;
   #  };
   #};

   #programs.slack = {
   #  enable = true;
   #  package = pkgs.slack.overrideAttrs (old: {
   #    postInstall = ''
   #      wrapProgram $out/bin/slack \
   #        --add-flags "--enable-features=WebRTCPipeWireCapturer"
   #    '';
   #  });
   #};
}
