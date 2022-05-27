-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")


RC = {}

-- {{{ Variable definitions }}}
RC.vars = require("main.user-variables")


-- {{{ Error handling }}}
require("main.error-handling")


local main = {
  layouts = require("main.layouts"),
  menu    = require("main.menu"),
  rules   = require("main.rules"),
  theme   = require("main.theme"),
  screens = require("main.screens"),
}

-- Custom Local Library: Keys and Mouse Binding
local bindings = {
  clientbuttons = require("bindings.clientbuttons"),
  clientkeys    = require("bindings.clientkeys"),
  globalkeys    = require("bindings.globalkeys"),
  globalbuttons = require("bindings.globalbuttons"),
  mediakeys     = require("bindings.mediakeys"),
}


-- {{{ Theme }}}
RC.shuffle_theme = main.theme.shuffle_theme
RC.current_wallpaper = main.theme.current_wallpaper
RC.set_wallpaper = main.theme.set_wallpaper


-- {{{ Layouts }}}
awful.layout.layouts = main.layouts


-- {{{ Menu }}}
RC.menu = awful.menu({ items = main.menu()})
RC.launcher = awful.widget.launcher({ image = beautiful.awesome_icon,menu = RC.menu })

-- Menubar configuration
menubar.utils.terminal = RC.vars.terminal -- Set the terminal for applications that require it


-- {{{ Keyboard }}}
RC.keyboardlayout = awful.widget.keyboardlayout()


-- {{{ Wibar }}}
require("decoration.wibar")


-- {{{ Screens }}}
main.screens()


-- {{{ Mouse bindings }}}
root.buttons(bindings.globalbuttons())


-- {{{ Key bindings }}}
RC.globalkeys = bindings.globalkeys()

-- Set keys
root.keys(RC.globalkeys)


-- {{{ Rules }}}
awful.rules.rules = main.rules(
  bindings.clientkeys(),
  bindings.clientbuttons()
)


-- {{{ Signals }}}
require("main.signals")

