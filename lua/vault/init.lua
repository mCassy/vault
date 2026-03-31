-- vault — Neovim colorscheme orchestrator
-- Merges all four highlight modules and applies groups + terminal colors.
-- colors/vault.lua calls M.load() on colorscheme activation.

local M = {}

local palette     = require("vault.palette")
local ui          = require("vault.highlights.ui")
local syntax      = require("vault.highlights.syntax")
local treesitter  = require("vault.highlights.treesitter")
local diagnostics = require("vault.highlights.diagnostics")
local telescope  = require("vault.highlights.telescope")
local gitsigns   = require("vault.highlights.gitsigns")
local bufferline = require("vault.highlights.bufferline")

--- Apply the vault colorscheme.
--- @param opts table|nil Optional: { overrides = { GroupName = { fg = "#hex", ... } } }
function M.load(opts)
  opts = opts or {}
  local c = palette.colors

  -- Merge all highlight layers (later layers override earlier for same group name)
  local groups = {}
  groups = vim.tbl_extend("force", groups, ui.get(c))
  groups = vim.tbl_extend("force", groups, syntax.get(c))
  groups = vim.tbl_extend("force", groups, treesitter.get(c))
  groups = vim.tbl_extend("force", groups, diagnostics.get(c))
  groups = vim.tbl_extend("force", groups, telescope.get(c))
  groups = vim.tbl_extend("force", groups, gitsigns.get(c))
  groups = vim.tbl_extend("force", groups, bufferline.get(c))

  -- Apply user overrides (PLUG-03)
  for group, attrs in pairs(opts.overrides or {}) do
    groups[group] = attrs
  end

  -- Apply all highlight groups
  for group, attrs in pairs(groups) do
    vim.api.nvim_set_hl(0, group, attrs)
  end

  -- Terminal color variables (UI-04)
  -- Slots 0-7: normal ANSI; slots 8-15: bright variants
  -- No true blue or purple — blue/magenta slots use amber tones (GHOST-04)
  vim.g.terminal_color_0  = c.bg        -- black → terminal bg
  vim.g.terminal_color_1  = c.error     -- red → warm rust-red
  vim.g.terminal_color_2  = c.green     -- green → Matrix green
  vim.g.terminal_color_3  = c.fg        -- yellow → amber primary
  vim.g.terminal_color_4  = c.comment   -- blue slot → dim amber (in-palette)
  vim.g.terminal_color_5  = c.comment   -- magenta slot → dim amber (in-palette)
  vim.g.terminal_color_6  = c.string    -- cyan slot → lime string green
  vim.g.terminal_color_7  = c.fg        -- white → amber fg
  vim.g.terminal_color_8  = c.ui_bg     -- bright black → UI chrome
  vim.g.terminal_color_9  = c.error     -- bright red → warm rust-red
  vim.g.terminal_color_10 = c.string    -- bright green → lime string
  vim.g.terminal_color_11 = c.fg        -- bright yellow → amber
  vim.g.terminal_color_12 = c.comment   -- bright blue → dim amber (in-palette)
  vim.g.terminal_color_13 = c.comment   -- bright magenta → dim amber (in-palette)
  vim.g.terminal_color_14 = c.green     -- bright cyan → Matrix green
  vim.g.terminal_color_15 = "#e8d400"   -- bright white → brighter amber
end

--- Public setup() API — for user config in init.lua / lazy.nvim config block.
--- Stores opts for deferred load; colors/vault.lua calls M.load() on colorscheme activation.
--- @param opts table|nil { overrides = { GroupName = { fg = "#hex", ... } } }
function M.setup(opts)
  opts = opts or {}
  M._opts = opts
end

return M
