# dotfiles
For storing my workflow config files. Add more as needed!

Copy config file to dotfiles repo:
```bash
mv ~/.vimrc ~/dotfiles/vimrc
# Create a symlink so vim still finds it
ln -s ~/dotfiles/vimrc ~/.vimrc

# Add your shell config
mv ~/.bashrc ~/dotfiles/bashrc
ln -s ~/dotfiles/bashrc ~/.bashrc
```

# How to use
When setting up the configs on a new computer use the following:

```bash
git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
cd ~/dotfiles
ln -s ~/dotfiles/vimrc ~/.vimrc
# etc for other configs
```
