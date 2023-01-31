local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

local beautiful = require("beautiful")

awful.screen.connect_for_each_screen(function(s)
    s.mydock = awful.wibar(
    {
        screen = s,
        type = "dock",
        ontop = true,
        bg = "#e1d8cd",
        fg = beautiful.bar_fg,
        visible = true,
        height = 50, width = 500,
        shape =  gears.shape.rounded_rect,
        position = "bottom",
    })
    s.mydock:setup({
        layout = wibox.layout.align.horizontal,
    })
end)