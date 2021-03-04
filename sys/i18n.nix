{ config, pkgs, ... }:

{
  # Select internationalisation properties.
  i18n = {
    defaultLocale = "zh_CN.UTF-8";
    supportedLocales = [ "zh_CN.UTF-8/UTF-8" "en_US.UTF-8/UTF-8" ];
    inputMethod.enabled = "fcitx5";
    inputMethod.fcitx5.addons  = [ pkgs.fcitx5-rime pkgs.fcitx5-configtool ];
  };

}

