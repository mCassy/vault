local M = {}

---@type VaultConfig
M.config = require("vault.config")

---Setup vault colorscheme
---@param opts? VaultConfig
function M.setup(opts)
  M.config.setup(opts)
end

---Load the colorscheme
function M.load()
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end

  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
  end

  local config = require("vault.config")
  local palette = require("vault.palette").colors

  vim.o.termguicolors = true
  vim.o.background = "dark"
  vim.o.cursorline = config.cursorline
  vim.o.cursorcolumn = config.cursorcolumn
  vim.g.colors_name = "vault"

  if config.terminal_colors then
    M.set_terminal_colors(palette)
  end

  local groups = {}

  for _, source in ipairs({
    "vault.groups.editor",
    "vault.groups.syntax",
    "vault.groups.treesitter",
    "vault.groups.lsp",
    "vault.groups.plugins",
  }) do
    local ok, module = pcall(require, source)
    if ok and module.get then
      for name, hl in pairs(module.get()) do
        groups[name] = hl
      end
    end
  end

  -- User overrides — merge with existing, or add as new group
  for name, overrides in pairs(config.overrides) do
    if groups[name] then
      groups[name] = vim.tbl_extend("force", groups[name], overrides)
    else
      groups[name] = overrides
    end
  end

  -- Apply all highlight groups — strip nil/false style attrs (nvim_set_hl is strict)
  for name, hl in pairs(groups) do
    local clean = {}
    for k, v in pairs(hl) do
      if v ~= nil then
        if k == "italic" or k == "bold" or k == "underline" or k == "undercurl"
          or k == "strikethrough" or k == "reverse" or k == "standout"
          or k == "nocombine" or k == "underdouble" or k == "underdotted"
          or k == "underdashed" then
          if v == true and not (k == "bold" and not config.bold) then
            clean[k] = true
          end
        else
          clean[k] = v
        end
      end
    end
    vim.api.nvim_set_hl(0, name, clean)
  end

  M.fix_bufferline_devicons(palette)
end

---Fix dynamically generated bufferline.nvim devicon backgrounds.
---bufferline derives BufferLineDevIcon* groups from nvim-web-devicons and caches
---them, so stale groups can keep a black icon cell after a colorscheme reload.
---@param c table palette colors
function M.fix_bufferline_devicons(c)
  local function patch()
    pcall(function()
      local bufferline_hl = require("bufferline.highlights")
      if bufferline_hl.reset_icon_hl_cache then
        bufferline_hl.reset_icon_hl_cache()
      end
    end)

    for name, hl in pairs(vim.api.nvim_get_hl(0, {})) do
      if name:match("^BufferLineDevIcon") and not hl.link then
        if name:match("Selected$") then
          hl.bg = c.bg
          hl.underline = true
          hl.sp = c.green
        else
          hl.bg = c.ui_bg
          hl.underline = nil
          hl.sp = nil
        end
        vim.api.nvim_set_hl(0, name, hl)
      end
    end
  end

  patch()
  vim.schedule(patch)
end

---Set terminal colors (0-15) — stays in amber/green/black space
---@param c table palette colors
function M.set_terminal_colors(c)
  -- Slots 0-7: normal ANSI
  vim.g.terminal_color_0  = c.bg        -- black
  vim.g.terminal_color_1  = c.error     -- red → warm rust-red
  vim.g.terminal_color_2  = c.green     -- green → Matrix green
  vim.g.terminal_color_3  = c.fg        -- yellow → amber primary
  vim.g.terminal_color_4  = c.comment   -- blue slot → dim amber (in-palette)
  vim.g.terminal_color_5  = c.comment   -- magenta slot → dim amber (in-palette)
  vim.g.terminal_color_6  = c.string    -- cyan slot → lime string
  vim.g.terminal_color_7  = c.fg        -- white → amber fg
  -- Slots 8-15: bright variants
  vim.g.terminal_color_8  = c.ui_bg     -- bright black → UI chrome
  vim.g.terminal_color_9  = c.error     -- bright red
  vim.g.terminal_color_10 = c.string    -- bright green → lime string
  vim.g.terminal_color_11 = c.fg        -- bright yellow
  vim.g.terminal_color_12 = c.comment   -- bright blue → dim amber
  vim.g.terminal_color_13 = c.comment   -- bright magenta → dim amber
  vim.g.terminal_color_14 = c.green     -- bright cyan → Matrix green
  vim.g.terminal_color_15 = "#e8d400"   -- bright white → brighter amber
end

return M
