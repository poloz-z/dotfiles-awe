pcall(require, "luarocks.loader")

-- Modulos Awesome
local awful = require("awful")
local gears = require("gears")

require("awful.autofocus")

local beautiful = require("beautiful")  -- Por implementar 
local wibox = require("wibox")  -- Por implementar

require("awful.hotkeys_popup.keys")

local home = os.getenv("HOME")

-- Tema
beautiful.init(home .. "/.config/awesome/theme.lua")

-- Wallpaper
gears.wallpaper.maximized(beautiful.wallpaper, s)

-- Apps 
app = {
  terminal = "alacritty",
  navegador = "firefox",
  archivador = "thunar"
}

-- Layouts
awful.layout.layouts = {
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
}

awful.tag({"一", "二", "三", "四","五",},s,awful.layout.layouts[1])

require("bind")
require("signal")
require("rules")
require("titlebar")
require("bar")
require("dashboard")  --"En desarrollo"
--require("dock")  --"En desarrollo"

awful.spawn.with_shell("pipewire &")
--awful.spawn.with_shell("udiskie &")
awful.spawn.with_shell("octoxbps-notifier &")
awful.spawn.with_shell("picom -b &")

