{ user, pkgs, unstable, ... }:

{
  users.users.${user} = {
    isNormalUser = true;
    initialPassword = "password";

    extraGroups = [ 
      "networkmanager" 
      "wheel" 
      "video" 
      "audio" 
      "camera" 
      "podman"
      "libvirtd" 
      "qemu-libvirtd" 
    ];

    packages = with pkgs; [
      mpv                 # Media Player
      axel                # CLI download accelerator
      kitty               # Terminal Emulator
      scrcpy              #
      zoxide              #
      podman              # Docker Alternative
      zathura             # PDF Viewer
      qemu_kvm            # 
      neofetch            #
      pavucontrol         # Audio Control
      transmission        # BitTorrent client
    ] ++ (with unstable; [
      emacs
      google-chrome       # Browser
    ]);
  };
}
