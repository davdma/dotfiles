#!/bin/bash

# Dotfiles setup script
# This script creates symlinks for vim and tmux configurations

set -e  # Exit on any error

DOTFILES_DIR="$HOME/dotfiles"
BACKUP_DIR="$HOME/dotfiles_backup_$(date +%Y%m%d_%H%M%S)"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Helper functions
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if dotfiles directory exists
if [ ! -d "$DOTFILES_DIR" ]; then
    print_error "Dotfiles directory not found at $DOTFILES_DIR"
    print_status "Please clone your dotfiles repo first:"
    print_status "  git clone https://github.com/davdma/dotfiles.git ~/dotfiles"
    exit 1
fi

print_status "Starting dotfiles setup..."
print_status "Dotfiles directory: $DOTFILES_DIR"

# Create backup directory
mkdir -p "$BACKUP_DIR"
print_status "Backup directory created: $BACKUP_DIR"

# Function to create symlink with backup
create_symlink() {
    local source_file="$1"
    local target_file="$2"
    local config_name="$3"
    
    print_status "Setting up $config_name..."
    
    # Check if source file exists
    if [ ! -f "$source_file" ]; then
        print_warning "$config_name config not found at $source_file, skipping..."
        return
    fi
    
    # Backup existing config if it exists and is not already a symlink to our dotfiles
    if [ -e "$target_file" ]; then
        if [ -L "$target_file" ] && [ "$(readlink "$target_file")" = "$source_file" ]; then
            print_success "$config_name is already properly linked"
            return
        else
            print_warning "Backing up existing $config_name config"
            mv "$target_file" "$BACKUP_DIR/"
        fi
    fi
    
    # Create the symlink
    ln -s "$source_file" "$target_file"
    print_success "$config_name config linked successfully"
}

# Setup vim configuration
create_symlink "$DOTFILES_DIR/vimrc" "$HOME/.vimrc" "Vim"

# Setup tmux configuration
create_symlink "$DOTFILES_DIR/tmux.conf" "$HOME/.tmux.conf" "Tmux"

# Check if vim supports clipboard
print_status "Checking vim clipboard support..."
if command -v vim >/dev/null 2>&1; then
    if vim --version | grep -q "+clipboard"; then
        print_success "Vim has clipboard support"
    else
        print_warning "Vim does not have clipboard support"
        print_status "Consider installing vim-gtk3 (Ubuntu) or gvim for clipboard support"
    fi
else
    print_warning "Vim not found in PATH"
fi

# Check if tmux is installed
print_status "Checking tmux installation..."
if command -v tmux >/dev/null 2>&1; then
    print_success "Tmux is installed (version: $(tmux -V))"
else
    print_warning "Tmux not found in PATH"
    print_status "Install with: sudo apt install tmux (Ubuntu) or brew install tmux (macOS)"
fi

print_success "Dotfiles setup complete!"
print_status "Configurations have been linked:"
echo "  ~/.vimrc -> $DOTFILES_DIR/vimrc"
echo "  ~/.tmux.conf -> $DOTFILES_DIR/tmux.conf"

if [ "$(ls -A "$BACKUP_DIR" 2>/dev/null)" ]; then
    print_status "Original configs backed up to: $BACKUP_DIR"
else
    # Remove empty backup directory
    rmdir "$BACKUP_DIR" 2>/dev/null || true
fi

print_status "To apply tmux changes to existing sessions, run: tmux source-file ~/.tmux.conf"
print_status "Vim changes will take effect when you restart vim or run: :source ~/.vimrc"
