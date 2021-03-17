{

  network.description = "this configuration breaks";

  c1 = { config, ... }: {

    documentation.enable = true; # change to false to make it build

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    fileSystems."/" =
    { device = "/dev/disk/mow";
      fsType = "xfs";
    };

    nixpkgs.pkgs = import (import ./.).inputs.nixpkgs { inherit (config.nixpkgs) config; };

    deployment.targetHost = "1.2.3.4";

    time.timeZone = "Europe/Moscow";

  };

}
