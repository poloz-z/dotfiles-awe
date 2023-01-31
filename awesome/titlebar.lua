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
      bg_focus = beautiful.bg_titlebar,
      bg_normal = beautiful.bg_titlebar,
      position = "top",
      size = beautiful.useless_gap * 6.5
  }):setup 
  {
    {  -- Right
      {
        {
          { 
            spacing = 2,
            --awful.titlebar.widget.floatingbutton (c),
            --awful.titlebar.widget.maximizedbutton(c),
            --awful.titlebar.widget.stickybutton   (c),
            --awful.titlebar.widget.ontopbutton    (c),
            awful.titlebar.widget.closebutton    (c),
            awful.titlebar.widget.floatingbutton (c),
            awful.titlebar.widget.maximizedbutton(c),

            layout = wibox.layout.fixed.horizontal()
          },
          left = 4,
          right = 4,
          top = 1,
          bottom = 1,
          widget = wibox.container.margin,
        },
        bg = beautiful.md_bg_titlebar,
        shape = gears.shape.rounded_rect,
        widget = wibox.container.background,
      },
      top = 2,
      bottom = 2,
      right = 4,
      left = 5,
      widget = wibox.container.margin,
    },
    { -- Center
      {
        {
          --{
            {
              { -- Title
                --align  = "center",
                widget = awful.titlebar.widget.titlewidget(c)
              },
              buttons = buttons,
              --nil,
              --nil,
              layout  = wibox.layout.fixed.horizontal
            },
            left = 7,
            right = 7,
            top = 4,
            bottom = 4,
            widget = wibox.container.margin,
          --},
          --bg = beautiful.md_bg_titlebar,
          --shape = gears.shape.rounded_rect,
          --widget = wibox.container.background,
        },
        left = 3,
        right = 3,
        top = 1,
        bottom = 1,
        widget = wibox.container.margin,
      },
      halign = "center",
      layout = wibox.container.place,
    },
    { -- Right 
      {
        {
          {
            awful.titlebar.widget.iconwidget(c),
            buttons = buttons,
            --nil,
            --nil,
            layout  = wibox.layout.fixed.horizontal
          },
          left = 8,
          right = 8,
          top = 3,
          bottom = 3,
          widget = wibox.container.margin,
        },
        bg = beautiful.md_bg_titlebar,
        shape = gears.shape.rounded_rect,
        widget = wibox.container.background,
      },
      left = 15,
      right = 5,
      bottom = 4,
      top = 2,
      widget = wibox.container.margin,
    },
  layout = wibox.layout.align.horizontal,
  }
end)
