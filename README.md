# 🚀 Dotfiles

Personal development environment configuration for macOS.

## 📦 What's Included

### Terminal Tools

- **[Alacritty](https://alacritty.org/)** - GPU-accelerated terminal emulator
- **[Ghostty](https://ghostty.org/)** - Modern terminal emulator with native UI
- **[Starship](https://starship.rs/)** - Fast, customizable cross-shell prompt
- **[Zsh](https://www.zsh.org/)** - Shell configuration with custom aliases and functions

### File Management

- **[eza](https://github.com/eza-community/eza)** - Modern replacement for `ls`
- **[lsd](https://github.com/lsd-rs/lsd)** - Next gen `ls` command
- **[fd](https://github.com/sharkdp/fd)** - Simple, fast alternative to `find`
- **[yazi](https://github.com/sxyazi/yazi)** - Blazing fast terminal file manager
- **[zoxide](https://github.com/ajeetdsouza/zoxide)** - Smarter `cd` command

### Developer Tools

- **[fzf](https://github.com/junegunn/fzf)** - Command-line fuzzy finder
- **[ripgrep](https://github.com/BurntSushi/ripgrep)** - Ultra-fast grep alternative
- **[jq](https://jqlang.github.io/jq/)** - JSON processor
- **[Git](https://git-scm.com/)** - Version control system
- **[GitHub CLI](https://cli.github.com/)** - GitHub command-line tool
- **[tmux](https://github.com/tmux/tmux)** - Terminal multiplexer
- **[thefuck](https://github.com/nvbn/thefuck)** - Auto-correct mistyped console commands

### Development Environment

- **[nvm](https://github.com/nvm-sh/nvm)** - Node.js version manager
- **[pnpm](https://pnpm.io/)** - Fast, disk space efficient package manager
- **Go tools** - goimports, gopls, staticcheck

### Utilities

- **[ffmpeg](https://ffmpeg.org/)** - Audio/video converter
- **[imagemagick](https://imagemagick.org/)** - Image manipulation
- **[poppler](https://poppler.freedesktop.org/)** - PDF rendering library
- **[7-Zip](https://www.7-zip.org/)** - File archiver
- **[Raycast](https://www.raycast.com/)** - Productivity launcher

## 🔧 Prerequisites

- macOS
- [Homebrew](https://brew.sh/) installed
- Bash 4.0+ (for installation script)

### Check Bash Version

```bash
bash --version
```

If you have bash < 4.0, install the latest version:

```bash
brew install bash
```

## 📥 Installation

1. **Clone the repository:**

```bash
git clone git@github.com:phucnd1303/dotfiles.git
cd ~/dotfiles
```

2. **Make the install script executable:**

```bash
chmod +x install.sh
```

3. **Run the installation script:**

```bash
./install.sh
```

The script will:

- Install all dependencies via Homebrew
- Create necessary configuration directories
- Symlink all configurations using GNU Stow

## 🔍 What Gets Installed

### Configuration Files

```
~/.config/
├── alacritty/     # Alacritty terminal config
├── eza/           # eza theming
├── ghostty/       # Ghostty terminal config
├── lsd/           # lsd colors and config
└── starship/      # Starship prompt config

~/
└── .zshrc         # Zsh configuration
```

## 🎨 Customization

Each configuration directory contains theme files and settings. Feel free to modify:

- `alacritty/alacritty.toml` - Terminal appearance and behavior
- `ghostty/config` - Ghostty terminal settings
- `starship/starship.toml` - Shell prompt customization
- `zsh/.zshrc` - Shell aliases, functions, and environment variables
- `eza/theme.yml` - File listing colors
- `lsd/colors.yaml` - Directory listing colors

## 🔄 Updating

To update configurations:

1. Make changes in the dotfiles directory
2. The changes will automatically reflect (thanks to symlinks via Stow)

To add new configurations:

1. Create a new directory in `~/dotfiles/`
2. Add configuration files
3. Update `install.sh` to include the new directory
4. Run `stow -t TARGET_DIR DIRECTORY_NAME`

## 🛠️ Manual Setup

### Set Zsh as Default Shell

```bash
chsh -s $(which zsh)
```

### Configure Fonts

The Brewfile installs Nerd Fonts. Set your terminal to use:

- MesloLG Nerd Font
- Symbols Only Nerd Font (for icons)

### Post-Installation

After installation, you may need to:

1. **Reload shell configuration:**

```bash
source ~/.zshrc
```

2. **Set up fzf keybindings:**

```bash
$(brew --prefix)/opt/fzf/install
```

3. **Initialize zoxide:**
   Already included in `.zshrc`, but verify with:

```bash
which z  # Should show zoxide function
```

## 🐛 Troubleshooting

### Issue: `declare: -A: invalid option`

**Cause:** Using bash version < 4.0

**Solution:**

```bash
brew install bash
# Make sure the new bash is in your PATH
which bash  # Should show /opt/homebrew/bin/bash or /usr/local/bin/bash
```

### Issue: Script fails with "permission denied"

**Solution:**

```bash
chmod +x install.sh
```

### Issue: Stow conflicts

If you have existing config files, stow may conflict. Backup and remove them:

```bash
mv ~/.config/alacritty ~/.config/alacritty.backup
./install.sh
```

### Issue: Homebrew not found

**Solution:**

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## 📝 License

Free to use and modify as you wish.

## 🙏 Credits

Inspired by the dotfiles community and various open-source configurations.

---

**Note:** This is a personal configuration. Review the files before installation and adjust to your preferences.
