# dotfiles
For storing my workflow config files so that it can follow me anywhere. Add more as needed!

The current configs for my workflow:
* `starship.toml` for the `starship` command line prompt formatting package
* `bashrc` for bash config (Linux)
* `zshrc` for zsh config (macOS)
* `vimrc` for vim config
* `tmux.conf` for tmux config
* Neovim separately configured via `kickstart.nvim`

Although the editor config here is only for `vim`, the setup script installs `nvim` and those configs for you in by cloning my kickstart repo. For more info on the Neovim setup consult the `kickstart.nvim` repo [here](https://github.com/davdma/kickstart.nvim).

# Adding to the repo

To add any existing config files to the dotfiles repo, use the following:
```bash
mv ~/.vimrc ~/dotfiles/vimrc
# Create a symlink so vim still finds it
ln -s ~/dotfiles/vimrc ~/.vimrc

# Add your shell config
mv ~/.bashrc ~/dotfiles/bashrc
ln -s ~/dotfiles/bashrc ~/.bashrc
```

It's recommended to store the files without the leading dot in the repo for better visibility.

My inspo for the `bashrc` config is from [this](https://gitlab.com/dwt1/dotfiles/-/blob/master/.bashrc?ref_type=heads) repo.

# How to use
## Pre-requisite
The `setup.sh` handles all the installs for you, so skip directly to [quick setup](#quick-setup).

If that does not work you will have to manually install. For instance, you need `tpm` installed first before using `.tmux.conf. In that case you need to run:
```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Note: to enable the plugins post `tpm` install, you must manually then do **prefix + I** in a `tmux` session where **I** is the key stroke **shift+I** since it is capitalized. I always get confused with this and don't understand why the plugins are not fetched...

## Quick Setup
`setup.sh` installs all dependencies (`tpm`, `fzf`, `starship`, `neovim`) and symlinks the configs.

```bash
git clone https://github.com/davdma/dotfiles.git ~/dotfiles
cd ~/dotfiles
./setup.sh
```

Both `~/.bashrc` (bash) and `~/.zshrc` (zsh) are linked — any existing file is backed up first, not overwritten.

Afterwards activate plugins for `tmux` with prefix + I and for neovim by starting `nvim`.

NOTE: once plugins activated with TPM using prefix + I (C+space+I), will need to install and activate a nerd font, otherwise there will be missing icons.

macOS NOTE: on macOS the terminal app lacks true color support, so the `tmux-power` plugin will not have color. Suggestion is to use iTerm2.

## Manual Setup

```bash
git clone https://github.com/davdma/dotfiles.git ~/dotfiles
cd ~/dotfiles
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/starship.toml ~/.config/starship.toml

# bash (Linux)
ln -s ~/dotfiles/bashrc ~/.bashrc

# zsh (macOS)
ln -s ~/dotfiles/zshrc ~/.zshrc
```

You will also need to install dependencies manually (`tpm`, `fzf`, `starship`, `neovim`).
