{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "ahlo";
  home.homeDirectory = "/home/ahlo";
  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # hello
    ani-cli
    appimage-run
    atlauncher
    bitwarden-desktop
    blender
    brave
    btop
    chatterino2
    curl
    discord-canary
    discordo
    eza
    flameshot
    gimp
    godot3
    helvum
    ivpn
    lunarvim
    modrinth-app
    mov-cli
    mpv
    mumble
    nerdfonts
    newsboat
    obs-studio
    obsidian
    osu-lazer
    picom-pijulius
    pipewire
    prismlauncher
    protonup-qt
    python312Packages.devgoldyutils
    python3
    python312Packages.pip
    qemu
    qtemu
    qutebrowser
    ragnarwm
    simplex-chat-desktop
    slack
    spotify
    steam
    stow
    tailscale
    texmaker
    thunderbird
    transmission-gtk
    vlc
    webcord-vencord
    wget
    wofi
    xorg.xinit
    yt-dlp
    zathura
    zulu17
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];
  
  # Picom?
#  services.picom.enable = true;
  
#  wayland.windowManager.hyprland = {
#    enable = true;
#    xwayland.enable = true;
#    systemd.enable = true;
#    };
#  
#    wayland.windowManager.hyprland.settings = {
#      decoration = {
#        shadow_offset = "0 5";
#        "col.shadow" = "rgba(00000099)";
#      };
#  
#      "$mod" = "SUPER";
#  
#      bindm = [
#        # mouse movements
#        "$mod, mouse:272, movewindow"
#        "$mod, mouse:273, resizewindow"
#        "$mod ALT, mouse:272, resizewindow"
#      ];
#    };
  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/ahlo/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.git = {
  enable = true;
  userName = "Ahlo";
  userEmail = "alpha15@ahlosclub.com";
  };

#  programs.zsh = {
#  enable = true;
#  enableCompletion = false;
#  autosuggestion.enable = true;
#  syntaxHighlighting.enable = true;
#  antidote.enable = true;
#
#  antidote.plugins = [
#  "hlissner/zsh-autopair"
#  "marlonrichert/zsh-autocomplete"
#  ];
#
#  shellAliases = {
#    ls = "ls -a";
#    update = "home-manager switch";
#    nvim = "lvim";
#    vim = "lvim";
#    test = "home-manager build";
#    ani-cli = "ani-cli-unwrapped --skip";
#    };
#  };

  # Picom
#  picom.override = { withDebug = true; };

  programs = {
    zsh = (import ./zsh.nix { inherit config pkgs; });
    tmux = (import ./tmux.nix { inherit pkgs; });
    alacritty = (import ./alacritty.nix { inherit config pkgs; });
    fzf = (import ./fzf.nix { inherit pkgs; });
  };

  wayland.windowManager = {
    hyprland = (import ./hyprland.nix { inherit pkgs; });
  };
#  programs.neovim = {
#      enable = true;
#      plugins = with pkgs.vimPlugins; [
#        nvchad
#	nvchad-ui
#	];
#  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
