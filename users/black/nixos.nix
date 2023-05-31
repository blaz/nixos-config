{ pkgs, ... }:

{
  # https://github.com/nix-community/home-manager/pull/2408
  environment.pathsToLink = [ "/share/fish" ];

  users.users.black = {
    isNormalUser = true;
    home = "/home/black";
    extraGroups = [ "docker" "wheel" ];
    shell = pkgs.fish;
    hashedPassword = "$6$p5nPhz3G6k$6yCK0m3Oglcj4ZkUXwbjrG403LBZkfNwlhgrQAqOospGJXJZ27dI84CbIYBNsTgsoH650C1EBsbCKesSVPSpB1";
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCwun79lGh4h2Y/oHJHLyrvJOqUlxNpfX/iP8NEu43xtGlB/xG137ZZ6O917AUNZjM/HsJLK+JDRFroaxv3oEIdt3QD//4lYz6rrkbzYeNMefa4uRkA7G7yawTDLnizbihrL7URvn5fuSYaoSoU9dYVhUxrU+2eYVchxzKjnbDQBSa2YfkGlNUyJ+eo7AT1G+I5p0dQdqIw4R+JLb6L1fOtPz+MPpzqy0REU4K2gU74K0FEZGtVvBn4prQze4aBq+aPuF+0LDsOc/EL8p9CzidXAQvnSuHDhb4s16bL59hmLH6voOkVkAackgRveX/8xKKYQHDHnjLUczG13OEPqgqV blaz@grilc.org"
    ];
  };

  nixpkgs.overlays = import ../../lib/overlays.nix ++ [
    (import ./vim.nix)
  ];
}
