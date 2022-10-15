local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")

client.connect_signal("request::titlebars", function (c)

  local buttons = gears.table.join(
    awful.button({ }, 1, function()
      c:emit_signal("request::activate", "titlebar", {raise = true})
      awful.mouse.client.move(c)
    end),
    awful.button({ }, 3, function()
      c:emit_signal("request::activate", "titlebar", {raise = true})
      awful.mouse.client.resize(c)
    end)
  )

  local titlebar = awful.titlebar(c, {
      height    = 20,
      bg_normal = "#7e7d84",
      bg_focus = "#d18977",
      position = "left"
  })
  -- buttons for the titlebar
  local buttons = gears.table.join(
      awful.button({ }, 1, function()
          client.focus = c
          c:raise()
          awful.mouse.client.move(c)
      end),
      awful.button({ }, 3, function()
          client.focus = c
          c:raise()
          awful.mouse.client.resize(c)
      end)
  )
  awful.titlebar : setup {
      { -- Left
          awful.titlebar.widget.iconwidget(c),
          buttons = buttons,
          layout  = wibox.layout.fixed.vertical()
      },
      { -- Right
          awful.titlebar.widget.floatingbutton (c),
          awful.titlebar.widget.maximizedbutton(c),
          awful.titlebar.widget.closebutton    (c),
          layout = wibox.layout.fixed.vertical()
      },
      layout = wibox.layout.align.vertical
}
end)
