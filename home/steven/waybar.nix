{...}: {
  programs.waybar = {
    enable = true;
    settings = [
      {
        layer = "top";
        position = "top";
        height = 24;
        spacing = 5;
        modules-left = [
          "hyprland/workspaces"
          "temperature"
        ];
        modules-center = [
          "clock"
        ];
        modules-right = [
          "wireplumber"
          "network"
        ];
        "hyprland/workspaces" = {
          format = "<span size='larger'>{icon}</span>";
          on-click = "activate";
          format-icons = {
            active = "";
            default = "";
          };
          icon-size = 10;
          sort-by-number = true;
          persistent-workspaces = {
            "*" = 5;
          };
        };
        clock = {
          format = "{:%Y.%m.%d | %H:%M}";
        };
        network = {
          format = "";
          format-ethernet = "󰈀";
          format-wifi = "󰖩";
          format-disconnected = "󰖪";
          tooltip-format-wifi = "{essid} ({signalStrength}%)";
          tooltip-format-ethernet = "{ifname}";
          tooltip-format-disconnected = "Disconnected";
        };
        wireplumber = {
          format = "󰕾 {volume}%";
          max-volume = 100;
          scroll-step = 5;
        };
      }
    ];
    style = ''
      @define-color foreground #eeeeee;
      @define-color foreground-inactive #aaaaaa;
      @define-color background #000000;

      * {
        font-family:
          JetBrainsMono Nerd Font Propo,
          JetBrainsMono Nerd Font,
          sans-serif;
        font-size: 17px;
        padding: 0;
        margin: 0;
      }

      #waybar {
        color: @foreground;
        background-color: @background;
      }

      #workspaces button {
        color: @foreground;
        padding-left: 0.3em;
        padding-right: 0.3em;
      }

      #workspaces button.empty {
        color: @foreground-inactive;
      }

      #memory,
      #custom-platform-profile {
        padding-left: 1em;
      }

      #wireplumber,
      #battery,
      #idle_inhibitor,
      #language,
      #network,
      #bluetooth,
      #tray {
        padding-right: 1em;
      }
    '';
  };
}
