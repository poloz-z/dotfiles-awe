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

semi_rect = function(radius)
  return function(cr,width,height)
    gears.shape.rounded_rect(cr,width,height,radius)
  end
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
    bg = beautiful.bg_normal,
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
          clip_shape = semi_rect(100),
          forced_width = 180,
          forced_height = 180,
          resize = false,
          widget = wibox.widget.imagebox
        },
        widget = wibox.container.place
      },
      margins = 1,
      widget = wibox.container.margin,
    },
    shape = semi_rect(100),
    forced_height = 182,
    forced_width = 182,
    border_width = 2,
    bg = beautiful.bg_normal,
    widget = wibox.container.background
  },
  margins = 4,
  widget = wibox.container.margin
}

local profile = wibox.widget {
  pfp,
  {
    {
      hostname,
      layout = wibox.layout.align.horizontal,
    },
    halign = "center",
    valign = "top",
    widget = wibox.container.place
  },
  layout = wibox.layout.align.vertical
}

local barra = wibox.widget {
  value         = 43,
  max_value     = 60,
  forced_height = 20,
  forced_width  = 100,
  shape         = semi_rect(30),
  border_width  = 2,
  border_color  = beautiful.border_color,
  widget        = wibox.widget.progressbar,
}

--awful.widget.watch("bash -c 'date +%S'", 0.5, function(_,salida)
--  barra.value = tonumber(salida)
--end)
--
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
          bg = beautiful.bg_normal,
          shape = semi_rect(25),
          widget = wibox.container.background
        },
        left = 6,
        right = 12,
        widget = wibox.container.margin
      },
      time_icon,
      layout = wibox.layout.align.horizontal
    },
    margins = 10,
    widget = wibox.container.margin
  },
  valign = "top",
  halign = "center",
  widget = wibox.container.place
}

local fc = wibox.widget(
  {
    font = beautiful.font_name .. " bold 20",
    format = "%A, %d %B %Y",
    widget = wibox.widget.textclock
  })

local fecha = wibox.widget({
  {
    {
      {
        {
          fc,
          layout = wibox.layout.align.horizontal
        },
        margins = 8,
        widget = wibox.container.margin
      },
      shape = semi_rect(25),
      bg  = beautiful.bg_normal,
      widget = wibox.container.background
    },
    top = 25,
    --margins = 10,
    widget = wibox.container.margin
  },
  halign = "center",
  widget = wibox.container.place
})

local song_icon = ({
  {
    {
      image = beautiful.musica,
      resize = true,
      widget = wibox.widget.imagebox
    },
    halign = "center",
    widget = wibox.container.place
  },
  margins = 10,
  widget = wibox.container.margin
})

local song_artist = wibox.widget({
  markup = "ARTIST",
  font = beautiful.font_name .. " 17",
  widget = wibox.widget.textbox
})

awful.widget.watch("bash -c 'playerctl metadata artist'", 2, function(_,salida)
  output = salida
  song_artist.markup = "<span foreground='#c269bc'>"..output.."</span>"
end)

local songtitle = wibox.widget({
  markup = "TITLE",
  font = beautiful.font_name .. " bold 18",
  widget = wibox.widget.textbox
})

awful.widget.watch("bash -c 'playerctl metadata title'", 2, function(_,salida)
  output = salida
  songtitle.markup = "<span foreground='#58d6bf'>"..output.."</span>"
end)

local sonando = wibox.widget ({
  {
    {
      song_artist,
      songtitle,
      layout = wibox.layout.align.vertical
    },
    forced_width = 140,
    forced_height = 150,
    widget = wibox.container.background
  },
  halign = "left",
  widget = wibox.container.place
})

local playing = wibox.widget ({
  {
    {
      {
        {
          sonando,
          song_icon,
          layout = wibox.layout.align.horizontal
        },
        margins = 5,
        widget = wibox.container.margin
      },
      bg = beautiful.bg_normal,
      shape = semi_rect(20),
      forced_height = 150,
      forced_width = 250,
      widget = wibox.container.background
    },
    halign = "left",
    widget = wibox.container.place
  },
  margins = 10,
  widget = wibox.container.margin
})


local uptime = wibox.widget({
  markup = "UPTIME",
  font = beautiful.font_name .. " bold 18",
  widget = wibox.widget.textbox
})

awful.widget.watch("bash -c 'uptime -p'",60,function(_,salida)
  output = salida
  uptime.markup = "<span foreground='#4cb9d6'>"..output.."</span>"
end)

local up = wibox.widget {
  {
    {
      {
        --{
          {
            uptime,
            layout = wibox.layout.align.horizontal
          },
          margins = 6,
          widget = wibox.container.margin
        --},
        --bg = beautiful.bg_normal,
        --shape = gears.shape.rounded_bar,
        --widget = wibox.container.background
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
  markup = "<span foreground='#fb6396'>Esclavo de la cuca no quién la porta. ~Labrusvka</span>",
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
  halign = "left",
  widget = wibox.container.place,
}

local info = wibox.widget {
  {
    hm, up, imagine,
    layout = wibox.layout.align.vertical
  },
  margins = 3,
  widget = wibox.container.margin
}

local volume = wibox.widget {
  value         = 0.5,
  max_value     = 1,
  forced_height = 10,
  forced_width  = 200,
  shape         = semi_rect(30),
  border_width  = 2,
  color         = "#4cb9d6",
  border_color  = "#4cb9d6",
  background_color = "#00000000",
  widget        = wibox.widget.progressbar,
}

awful.widget.watch("bash -c 'playerctl volume'", 1, function(_,salida)
  volume.value = tonumber(salida)
end)

local ram = wibox.widget {
  value         = 34,
  max_value     = 100,
  forced_height = 10,
  forced_width  = 200,
  shape         = semi_rect(30),
  border_width  = 2,
  border_color  = "#c269bc",
  color         = "#c269bc",
  background_color = "#0000000",
  widget        = wibox.widget.progressbar,
}

--awful.widget.watch("bash -c 'free -m | awk 'NR == 2 {print $3}' '", 1, function(_,salida)
--  ram.value = tonumber(salida)
--end)

local procesador = wibox.widget {
  value         = 24,
  max_value     = 100,
  forced_height = 10,
  forced_width  = 100,
  shape         = semi_rect(30),
  border_width  = 2,
  border_color  = "#f92d72",
  color         = "#f92d72",
  background_color = "#00000000",
  widget        = wibox.widget.progressbar,
}

--awful.widget.watch("bash -c ''", 1, function(_,salida)
--  procesador.value = tonumber(salida)
--end)

local bars1 = wibox.widget {
  {
    volume,
    layout = wibox.layout.align.vertical
  },
  top = 15,
  bottom = 10,
  right = 40,
  widget = wibox.container.margin
}

local bars2 = wibox.widget {
  {
    ram,
    layout = wibox.layout.align.vertical
  },
  top = 15,
  bottom = 10,
  right = 40,
  widget = wibox.container.margin
}

local bars3 = wibox.widget {
  {
    procesador,
    layout = wibox.layout.align.vertical
  },
  top = 15,
  bottom = 10,
  right = 40,
  widget = wibox.container.margin
}
local barras = wibox.widget {
  {
    bars1, bars2, bars3,
    layout = wibox.layout.align.vertical
  },
  valign = "center",
  halign = "left",
  widget = wibox.container.place 
}

local process = wibox.widget {
  {
    playing, barras,
    layout = wibox.layout.align.horizontal
  },
  margins = 5,
  widget = wibox.container.margin
}

awful.screen.connect_for_each_screen(function(s)

  main_box = wibox({
    type = "dock",
    shape = semi_rect(30), --gears.shape.rounded_rect,
    screen = s,
    width = 510, height = 500,  --655
    bg = beautiful.border_focus,
    ontop = false,
    visible = true,
    x = 10, y = 10,
  })

  main_box:setup({
    {
      {
        {
          --{
            profile,
            info,
            expand = "none",
            layout = wibox.layout.fixed.horizontal
          --},
          --bg = "#526170",
          --shape = gears.shape.rounded_rect,    
          --widget = wibox.container.background,
        },
        fecha,
        process,
        layout = wibox.layout.fixed.vertical
      },
      margins = 5,
      widget = wibox.container.margin,
    },
    layout = wibox.layout.fixed.vertical,
  })
end)

