# 🚀 Neovim Configuration

Welcome to my personal Neovim setup! This configuration is designed to provide a fast, efficient, and modern editing experience using Lua and the Lazy plugin manager.

## ✨ Features

- **Lazy.nvim**: A modern plugin manager for Neovim, ensuring fast startup times and efficient plugin loading
- **Lua-based Configuration**: All configurations are written in Lua for better performance and maintainability
- **Modular Structure**: Organized into logical modules for easy customization and extension
- **Optimized Defaults**: Pre-configured settings for a smooth out-of-the-box experience
- **LSP Support**: Language Server Protocol integration for intelligent code completion and diagnostics
- **Modern UI**: Beautiful and functional interface with statusline and file explorer

## 📁 Folder Structure

```
~/.config/nvim/
├── init.lua                    # Entry point for the configuration
├── lua/
│   └── sanjay/                 # Main configuration module
│       ├── init.lua            # Core settings and keymaps
│       └── lazy/               # Plugin configurations
│           ├── init.lua        # Lazy.nvim setup
│           ├── colorscheme.lua # Theme configuration
│           ├── telescope.lua   # Fuzzy finder setup
│           ├── treesitter.lua  # Syntax highlighting
│           ├── lsp.lua         # Language server configuration
│           ├── cmp.lua         # Completion engine
│           ├── lualine.lua     # Status line
│           ├── nvim-tree.lua   # File explorer
│           └── ...             # Other plugin configs
└── after/
    └── ftplugin/               # Filetype-specific configurations
        ├── lua.lua
        ├── javascript.lua
        ├── python.lua
        └── ...
```

## 🔧 Installation

### 1. Install Neovim

#### Ubuntu/Debian

```bash
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt update
sudo apt install neovim -y
```

#### macOS (using Homebrew)

```bash
brew install neovim
```

#### Windows (using Chocolatey)

```powershell
choco install neovim
```

#### Build from Source (Latest Version)

```bash
# Install dependencies (Ubuntu/Debian)
sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen

# Clone and build
git clone https://github.com/neovim/neovim
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
```

### 2. Install This Configuration

#### Backup Existing Configuration (if any)

```bash
# Backup your existing config
mv ~/.config/nvim ~/.config/nvim.backup
mv ~/.local/share/nvim ~/.local/share/nvim.backup
```

#### Clone This Repository

```bash
git clone https://github.com/Sreesanjay/nvim.git ~/.config/nvim
```

### 3. Install Dependencies

#### Essential Dependencies

```bash
# Ubuntu/Debian
sudo apt install git curl build-essential

# Node.js (for LSP servers)
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs

# Python support
sudo apt install python3 python3-pip
pip3 install pynvim

# Ripgrep (for Telescope)
sudo apt install ripgrep

# fd (for file finding)
sudo apt install fd-find
```

#### macOS Dependencies

```bash
brew install git curl node python3 ripgrep fd
pip3 install pynvim
```

### 4. First Launch

1. Open Neovim:

   ```bash
   nvim
   ```

2. Lazy.nvim will automatically install all plugins. Wait for the installation to complete.

3. Restart Neovim once installation is finished.

4. Run health check:
   ```vim
   :checkhealth
   ```

## 🔌 Plugin Management

This configuration uses [Lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management.

### Key Commands

- `:Lazy` - Open Lazy plugin manager
- `:Lazy install` - Install plugins
- `:Lazy update` - Update plugins
- `:Lazy clean` - Remove unused plugins
- `:Lazy profile` - View startup times

### Adding New Plugins

1. Create a new file in `lua/sanjay/lazy/` (e.g., `new-plugin.lua`)
2. Add your plugin configuration:

```lua
return {
  "author/plugin-name",
  config = function()
    -- Plugin configuration here
    require("plugin-name").setup({
      -- options
    })
  end,
  dependencies = {
    -- dependencies if any
  },
  event = "VeryLazy", -- or other loading conditions
}
```

3. The plugin will be automatically loaded thanks to Lazy.nvim's auto-discovery.

### Plugin Loading Strategies

- **Lazy Loading**: Most plugins are configured to load only when needed
- **Event-based**: Load on specific events (`BufReadPost`, `VimEnter`, etc.)
- **Command-based**: Load when specific commands are used
- **Filetype-based**: Load for specific file types

## ⌨️ Key Mappings

### General

- `<leader>` = `<Space>`
- `<leader>e` - Toggle file explorer
- `<leader>ff` - Find files
- `<leader>fr` - Find string
- `<leader>fc` - Find string under cursor
- `<leader>fh` - Help tags

### LSP

- `gd` - Go to definition
- `gr` - Go to references
- `K` - Hover documentation
- `<leader>ca` - Code actions
- `<leader>rn` - Rename symbol

### Window Navigation

- `<C-h>` - Move to left window
- `<C-j>` - Move to bottom window
- `<C-k>` - Move to top window
- `<C-l>` - Move to right window

## 🎨 Customization

### Changing Colorscheme

Edit `lua/sanjay/lazy/colorscheme.lua` and modify the colorscheme setup:

```lua
return {
  "your-preferred-theme/nvim",
  priority = 1000,
  config = function()
    vim.cmd("colorscheme your-theme")
  end,
}
```

### Adding Custom Keymaps

Add your keymaps in `lua/sanjay/init.lua`:

```lua
vim.keymap.set("n", "<your-key>", "<your-command>", { desc = "Description" })
```

### Language Server Setup

Add new language servers in `lua/sanjay/lazy/lsp.lua`:

```lua
local servers = {
  -- your existing servers
  new_server = {
    -- server specific options
  },
}
```

## 🛠️ Troubleshooting

### Common Issues

1. **Plugins not loading**

   ```vim
   :Lazy restore
   ```

2. **LSP not working**

   ```vim
   :LspInfo
   :Mason
   ```

3. **Slow startup**
   ```vim
   :Lazy profile
   ```

### Health Checks

Run these commands to diagnose issues:

```vim
:checkhealth
:checkhealth nvim
:checkhealth lsp
```

### Logs

View logs for debugging:

- Neovim log: `~/.local/state/nvim/log`
- Lazy log: `:Lazy log`

## 📚 Learning Resources

- [Neovim Documentation](https://neovim.io/doc/)
- [Lua Guide for Neovim](https://github.com/nanotee/nvim-lua-guide)
- [Lazy.nvim Documentation](https://lazy.folke.io/)
- [LSP Configuration Guide](https://github.com/neovim/nvim-lspconfig)

## 🤝 Contributing

Feel free to submit issues and pull requests! If you have suggestions for improvements or find bugs, please open an issue.

## 📝 License

This configuration is open source and available under the [MIT License](LICENSE).

## 🙏 Acknowledgments

- [Lazy.nvim](https://github.com/folke/lazy.nvim) - Amazing plugin manager
- [Neovim](https://neovim.io/) - The hyperextensible Vim-based text editor
- All the plugin authors who make the Neovim ecosystem amazing

---

Happy coding! 🎉
