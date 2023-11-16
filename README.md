- Install iterm2
- Install homebrew
- Install zsh
- Install neovim via brew
- Install ripgrep via brew

Create symlink to point nvim configs

```shell
ln -s ~/dotfiles/.config/nvim ~/.config/nvim
```

Create symlink to point tmux configs

```shell
ln -s ~/dotfiles/.config/tmux/tmux.conf ~/.config/tmux/
```

Create symlink to point iterm2 configs

```shell
ln -s ~/dotfiles/.config/iterm2/everforest_dark_low.itermcolors ~/.config/iterms/
```

Create symlink to point zsh configs

```shell
# ikorason.zsh.theme
ln -s ~/dotfiles/.config/zsh/ikorason.zsh-theme ~/.oh-my-zsh/custom/themes/
# .zshrc
ln -s ~/dotfiles/.config/zsh/.zshrc ~/
```
