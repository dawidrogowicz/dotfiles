local awful = require("awful")
local beautiful = require("beautiful")

local home = os.getenv("HOME")

-- {{{ Theme }}}
-- Themes define colours, icons, font and wallpapers.
beautiful.init(home .. "/.config/awesome/" .. "gtk-theme.lua")

-- {{{ Wallpaper }}}
local function shuffle_theme()
  awful.spawn.easy_async(
    "/bin/sh -c '~/.scripts/setRandomTheme.sh'",
    awesome.restart
  )
end

return {
  shuffle_theme = shuffle_theme,
}

