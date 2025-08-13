{
  config,
  pkgs,
  ...
}: {
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    settings = {
      add_newline = false;
      format = "╭╴$nix_shell($git_branch$git_status)$python$directory$cmd_duration\n╰ $time $battery$username@$hostname $character";

      character = {
        disabled = false;
        success_symbol = "[»](bold green)";
        error_symbol = "[»](bold red)";
      };
      python = {
        format = "[\\[[$virtualenv](bold green)\\]](grey)";
      };
      battery = {
        display = [
          {
            threshold = 20;
            style = "bold red";
          }
        ];
        full_symbol = "🔋 ";
        charging_symbol = "⚡️";
        discharging_symbol = "💀 ";
      };
      git_branch = {
        disabled = false;
        style = "bold green";
        format = "[\\[[$symbol$branch$tag](bold green)\\]](grey)";
      };
      git_status = {
        disabled = false;
        format = "([\\[$conflicted$deleted$renamed$modified$staged$untracked$ahead_behind\\]]($style))";
      };
      directory = {
        disabled = false;
        read_only = "🔒";
        truncation_length = 0;
        format = "(\\[[$read_only]($read_only_style)\\])\\[[$path]($style)\\]";
        style = "bold yellow";
      };
      hostname = {
        disabled = false;
        ssh_only = false;
        format = "[$hostname]($style)";
        style = "bold white";
      };
      username = {
        disabled = false;
        show_always = true;
        style_user = "bold white";
        format = "[$user]($style)";
      };
      time = {
        disabled = false;
        time_format = "%H:%M";
        format = "[$time]($style)";
      };
      cmd_duration = {
        disabled = false;
        style = "green";
        min_time = 1;
        format = "\\[[$duration]($style)\\]";
      };
      nix_shell = {
        symbol = "❄️";
        format = "\\[[$symbol $name]($style)\\]";
      };
    };
  };
}
