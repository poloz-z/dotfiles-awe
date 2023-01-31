local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

local beautiful = require("beautiful")


local awesome_logo = wibox.widget({
  {
    widget = wibox.widget.imagebox,
    image = beautiful.cactus,
    resize = true
  },
  margins = 3,
  widget = wibox.container.margin,
})

local app = {
  navegador = "firefox", 
  file = "thunar",
  terminal = "alacritty",
  scshot = "gnome-screenshot -d 2"
} 

local launcher_menu = awful.menu({items = {
  { "  terminal", app.terminal },
	{ "  files", app.file },
	{ "  browser", app.browser},
	{ "  screenshot", app.scshot },
}})

local launcher = awful.widget.launcher({image=beautiful.awesome_icon, menu=launcher_menu})

local hour = wibox.widget(
  {
    font = beautiful.font_name .. " bold 15",
    format = " %I:%M %p ",
    right = 5,
    left = 5,
    align = "center",
    valign = "center",
    widget = wibox.widget.textclock
  }
)

local function medier()
  if os.date("%H") >= "06" and os.date("%H") <= "18" then
    return beautiful.dia
  else
    return beautiful.noche
  end
end

local function medier_bg()
  if os.date("%H") >= "06" and os.date("%H") <= "18" then
    return beautiful.time_day
  else
    return beautiful.time_night
  end
end

local time_icon = wibox.widget({
  {
    {
      image = medier(),
      resize = true,
      widget = wibox.widget.imagebox,
    },
    margins = 4,
    widget = wibox.container.margin,
  },
  bg = medier_bg(),
  shape = gears.shape.rounded_rect,
  widget = wibox.container.background,
})

local playerctl = wibox.widget ({
  awful.widget.watch("bash -c $HOME/second.lua", 1),
  layout = wibox.layout.align.horizontal
})


-- Create taglist buttons
local taglist_buttons = gears.table.join(
        awful.button({ }, 1, function(t) t:view_only() end),
        awful.button({ modkey }, 1, function(t)
          if client.focus then
            client.focus:move_to_tag(t)
          end
        end),
        awful.button({ }, 3, awful.tag.viewtoggle),
        awful.button({ modkey }, 3, function(t)
          if client.focus then
            client.focus:toggle_tag(t)
          end
        end),
        awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
        awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end))

local tasklist_buttons = gears.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  c:emit_signal(
                                                      "request::activate",
                                                      "tasklist",
                                                      {raise = true}
                                                  )
                                              end
                                          end),
                     awful.button({ }, 3, function()
                                              awful.menu.client_list({ theme = { width = 250 } })
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                          end))


awful.screen.connect_for_each_screen(function(s)

    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(1)end),
                           awful.button({ }, 3, function () awful.layout.inc(-1)end),
                           awful.button({ }, 4, function () awful.layout.inc(1)end),
                           awful.button({ }, 5, function () awful.layout.inc(-1)end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons,
        style   = {
          shape = gears.shape.circle,
        }
      }

    s.mytasklist = awful.widget.tasklist {
      screen  = s,
      filter  = awful.widget.tasklist.filter.currenttags,
      buttons = tasklist_buttons,
      style = {
        gears.shape.circle,
      },
    }

s.mywibar = awful.wibar({
    position = "bottom",
    screen = s,
    type = "dock",
    ontop = true,
    bg = "#1a2026",
    fg = beautiful.bar_fg,
    visible = true,
    height = 43,
    --width = 1275,
  })

  s.mywibar:setup ({
  layout = wibox.layout.align.horizontal,
  {  -- Left
    { -- Left 1 
      {
        {
          {
            --awesome_logo,
            launcher,
            layout = wibox.layout.fixed.horizontal,
          },
          margins = 6,
          widget = wibox.container.margin,
        },
        bg = beautiful.bar_bg,
        shape = gears.shape.rounded_rect,
        widget = wibox.container.background,
      },
      left = 5,
      right = 5,
      top = 4,
      bottom = 4,
      widget = wibox.container.margin,
    }, 
    layout = wibox.layout.fixed.horizontal,
  
    {  --Left 2
      {
        {
          --{
            s.mytaglist,
            layout = wibox.layout.fixed.horizontal,
          --},
          --left = 1,
          --rigth = 1,
          --widget = wibox.container.margin,
        },
        shape = gears.shape.rounded_rect,
        bg = beautiful.bar_bg,
        fg = beautiful.bar_fg,
        widget = wibox.container.background,
      },
      margins = 5,
      widget = wibox.container.margin,
    },
    layout = wibox.layout.fixed.horizontal,
  },

  {  --Center
    {
      {
        {
          {
            s.mytasklist,
            layout = wibox.layout.align.vertical,
          },
          margins = 7,
          widget  = wibox.container.margin,
        },
        shape  = gears.shape.rounded_rect,
        bg     = beautiful.bar_bg,
        widget = wibox.container.background
      },
      margins = 4,
      widget  = wibox.container.margin
    },
    {
      awful.widget.watch('bash -c "uname -a"',15),
      layout = wibox.layout.align.vertical,
    },
    halign = "center",
    layout = wibox.container.place,
  },

  {  -- Right

    { -- Rigth 1 
      {
        {
          {
            wibox.widget.systray(),
            layout = wibox.layout.fixed.horizontal,
          },
          margins = 5,
          widget  = wibox.container.margin
        },
        bg = beautiful.bar_bg,
        shape = gears.shape.rounded_rect,
        widget = wibox.container.background
      },
      margins = 4,
      widget  = wibox.container.margin
    },

    --{
    --  playerctl,
    --  layout = wibox.layout.align.horizontal
    --},

    {  --Right 2 
      { 
        {
          spacing = 3,
          hour,
          time_icon,
          layout = wibox.layout.align.horizontal,
        },
        bg = beautiful.bar_bg,
        shape = gears.shape.rounded_rect,
        widget = wibox.container.background,
      },
      margins = 4,
      widget = wibox.container.margin,
    },
    layout = wibox.layout.fixed.horizontal,
  },
})end)

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

