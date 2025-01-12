{ pkgs, ... }: {
  imports = [
    ./nix.nix
    ./users.nix
    ./programs.nix
    ./services.nix
    ./virtualisation.nix
  ];

  boot.loader = {
    systemd-boot.enable = true; # Set to false if GRUB is enabled
    efi.canTouchEfiVariables = true;
  };

  console.useXkbConfig = true;
  time.timeZone = "Asia/Manila";
  i18n.defaultLocale = "en_US.UTF-8";

  networking = {
    firewall.enable = false;
    networkmanager.enable = true;
  };

  security = {
    polkit.enable = true;
    rtkit.enable = true; # Enable real-time kit

    sudo.enable = false;
    doas = {
      enable = true;
      extraConfig = " permit nopass :wheel ";
    };
  };

  fonts.packages = with pkgs.nerd-fonts; [
    ubuntu
    jetbrains-mono
  ];
}
