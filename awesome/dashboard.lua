gears = require("gears")
wibox = require("wibox")
beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local awful = require("awful")

-- Test a context new popup widgets

function run(cmd)
  o = assert(io.popen(cmd, 'r'))
  output = o:read('*all')
  o:close()
  return output
end

local hostname = wibox.widget {
  {
    {
      {
        markup = "<span foreground='#56949f'>@"..run("hostname").."</span>",
        widget = wibox.widget.textbox,
        halign = "center",
        font = beautiful.font_name .. " bold 16"
      },
      margins = 6,
      widget = wibox.container.margin
    },
    bg = beautiful.border_focus,
    shape = gears.shape.rounded_bar,
    forced_height = 38,
    widget = wibox.container.background
  },
  margins = 7,
  widget = wibox.container.margin
}


local pfp = wibox.widget {
  {
    {
      {
        {
          image = beautiful.pfp,
          forced_height = 200,
          forced_width = 200,
          clip_shape = gears.shape.circle,  --gears.shape.rounded_rect,
          resize = true,
          widget = wibox.widget.imagebox
        },
        widget = wibox.container.place
      },
      margins = 1,
      widget = wibox.container.margin,
    },
    shape = gears.shape.rounded_rect,
    forced_height = 180,
    forced_width = 180,
    --border_width = 2,
    --bg = beautiful.border_focus,
    widget = wibox.container.background
  },
  margins = 6,
  widget = wibox.container.margin
}

local profile = wibox.widget {
  pfp,
  {
    {
      hostname,
      layout = wibox.layout.align.horizontal,
    },
    halign = "left",
    valign = "top",
    widget = wibox.container.place
  },
  layout = wibox.layout.align.vertical
}

local barra = wibox.widget {
  {
    max_value     = 60,
    value         = 50,
    forced_height = 20,
    forced_width  = 100,
    shape         = gears.shape.rounded_bar,
    border_width  = 2,
    border_color  = beautiful.border_color,
    widget        = wibox.widget.progressbar,
    id = "barra_con"
  },
  margins = 10,
  widget = wibox.container.margin
}

awesome.connect_signal(20,function (value)
  barra.value = (100 - value)
end)


local test_txt = wibox.widget {
  markup = "<span foreground='#ff0000' >Welcome!!</span>",
  --text = run("rxfetch"),
  font = beautiful.font_name .. " bold 20",
  widget = wibox.widget.textbox,
  valign = "bottom",
  halign = "left",
}

local h_text = wibox.widget {
  markup = "<span foreground='#cecacd'>Time: </span>",
  font = beautiful.font_name .. " 15",
  widget = wibox.widget.textbox
}

local hour = wibox.widget(
  {
    font = beautiful.font_name .. " bold 26",
    format = " %I ",
    widget = wibox.widget.textclock
  })

local min = wibox.widget(
  {
    font = beautiful.font_name .. " 26",
    format = "%M %p ",
    widget = wibox.widget.textclock
  })

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
  shape = gears.shape.circle,
  forced_height = 45,
  forced_width = 45,
  widget = wibox.container.background,
})

local hm = wibox.widget {
  {
    {
      {
        {
          {
            hour, min,
            layout = wibox.layout.align.horizontal
          },
          bg = beautiful.border_focus,
          shape = gears.shape.rounded_bar,
          widget = wibox.container.background
        },
        left = 6,
        right = 12,
        widget = wibox.container.margin
      },
      time_icon,
      layout = wibox.layout.align.horizontal
    },
    margins = 5,
    widget = wibox.container.margin
  },
  valign = "top",
  halign = "center",
  widget = wibox.container.place
}

local fc = wibox.widget(
  {
    fg = "#58d6bf",
    font = beautiful.font_name .. " 18",
    format = "%A, %d %B",
    widget = wibox.widget.textclock
  })

  local fecha = wibox.widget {
  {
    {
      {
        {
          {
            fc,
            layout = wibox.layout.align.horizontal
          },
          margins = 6,
          widget = wibox.container.margin
        },
        bg = beautiful.border_focus,
        shape = gears.shape.rounded_bar,
        widget = wibox.container.background
      },
      top = 25,
      left = 1,
      right = 12,
      widget = wibox.container.margin
    },
    margins = 5,
    widget = wibox.container.margin
  },
  valign = "center",
  halign = "center",
  widget = wibox.container.place
}

local frase = wibox.widget {
  markup = "<span foreground='#fb6396'>Last dance, one kiss, your touch, my fill... </span>",
  font = beautiful.font_name .. " italic 17",
  widget = wibox.widget.textbox
}

local imagine = wibox.widget {
  {
    {
      --{
        frase,
        layout = wibox.layout.align.vertical
      --},
      --bg = beautiful.border_focus,
      --shape = gears.shape.rounded_rect,
      --widget = wibox.container.background
    },
    margins = 10,
    widget = wibox.container.margin
  },
  valign = "top",
  halign = "center",
  widget = wibox.container.place,
}

local info = wibox.widget {
  {
    hm, fecha, imagine,
    layout = wibox.layout.align.vertical
  },
  margins = 3,
  widget = wibox.container.margin
}

awful.screen.connect_for_each_screen(function(s)

  main_box = wibox({
    type = "dock",
    shape =  gears.shape.rounded_rect, --gears.shape.rounded_rect,
    screen = s,
    width = 500, height = 270,  --655
    bg = beautiful.bg_titlebar,
    ontop = false,
    visible = true,
    x = 10, y = 10,
  })

  main_box:setup({
    {
      {
        {
          profile,
          info,
          --barra,
          expand = "none",
          layout = wibox.layout.fixed.horizontal
        },
        bg = beautiful.dashboard_module,
        shape = gears.shape.rounded_rect,    
        widget = wibox.container.background,
      },
      margins = 15,
      widget = wibox.container.margin,
    },
    layout = wibox.layout.fixed.vertical,
  })
end)
