local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")

local home = os.getenv("HOME")

-- {{{ Theme }}}
-- Themes define colours, icons, font and wallpapers.
beautiful.init(home .. "/.config/awesome/" .. "gtk-theme.lua")

-- {{{ Wallpaper }}}
local wallpaper_dir = home .. "/Pictures/wallpapers/"

local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

local function shuffle_theme()
  awful.spawn.easy_async(
    "/bin/sh -c 'wpg -m &>/dev/null && wpg -c'",
    function(img_name) awful.screen.connect_for_each_screen(set_wallpaper) end
  )
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

return {
  current_wallpaper = home .. "/.wpg/.current",
  shuffle_theme = shuffle_theme,
  set_wallpaper = set_wallpaper,
}

