local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local wibox = require("wibox")


client.connect_signal("request::titlebars", function (c)

  buttons = gears.table.join(
    awful.button({ }, 1, function()
      c:emit_signal("request::activate", "titlebar", {raise = true})
      awful.mouse.client.move(c)
    end),
    awful.button({ }, 3, function()
      c:emit_signal("request::activate", "titlebar", {raise = true})
      awful.mouse.client.resize(c)
    end)
  )

  awful.titlebar(c, {
      bg_normal = "#0A0908", --"#6c7086",
      bg_focus = "#0A0908",
      position = "left",
      size = beautiful.useless_gap * 3
  }) : setup ({
    { -- top
        spacing = 8,
        {
          awful.titlebar.widget.closebutton(c),
          top = 10,
          left = 3,
          right = 3,
          widget = wibox.container.margin,
        },
        {
          awful.titlebar.widget.floatingbutton(c),
          left = 3,
          right = 3,
          widget = wibox.container.margin,
        },
        {
          awful.titlebar.widget.maximizedbutton(c),
          left = 3, 
          right = 3,
          widget = wibox.container.margin,
        },
        layout = wibox.layout.fixed.vertical()
    },
    layout = wibox.layout.align.vertical
})
end)
