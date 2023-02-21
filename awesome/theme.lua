local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local gears = require("gears")
local wibox = require("wibox")

local home = os.getenv('HOME')
local themes_path = home .. "/.config/awesome"

local theme = {}

-- Font
theme.font = "Monofur Nerd Font bold 14"
theme.font_name = "Monofur Nerd Font"
theme.font_asian = "Noto Sans Mono CJK JP"

theme.useless_gap = dpi(5)
 
--theme.bg_focus = "#141b1e"
theme.bg_normal = "#242d35"
--theme.bg_urgent = "#0000ff"
--theme.bg_minimize = "#734251"

theme.fg_focus = "#ffffff"
theme.fg_normal = "#ffffff"
theme.fg_urgent = "#d7827e"
theme.fg_minimize = "#1a2026"

theme.border_width = dpi(3)
theme.border_focus = "#1a2026"
theme.border_normal  = border_focus
theme.border_marked = "#ea9d34"

theme.bar_bg = "#242d35"
theme.bar_fg = "#ffffff"
theme.bg_titlebar = "#1a2026"
theme.md_bg_titlebar = "#242d35"

theme.bg_systray = "#242d35"
theme.systray_icon_spacing = 7

theme.tasklist_bg_focus = "#242d35"
theme.tasklist_bg_normal = "#242d35"
theme.tasklist_bg_minimize = "#242d35"
theme.tasklist_disable_task_name = true
theme.tasklist_plain_task_name = true
theme.tasklist_spacing = 5

theme.taglist_fg_focus = "#f4f5f2"
theme.taglist_fg_occupied = "#97a5b4"
theme.taglist_fg_empty = "#526170"
theme.taglist_bg_focus = "#526170"
--theme.taglist_bg_occupied = "#141b1e"
theme.taglist_spacing = 7

theme.time_day = "#94cf95"
theme.time_night = "#4cb9d6"

theme.music_bg = "#f692b2"

theme.dashboard_module = "#242d35"

theme.wallpaper = themes_path .. "/wallpaper/suwako.jpg"

theme.titlebar_close_button_normal = themes_path .. "/icons/titlebar/inactive.png"
theme.titlebar_close_button_focus = themes_path .. "/icons/titlebar/close.png"

theme.titlebar_floating_button_focus_active = themes_path .. "/icons/titlebar/max.png"
theme.titlebar_floating_button_normal_active = themes_path .. "/icons/titlebar/max.png"
theme.titlebar_floating_button_focus_inactive = themes_path .. "/icons/titlebar/max.png"
theme.titlebar_floating_button_normal_inactive = themes_path .. "/icons/titlebar/inactive.png"

theme.titlebar_maximized_button_normal_active = themes_path .. "/icons/titlebar/ontop.png"
theme.titlebar_maximized_button_focus_active = themes_path .. "/icons/titlebar/ontop.png"
theme.titlebar_maximized_button_normal_inactive = themes_path .. "/icons/titlebar/inactive.png"
theme.titlebar_maximized_button_focus_inactive = themes_path .. "/icons/titlebar/ontop.png"

-- Image
theme.awesome_icon = themes_path .. "/icons/awesome.png"
theme.noche = themes_path .. "/icons/night.png"
theme.dia = themes_path .. "/icons/day.png"
theme.pfp = themes_path .. "/icons/pfp.jpg"
theme.music = themes_path .. "/icons/music.png"
theme.musica = themes_path .. "/icons/musica.png"
theme.poweroff = themes_path .. "/icons/poweroff.png"

theme.icon_theme = nil

return theme

