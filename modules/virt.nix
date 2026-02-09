{ pkgs, config, globals, ... }:

{
  # Kernel modules for KVM virtualization
  boot.kernelModules = [ "kvm-amd" ];

  # Virtualization with libvirt/KVM support
  virtualisation.libvirtd = {
    enable = true;
    qemu.vhostUserPackages = with pkgs; [ virtiofsd ];
  };

  virtualisation.docker.enable = true;

  # virt-manager UI
  programs.virt-manager.enable = true;

  # Networking for virtualization
  networking.firewall.trustedInterfaces = [ "virbr0" ];

  # User groups for virtualization
  users.users.${globals.UserName}.extraGroups = [
    "libvirtd"
    "kvm"
  ];

  # Environment packages for virtualization
  environment = {
    systemPackages = with pkgs; [
      qemu
      kvmtool
      dnsmasq
      (writeShellScriptBin "qemu-system-x86_64-uefi" ''
        qemu-system-x86_64 \
          -bios ${pkgs.OVMF.fd}/FV/OVMF.fd \
          "$@"
      '')
    ];
  };
}
