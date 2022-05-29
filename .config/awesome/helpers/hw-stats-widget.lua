local watch = require("awful.widget.watch")
local wibox = require("wibox")

local hw_stats_widget = {}
local home = os.getenv("HOME")

local _M = {}
function _M.get()
  local CMD = "/bin/sh " .. home .. "/.config/awesome/scripts/hw_stats.sh"
  local timeout = 2

  hw_stats_widget = wibox.widget {
      widget = wibox.widget.textbox,
  }
  container = wibox.widget {
    hw_stats_widget,
    left = 6,
    right = 6,
    layout = wibox.container.margin
  }

  watch(
    CMD,
    timeout,
    function(widget, stdout)
      widget.text = stdout
    end,
    hw_stats_widget
  )

  return container
end

return setmetatable({}, { __call = function(_, ...) return _M.get(...) end })
