local awful = require("awful")
local gears = require("gears")
-- Media Control

local _M = {}
function _M.get()
  return gears.table.join(
    awful.key({ }, "XF86XK_AudioMute", function () awful.util.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle") end,
              {description="Mute Audio", group="media"}),
    awful.key({ }, "XF86XK_AudioLowerVolume", function () awful.util.spawn("pactl set-sink-volume @DEFAULT_SINK@ -10%") end,
              {description="Volume Down", group="media"}),
    awful.key({ }, "XF86XK_AudioRaiseVolume", function () awful.util.spawn("pactl set-sink-volume @DEFAULT_SINK@ +10%") end,
              {description="Volume Up", group="media"}),
    awful.key({ }, "XF86XK_AudioPlay", function () awful.spawn.easy_async("bash -c 'playerctl play-pause'") end,
              {description="Pause/Play", group="media"}),
    awful.key({ }, "XF86XK_AudioPrev", function () awful.util.spawn("playerctl previous") end,
              {description="Previous", group="media"}),
    awful.key({ }, "XF86XK_AudioNext", function () awful.util.spawn("playerctl next") end,
              {description="Next", group="media"})
  )
end

return setmetatable({}, { __call = function(_, ...) return _M.get(...) end })
