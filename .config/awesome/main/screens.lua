local beautiful = require("beautiful")
local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local cpu_widget = require("awesome-wm-widgets.cpu-widget.cpu-widget")
local hw_stats_widget = require("helpers.hw-stats-widget")


local default_layouts = {
  awful.layout.suit.spiral,
  awful.layout.suit.spiral,
  awful.layout.suit.spiral,
}

local _M = {}
function _M.get()
  awful.screen.connect_for_each_screen(function(s)
      -- Each screen has its own tag table.
      awful.tag({ "1", "2", "3", "4", "5" }, s, default_layouts[s.index])

      -- Create a promptbox for each screen
      s.mypromptbox = awful.widget.prompt()
      -- Create an imagebox widget which will contain an icon indicating which layout we're using.
      -- We need one layoutbox per screen.
      s.mylayoutbox = awful.widget.layoutbox(s)
      s.mylayoutbox:buttons(gears.table.join(
                             awful.button({ }, 1, function () awful.layout.inc( 1) end),
                             awful.button({ }, 3, function () awful.layout.inc(-1) end),
                             awful.button({ }, 4, function () awful.layout.inc( 1) end),
                             awful.button({ }, 5, function () awful.layout.inc(-1) end)))
      -- Create a taglist widget
      s.mytaglist = awful.widget.taglist {
          screen  = s,
          filter  = awful.widget.taglist.filter.all,
          buttons = RC.wibar.taglist_buttons
      }

      -- Create a tasklist widget
      s.mytasklist = awful.widget.tasklist {
          screen  = s,
          filter  = awful.widget.tasklist.filter.currenttags,
          buttons = RC.wibar.tasklist_buttons
      }

      -- Create the wibox
      s.mywibox = awful.wibar({ position = "top", screen = s })

      -- Add widgets to the wibox
      s.mywibox:setup {
          layout = wibox.layout.align.horizontal,
          { -- Left widgets
              layout = wibox.layout.fixed.horizontal,
              RC.launcher,
              s.mytaglist,
              s.mypromptbox,
          },
          s.mytasklist, -- Middle widget
          { -- Right widgets
              layout = wibox.layout.fixed.horizontal,
              cpu_widget(),
              hw_stats_widget(),
              RC.keyboardlayout,
              RC.wibar.textclock,
              s.mylayoutbox,
          },
      }
  end)
end

return setmetatable({}, { __call = function(_, ...) return _M.get(...) end })
