{ config, pkgs, ... }:

{
  i18n = {
    defaultLocale = "zh_CN.UTF-8";
    supportedLocales = [ "zh_CN.UTF-8/UTF-8" "en_US.UTF-8/UTF-8" ];
    inputMethod = {
      enable = true;
      type = "ibus"; #"fcitx5";
      fcitx5.addons = with pkgs; [
        fcitx5-rime
        fcitx5-configtool
        fcitx5-chinese-addons
        kdePackages.fcitx5-qt
      ];
      ibus.engines = with pkgs.ibus-engines; [ libpinyin ];
    };
  };

}

