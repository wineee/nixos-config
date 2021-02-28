{ config, pkgs, ... }:

{
  # Select internationalisation properties.
  i18n = {
    defaultLocale = "zh_CN.UTF-8";
    supportedLocales = [ "zh_CN.UTF-8/UTF-8" "en_US.UTF-8/UTF-8" ];
    inputMethod.enabled = "fcitx";
    inputMethod.fcitx.engines = with pkgs.fcitx-engines; [ rime cloudpinyin ];
  };

}

