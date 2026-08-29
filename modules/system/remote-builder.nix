{
  # builder side: run foreign-architecture builds via qemu emulation
  flake.modules.nixos.remoteBuilder = {
    boot.binfmt.emulatedSystems = [ "aarch64-linux" ];
  };

  # client side: offload builds to raphiel
  flake.modules.nixos.remoteBuildClient = {
    nix.distributedBuilds = true;
    nix.buildMachines = [
      {
        hostName = "root@raphiel.lan";
        systems = [
          "x86_64-linux"
          "aarch64-linux"
        ];
        protocol = "ssh-ng";
        supportedFeatures = [
          "nixos-test"
          "benchmark"
          "big-parallel"
        ];
        maxJobs = 8;
        speedFactor = 10;
      }
    ];
  };
}
