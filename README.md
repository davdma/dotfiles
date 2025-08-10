# dotfiles
For storing my workflow config files so that it can follow me anywhere. Add more as needed!

Copy config file to dotfiles repo:
```bash
mv ~/.vimrc ~/dotfiles/vimrc
# Create a symlink so vim still finds it
ln -s ~/dotfiles/vimrc ~/.vimrc

# Add your shell config
mv ~/.bashrc ~/dotfiles/bashrc
ln -s ~/dotfiles/bashrc ~/.bashrc
```

It's recommended to store the files without the leading dot in the repo for better visibility.

# How to use
## Pre-requisite
Must make sure `tpm` is installed first before using `.tmux.conf`! Make sure you run:
```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

## Quick Setup
Instead of running all the commands, you can use `setup.sh` for easy setup!
```bash
git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
cd ~/dotfiles
./setup.sh
```

## Manual Setup
When setting up the configs manually:

```bash
git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
cd ~/dotfiles
ln -s ~/dotfiles/vimrc ~/.vimrc
# etc for other configs
```
