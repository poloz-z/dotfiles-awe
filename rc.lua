pcall(require, "luarocks.loader")

-- Modulos Awesome
local awful = require("awful")
local gears = require("gears")

require("awful.autofocus")

local beautiful = require("beautiful")  -- Por implementar 
local wibox = require("wibox")  -- Por implementar

-- Tema
beautiful.init("/home/polo/.config/awesome/theme.lua")

-- Wallpaper
gears.wallpaper.maximized(beautiful.wallpaper, s)

-- Apps 
app = {
  terminal = "sakura",
  navegador = "chromium",
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

awful.tag({"一", "二", "三", "四","五", "六"},s,awful.layout.layouts[1])

require("bind")
require("signal")
require("rules")
require("titlebar")
require("bar")

