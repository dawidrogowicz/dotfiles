local awful = require("awful")
local beautiful = require("beautiful")

-- {{{ Menu }}}
-- Create a launcher widget and a main menu
local terminal = RC.vars.terminal
local editor = os.getenv("EDITOR") or "nano"
local editor_cmd = terminal .. " -e " .. editor

local awesome_submenu = {
  { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
  { "manual", terminal .. " -e man awesome" },
  { "edit config", editor_cmd .. " " .. awesome.conffile },
  { "restart", awesome.restart },
  { "quit", function() awesome.quit() end },
}

local _M = {}
function _M.get()
  return { 
    { "awesome", awesome_submenu, beautiful.awesome_icon },
    { "open terminal", terminal }
  }
end

return setmetatable({}, { __call = function(_, ...) return _M.get(...) end })
