local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

local beautiful = require("beautiful")


awesome_logo = wibox.widget({
  {
    widget = wibox.widget.imagebox,
    image = beautiful.awesome_icon,
    resize = true
  },
  margins = 5,
  widget = wibox.container.margin
})

local hola = ({
  {
    {
      font = beautiful.font_name .. "bold 15",
      align = "center",
      valign = "center",
      text = awful.spawn.easy_async_with_shell("bash /home/polo/.config/awesome/cmus.sh"),
      widget = wibox.widget.textbox,
    },
    top = 5,
    bottom = 5,
    widget = wibox.container.margin,
  },
  bg = "#0A0908",
  shape = gears.shape.rounded_rect,
  widget = wibox.container.background,
})


local hour = wibox.widget({
  font = beautiful.font_name .. "bold 15",
  format = "%I:%M %p ",
  right = 5,
  align = "center",
  valign = "center",
  widget = wibox.widget.textclock
})


awful.screen.connect_for_each_screen(function(s)

s.mytaglist = awful.widget.taglist {
    screen  = s,
    filter  = awful.widget.taglist.filter.all,
    style   = {
        shape = gears.shape.rounded_bar,
    },
    layout   = {
        spacing = 8,
        layout  = wibox.layout.fixed.horizontal
    },
     widget_template = {
            {
                {
                    {
                        id = "text_role",
                        widget = wibox.widget.textbox,
                        font = beautiful.font_asian .. "bold 13",
                        align = "center",
                        markup = "DD",
                        valign = "center",
                    },
                    margins = 8,
                    widget = wibox.container.margin,
                },
                widget = wibox.container.background
              },
              id = "background_role",
              bg = beautiful.accent,
              widget = wibox.container.background,

            },
    buttons = taglist_buttons
}


s.mywibar = awful.wibar({
    position = "top",
    screen = s,
    type = "dock",
    ontop = true,
    bg = "#0d1b2a",
    visible = true,
    height = 40,
    width = 1250
  })

  s.mywibar:setup ({
  layout = wibox.layout.align.horizontal,
  {
    layout = wibox.layout.align.horizontal,
    awesome_logo,
    s.mytaglist
  },
  {
    layout = wibox.layout.align.horizontal,
  },
  {
    layout = wibox.layout.align.horizontal,
    hour, 
  }
  })
end)

local function remove_bar(c)
  if c.fullscreen or c.maximized then
    c.screen.mywibar.visible = false 
  else 
    c.screen.mywibar.visible = true
  end
end

local function add_bar(c)
  if c.fullscreen or c.maximized then 
    c.screen.mywibar.visible = true 
  else 
    c.screen.mywibar.visible = true
  end
end

client.connect_signal("property::fullscreen", remove_bar)
client.connect_signal("request::unmanage", add_bar)

