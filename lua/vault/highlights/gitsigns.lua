-- vault highlight groups: gitsigns integration (~12 groups)
-- Covers: GIT-01 (sign column), GIT-02 (line highlights), GIT-03 (word diff),
--         GIT-04 (rust-red for delete — not pure red)
local M = {}

function M.get(c)
  return {
    -- Sign column groups (GIT-01, GIT-04) — fg only; bg inherited from SignColumn
    -- CRITICAL: fg = only for sign groups. NO bg here — sign column bg comes from SignColumn.
    GitSignsAdd          = { fg = c.green },              -- added lines: Matrix green (GIT-01)
    GitSignsChange       = { fg = c.fg },                 -- changed lines: amber phosphor (GIT-01)
    GitSignsDelete       = { fg = c.error },              -- deleted lines: warm rust-red #cc4400 (GIT-01, GIT-04)
    GitSignsChangedelete = { fg = c.fg },                 -- change+delete combined: amber
    GitSignsTopdelete    = { fg = c.error },              -- deletion at top of hunk: rust-red
    GitSignsUntracked    = { fg = c.comment },            -- untracked files: dim amber

    -- Line highlight groups (GIT-02) — bg ONLY; subtle near-black tints per D-09
    -- CRITICAL: bg = only for Ln groups. Using fg = here forces all line text to one color.
    GitSignsAddLn        = { bg = c.git_add_bg },         -- added line bg: #0a1200 faint green cast
    GitSignsChangeLn     = { bg = c.git_change_bg },      -- changed line bg: #120f00 faint amber cast
    GitSignsDeleteLn     = { bg = c.git_delete_bg },      -- deleted line bg: #130500 faint rust cast

    -- Word diff inline groups (GIT-03) — slightly more visible than line tints per D-10
    -- Use fg = for inline markers so word boundaries are legible within the line
    GitSignsAddInline    = { fg = c.green },              -- added word region: Matrix green
    GitSignsChangeInline = { fg = c.fg },                 -- changed word region: amber
    GitSignsDeleteInline = { fg = c.error },              -- deleted word region: warm rust-red
  }
end

return M
