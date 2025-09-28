# 🌿 Sreesanjay's Neovim Configuration

Welcome to my personal Neovim setup! This configuration is designed to provide a fast, efficient, and modern editing experience using Lua and the Lazy plugin manager.

## 🚀 Features

- **Lazy.nvim**: A modern plugin manager for Neovim, ensuring fast startup times and efficient plugin loading.
- **Lua-based Configuration**: All configurations are written in Lua for better performance and maintainability.
- **Modular Structure**: Organized into logical modules for easy customization and extension.
- **Optimized Defaults**: Pre-configured settings for a smooth out-of-the-box experience.

## 📁 Directory Structure

````plaintext
~/.config/nvim/
├── init.lua        # Entry point for the configuration
├── lua/
│   └── sanjay/     # Main configuration module
│       ├── lazy/   # Plugin configurations
│       └── init.lua
└── after/
    └── ftplugin/   # Filetype-specific configurations


⚙️ Installation
1. Install Neovim on Ubuntu

You can install the latest Neovim version on Ubuntu using the official PPA:

```bash
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt update
sudo apt install neovim -y
````
