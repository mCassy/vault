---@class VaultItalics
---@field comments boolean Enable italics for comments
---@field keywords boolean Enable italics for keywords
---@field functions boolean Enable italics for functions
---@field strings boolean Enable italics for strings
---@field variables boolean Enable italics for variables
---@field parameters boolean Enable italics for parameters

---@class VaultConfig
---@field transparent boolean Enable transparent background
---@field terminal_colors boolean Set terminal colors (0-15)
---@field italics boolean|VaultItalics Enable italic styling
---@field overrides table<string, vim.api.keyset.highlight> Highlight group overrides

---@type VaultConfig
local defaults = {
  transparent = false,
  terminal_colors = true,
  italics = {
    comments = true,
    keywords = false,
    functions = false,
    strings = false,
    variables = false,
    parameters = false,
  },
  overrides = {},
}

---@type VaultConfig
local M = vim.deepcopy(defaults)

---Setup vault colorscheme options
---@param opts? VaultConfig
function M.setup(opts)
  opts = opts or {}

  if type(opts.italics) == "boolean" then
    local enabled = opts.italics
    opts.italics = {
      comments = enabled,
      keywords = enabled,
      functions = enabled,
      strings = enabled,
      variables = enabled,
      parameters = enabled,
    }
  end

  for k, v in pairs(opts) do
    if k == "italics" and type(v) == "table" then
      M.italics = vim.tbl_extend("force", defaults.italics, v)
    elseif k == "overrides" then
      M.overrides = v
    elseif defaults[k] ~= nil then
      M[k] = v
    end
  end
end

---Reset config to defaults
function M.reset()
  for k, v in pairs(defaults) do
    M[k] = vim.deepcopy(v)
  end
end

---Returns true if italic enabled for category, nil otherwise (nvim_set_hl compatibility)
---@param category string
---@return boolean|nil
function M.is_italic(category)
  if type(M.italics) == "table" and M.italics[category] == true then
    return true
  end
  return nil
end

return M
