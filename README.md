# nixos-config

个人配置，非模块化，仅供参考，不建议直接使用此配置

## 使用方法

项目使用 [just](https://github.com/casey/just) 来管理常用命令。请先安装 `just`，然后在仓库根目录运行以下命令：

### 可用命令

*   `just all`
    *   执行 `up`, `h`, `s` 的所有操作：更新 flake 输入，并应用 home-manager 和系统配置。

*   `just up`
    *   更新所有的 flake 输入 (`nix flake update`)。

*   `just h`
    *   应用 home-manager 配置 (`home-manager switch --flake . -I .`)。

*   `just s`
    *   应用 `xiaomi` 主机的 NixOS 系统配置 (`sudo nixos-rebuild switch --flake .#xiaomi -v -L`)。
```


杂项配置保存在[dotfile](https://github.com/wineee/.dotfiles)仓库中。
