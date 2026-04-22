-- vault colorscheme entry point
-- Invoked by `:colorscheme vault` or lazy.nvim plugin activation.
-- Delegates the full load sequence (hi clear / syntax reset / groups) to vault.load().

local ok, vault = pcall(require, "vault")
if ok then
  vault.load()
else
  -- Graceful degradation: minimum highlight so Neovim doesn't crash.
  vim.api.nvim_set_hl(0, "Normal", { fg = "#c8b400", bg = "#0a0a00" })
  vim.notify("vault: failed to load plugin module — " .. tostring(vault), vim.log.levels.WARN)
end
