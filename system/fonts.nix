{ pkgs, ... }:

{
  fonts = {
    #enableDefaultFonts = true;
    fontconfig = {
      enable = true;
      hinting = {
        enable = true;
        # autohint = false;
        # hintstyle = "hintslight(10px,12px)";
      };
      defaultFonts.emoji = [ "Noto Color Emoji" ];
      #defaultFonts.monospace = [ "Hack" "Sarasa Mono SC" ];
      #defaultFonts.sansSerif = [ "DejaVu Sans" ];
      #defaultFonts.serif = [ "DejaVu Serif" "Source Han Serif SC" ];
    };

    fontDir.enable = true;
    enableGhostscriptFonts = true;
    packages = with pkgs; [
      sarasa-gothic
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      wqy_microhei
      wqy_zenhei
      nerd-fonts.symbols-only # 图标字体
      symbola # 特殊字符
      jetbrains-mono
      vistafonts
      #material-design-icons font-awesome # polybar
    ] ++ ( with pkgs.nur.repos.rewine; [
      ttf-wps-fonts
      ttf-ms-win10
    ]);
  };
}
