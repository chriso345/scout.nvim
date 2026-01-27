---@class Scout.ConfigDefaults
---@field highlight_active string
---@field highlight_inactive string
---@field search_paths string[]
---@field include_folders string[]
---@field exclude_folders string[]
---@field picker "snacks"|"telescope"
---@field active_prefix string
---@diagnostic disable-next-line: undefined-doc-name
---@field layout snacks.picker.layout.Config
---@field preview Scout.PreviewConfig

---@class Scout.PreviewConfig
---@field cmd string

local M = {}

---@type Scout.ConfigDefaults
M.defaults = {
  -- Highlight group used for active/existing tmux sessions in the picker list
  highlight_active = "SnacksPickerDirectory",
  -- Highlight group used for non-existing / suggested paths
  highlight_inactive = "SnacksPickerPathHidden",

  -- List of base paths to scan for folders to offer as new tmux session locations
  -- Expand ~ to the user's home directory
  search_paths = {
    "~/projects",
  },

  -- Extra specific folders to always include as candidate sessions
  include_folders = {},
  -- Folders to exclude from the candidate list (exact path match after expansion)
  exclude_folders = {},

  -- Picker backend to use. "snacks" is implemented; "telescope" is a possible future backend.
  picker = "snacks",

  -- Prefix string used to indicate active tmux sessions in the picker list
  active_prefix = "",

  -- Default layout passed to the snacks picker. Users can override this with their own layout table.
  layout = {
    layout = {
      box = "horizontal",
      width = 0.8,
      min_width = 120,
      height = 0.8,
      {
        box = "vertical",
        border = true,
        title = " Tmux Sessions ",
        -- Input row and list window configuration
        { win = "input", height = 1,     border = "bottom" },
        { win = "list",  border = "none" },
      },
      -- Preview window config (title, border, width)
      { win = "preview", title = " Directory ", border = true, width = 0.5 },
    },
  },

  -- Preview configuration: command used to generate preview content and titles
  -- Switched to a simple directory listing by default to improve portability.
  preview = {
    -- Command run with the selected path, e.g. "ls -la /path/to/dir"
    cmd = "ls -la {path}",
  },
}

return M
