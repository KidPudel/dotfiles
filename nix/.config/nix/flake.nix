{
  description = "Example Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    # homebrew
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew }:
  let
    configuration = { pkgs, config, ... }: {
      # allow closed source and unfree apps
      nixpkgs.config.allowUnfree = true;
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        [
            # gui apps
            # pkgs.wezterm
            # pkgs.raycast

            # for creating app aliases
			pkgs.nix
            pkgs.mkalias
            # packages
            pkgs.neovim
            pkgs.yazi
            pkgs.tmux
			pkgs.stow
            # pkgs.zellij
            pkgs.zoxide
            pkgs.sqlite
            pkgs.ripgrep
            pkgs.raylib
            # languages
            pkgs.go
            pkgs.pyenv
            pkgs.python3
            pkgs.tree
            pkgs.gcc
            pkgs.cmake
            pkgs.gh # github repo create
            pkgs.zsh-autosuggestions
            pkgs.zsh-syntax-highlighting
            pkgs.starship
            pkgs.s3cmd
			pkgs.nodejs_22
			pkgs.redis
			# pkgs.tesseract4
        ];

    # here we can add some other stuff

    users.users.iggysleepy = {
        name = "iggysleepy";
        home = "/Users/iggysleepy";
    };
    nix.configureBuildUsers = true;
    nix.useDaemon = true;

    homebrew = {
        enable = true;
        casks = [
            "hammerspoon"
			"ghostty"
			"raycast"
        ];
        brews = [
            "llvm@18"
			"protoc-gen-go"
			"fzf"
			"bat"
			"postgresql@16"
			"sdl2"
			"sdl3"
			"sdl2_image"
			"sdl2_ttf"
			"sdl2_mixer"
        ];
        onActivation.cleanup = "zap";
        onActivation.autoUpdate = true;
        onActivation.upgrade = true;
    };


    # create an alias for applications
      system.activationScripts.applications.text = let
        env = pkgs.buildEnv {
            name = "system-applications";
            paths = config.environment.systemPackages;
            pathsToLink = "/Applications";
        };
      in
        pkgs.lib.mkForce ''
            # Set up applications
            echo "settings up /Applications..." >&2
            rm -rf /Applications/Nix\ Apps
            mkdir -p /Applications/Nix\ Apps
            find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
            while read src; do
                app_name=$(basename "$src")
                echo "copying $src" >&2
                ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
            done
        '';

      system.defaults = {
          dock.autohide = true;
          dock.persistent-apps = [
            "/Applications/Arc.app"
            "/Applications/Ghostty.app"
            "/Applications/Obsidian.app"
            "/System/Applications/Notes.app"
          ];
          NSGlobalDomain.KeyRepeat = 2;
      };

      # Auto upgrade nix package and the daemon service.
      services.nix-daemon.enable = true;
      # nix.package = pkgs.nix;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Create /etc/zshrc that loads the nix-darwin environment.
      programs.zsh.enable = true;  # default shell on catalina
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#Iggys-MacBook-Pro
    darwinConfigurations."Iggys-MacBook-Pro" = nix-darwin.lib.darwinSystem {
      modules = [ 
        configuration
        nix-homebrew.darwinModules.nix-homebrew
        {
            nix-homebrew = {
                # install brew under default prefix
                enable = true;

                # for Apple Silicon
                enableRosetta = true;

                user = "iggysleepy";

                autoMigrate = true;
            };
        }
      ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."Iggys-MacBook-Pro".pkgs;
  };
}
