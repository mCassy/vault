-- vault palette — single source of truth for all colors
-- Phase 1: 6 base colors only. Phase 2 derives all UI/error/selection colors from these.
-- Perceptual validation: #7aff00 (string) vs #00ff41 (keyword) MUST be verified in real
-- code (PAL-02). If they read as the same category, shift string to #aaff00.

local M = {}

M.colors = {
  none    = "NONE",     -- sentinel for transparent bg (opts.transparent = true)
  bg      = "#0a0a00",  -- near-black, warm tinted background
  fg      = "#c8b400",  -- amber phosphor — primary text
  green   = "#00ff41",  -- Matrix green — keyword accent (≤15% of visible tokens)
  comment = "#5a5200",  -- dim amber — comments (italic, muted)
  string  = "#7aff00",  -- brighter lime-green — strings (distinct from keyword green)
  ui_bg   = "#2a2800",  -- warm near-black — UI chrome, floats, inactive zones

  -- Derived semantic colors (Phase 2) — stay in amber-green-black space
  error      = "#cc4400",  -- warm rust-red — DiagnosticError, git delete
  warning    = "#c87000",  -- amber-orange — DiagnosticWarn
  info       = "#7aaa00",  -- muted lime — DiagnosticInfo
  hint       = "#5a5200",  -- re-use comment color — DiagnosticHint (de-emphasized)
  selection  = "#2a3a00",  -- dark green-tinted bg — Visual, selection bg
  search_bg  = "#4a4200",  -- warm mid-amber bg — Search highlight bg

  -- Derived git diff tints (Phase 3) — very subtle near-black bg tints for gitsigns line/word highlights
  git_add_bg    = "#0a1200",  -- near-black, faint green cast  — GIT-02 (GitSignsAddLn)
  git_change_bg = "#120f00",  -- near-black, faint amber cast  — GIT-02 (GitSignsChangeLn)
  git_delete_bg = "#130500",  -- near-black, faint rust cast   — GIT-02 (GitSignsDeleteLn)
}

return M
