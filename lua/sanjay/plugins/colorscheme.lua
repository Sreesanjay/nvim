return {
    -- Rose Pine
    {
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = false, -- Load on startup
        priority = 1000,
        config = function()
            require("rose-pine").setup({
                variant = "main",
                dark_variant = "main",
                dim_inactive_windows = false,
                styles = {
                    bold = true,
                    italic = false,
                    transparency = true,
                },
                highlight_groups = {
                    ColorColumn = { bg = "#1C1C21" },
                    Normal = { bg = "none" },
                    Pmenu = { bg = "none", fg = "#e0def4" },
                    PmenuSel = { bg = "#4a465d", fg = "#f8f5f2" },
                    PmenuSbar = { bg = "#191724" },
                    PmenuThumb = { bg = "#9ccfd8" },
                },
                enable = {
                    terminal = false,
                    legacy_highlights = false,
                    migrations = true,
                },
            })
            vim.cmd("colorscheme rose-pine") -- Set default
        end,
    },

    -- Gruvbox
    {
        "ellisonleao/gruvbox.nvim",
        config = function()
            require("gruvbox").setup({
                terminal_colors = true,
                undercurl = true,
                underline = true,
                bold = true,
                italic = {
                    strings = false,
                    emphasis = false,
                    comments = false,
                    folds = false,
                    operators = false,
                },
                strikethrough = true,
                inverse = true,
                contrast = "",
                overrides = {
                    Pmenu = { bg = "none" },
                },
                transparent_mode = true,
            })
        end,
    },

    -- Kanagawa
    {
        "rebelot/kanagawa.nvim",
        config = function()
            require("kanagawa").setup({
                undercurl = true,
                commentStyle = { italic = true },
                keywordStyle = { italic = false },
                statementStyle = { bold = true },
                transparent = true,
                dimInactive = false,
                terminalColors = true,
                colors = {
                    theme = {
                        all = {
                            ui = { bg_gutter = "none" }
                        }
                    },
                },
                overrides = function(colors)
                    local theme = colors.theme
                    return {
                        NormalFloat = { bg = "none" },
                        FloatBorder = { bg = "none" },
                        Pmenu = { fg = theme.ui.shade0, bg = "none" },
                        PmenuSel = { fg = "none", bg = theme.ui.bg_p2 },
                    }
                end,
                theme = "wave",
                background = { dark = "wave" },
            })
        end,
    },

    -- Solarized Osaka
    {
        "craftzdog/solarized-osaka.nvim",
        config = function()
            require("solarized-osaka").setup({
                transparent = true,
                terminal_colors = true,
                styles = {
                    comments = { italic = true },
                    keywords = { italic = false },
                    sidebars = "dark",
                    floats = "dark",
                },
                sidebars = { "qf", "help" },
                day_brightness = 0.3,
                dim_inactive = false,
                on_highlights = function(hl, c)
                    local prompt = "#2d3149"
                    hl.TelescopePromptTitle = { bg = prompt, fg = "#2C94DD" }
                    hl.TelescopeNormal = { bg = c.bg_dark, fg = c.fg_dark }
                end,
            })
        end
    },

    -- TokyoNight
    {
        "folke/tokyonight.nvim",
        config = function()
            require("tokyonight").setup({
                style = "night",
                transparent = true,
                styles = {
                    comments = { italic = false },
                    keywords = { italic = false },
                    sidebars = "transparent",
                    floats = "transparent",
                },
                on_colors = function(colors)
                    colors.bg = "none"
                    colors.bg_dark = "none"
                end,
            })
        end,
    },
}
