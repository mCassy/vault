-- vault colorscheme entry point
-- Neovim loads this file when `:colorscheme vault` is run or when lazy.nvim
-- activates the plugin (priority = 1000, lazy = false).
--
-- Sequence mandated by PLUG-02:
--   1. hi clear           — remove all existing highlights
--   2. syntax reset       — reset syntax highlighting engine
--   3. set colors_name    — register theme name with Neovim
--   4. load highlights    — delegate to lua/vault module

-- Step 1 & 2: clear existing state (standard Neovim colorscheme convention)
if vim.g.colors_name then
  vim.cmd("hi clear")
end
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

-- Step 3: register colorscheme name
vim.g.colors_name = "vault"

-- Step 4: apply highlight groups via vault module
-- Pass any opts stored by a prior setup() call (PLUG-03 overrides support)
local ok, vault = pcall(require, "vault")
if ok then
  local opts = vault._opts or {}
  vault.load(opts)
else
  -- Graceful degradation: set at minimum Normal so Neovim doesn't crash
  vim.api.nvim_set_hl(0, "Normal", { fg = "#c8b400", bg = "#0a0a00" })
  vim.notify("vault: failed to load plugin module — " .. tostring(vault), vim.log.levels.WARN)
end
