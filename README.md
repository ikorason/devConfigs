# Work in progress

- Install homebrew
- Install zsh
- Install neovim via brew
- Install ripgrep via brew

## NvChad

[NvChad](https://nvchad.com/) as based config for my neovim configuration.

Create symlink to point ~/dotfiles/.config/nvim/nvchad to ~/.config/nvim/lua/custom

```shell
ln -s ~/dotfiles/.config/nvim/nvchad ~/.config/nvim/lua/
rm -rf custom
mv nvchad custom
```
