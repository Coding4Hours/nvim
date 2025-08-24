-- ============================================================================
-- 1. CACHE VARIABLES
-- These variables will store the pre-computed status strings.
-- They start empty because no LSP clients are attached and no macro is recording initially.
-- ============================================================================
local _cached_lsp_status = ""
local _cached_macro_status = ""

-- ============================================================================
-- 2. "COMPUTE" FUNCTIONS (contain the actual logic)
-- These are the original functions, slightly renamed to reflect their internal role.
-- They compute the *current* state.
-- ============================================================================
local function _compute_lsp_status()
  local clients = vim.lsp.buf_get_clients(0)
  if #clients > 0 then
    local client_names = {}
    for _, client in ipairs(clients) do
      table.insert(client_names, client.name)
    end
    return table.concat(client_names, ", ") .. "] "
  end
  return ""
end

local function _compute_macro_status()
  local recording_register = vim.fn.reg_recording()
  if recording_register ~= "" then
    return "[REC @" .. recording_register .. "] "
  end
  return ""
end

-- ============================================================================
-- 3. UPDATE HANDLERS (for autocommands)
-- These functions will be called by autocommands to update the cache
-- and trigger a statusline redraw.
-- ============================================================================
local function _update_lsp_status()
  _cached_lsp_status = _compute_lsp_status()
  vim.cmd('redrawstatus') -- Force a redraw so the statusline shows the new cached value
end

local function _update_macro_status()
  _cached_macro_status = _compute_macro_status()
  vim.cmd('redrawstatus') -- Force a redraw
end

-- ============================================================================
-- 4. AUTOCAMMANDS (event listeners)
-- These set up the "lazy loading" trigger.
-- ============================================================================
-- Create a unique autocommand group to manage these
local statusline_augroup = vim.api.nvim_create_augroup("MyStatuslineCache", { clear = true })

-- LSP events
vim.api.nvim_create_autocmd({ "LspAttach", "LspDetach" }, {
  group = statusline_augroup,
  -- Use vim.schedule_wrap to ensure the update runs safely after other events
  callback = vim.schedule_wrap(_update_lsp_status),
  desc = "Update cached LSP status for statusline",
})

-- Macro recording events
vim.api.nvim_create_autocmd("RecordingEnter", {
  group = statusline_augroup,
  callback = vim.schedule_wrap(_update_macro_status),
  desc = "Update cached macro status on recording start",
})

vim.api.nvim_create_autocmd("RecordingLeave", {
  group = statusline_augroup,
  callback = vim.schedule_wrap(_update_macro_status),
  desc = "Update cached macro status on recording end",
})

-- Handle buffer switching, as LSP status is buffer-local
vim.api.nvim_create_autocmd("BufEnter", {
  group = statusline_augroup,
  callback = vim.schedule_wrap(_update_lsp_status), -- Re-evaluate LSP status for the new buffer
  desc = "Update cached LSP status on buffer enter",
})

-- ============================================================================
-- 5. EXPOSED STATUSLINE FUNCTIONS (return cached values)
-- These are the functions that will now be called by the `statusline` option.
-- They are extremely fast as they just return a string from a variable.
-- ============================================================================
function get_lsp_status_cached()
  return _cached_lsp_status
end

function get_macro_status_cached()
  return _cached_macro_status
end

-- ============================================================================
-- 6. INITIAL SETUP
-- Call the update handlers once to set the initial cached values when Neovim starts.
-- ============================================================================
_update_lsp_status()
_update_macro_status()

-- ============================================================================
-- 7. SET THE STATUSLINE OPTION
-- Now, the statusline references the *cached* functions.
-- ============================================================================
vim.opt.statusline = table.concat({
  "%#StatusLine#",

  " ",
  "%n",
  " ",
  "%t",
  "%m",
  "%r",
  " ",
  "(%Y)",

  "%=",

  "%{%v:lua.get_lsp_status_cached()%}",   -- Calls the cached function
  "%{%v:lua.get_macro_status_cached()%}", -- Calls the cached function
  "%P",
  " ",

  "%#StatusLineNC#",
}, "")
