local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local gears = require("gears")
local wibox = require("wibox")

local home = os.getenv('HOME')
local themes_path = home .. "/.config/awesome"

theme = {
  font = "Monofur Nerd Font bold 15",
  font_name = "Monofur Nerd Font",
  font_asian = "Noto Sans Mono CJK JP 18",

  useless_gap = dpi(5),
 
--  bg_focus = "#141b1e",
  bg_normal = "#242d35",
--  bg_urgent = "#0000ff",
--  bg_minimize = "#734251",

  fg_focus = "#ffffff",
  fg_normal = "#ffffff",
  fg_urgent = "#d7827e",
  fg_minimize = "#ffffff",

  border_width = dpi(3),
  border_focus = "#1a2026",
  border_normal  = border_focus,
  border_marked = "#ea9d34",

  bar_bg = "#242d35",
  bar_fg = "#ffffff",
  bg_titlebar = "#1a2026",
  md_bg_titlebar = "#242d35",

  bg_systray = "#242d35",
  systray_icon_spacing = 7,

  tasklist_bg_focus = "#242d35",
  tasklist_bg_normal = "#242d35",
  tasklist_bg_minimize = "#242d35",
  tasklist_disable_task_name = true,
  tasklist_plain_task_name = true,
  tasklist_spacing = 5,

  taglist_fg_focus = "#f4f5f2",
  taglist_fg_occupied = "#758392",
  taglist_bg_focus = "#526170",
--  taglist_bg_occupied = "#141b1e",
  taglist_spacing = 8,

  time_day = "#94cf95",
  time_night = "#4cb9d6",

  dashboard_module = "#242d35",

  wallpaper = themes_path .. "/wallpaper/surtr_other.jpg",

  titlebar_close_button_normal = themes_path .. "/icons/titlebar/inactive.png",
  titlebar_close_button_focus = themes_path .. "/icons/titlebar/close.png",

  titlebar_floating_button_focus_active = themes_path .. "/icons/titlebar/max.png",
  titlebar_floating_button_normal_active = themes_path .. "/icons/titlebar/max.png",
  titlebar_floating_button_focus_inactive = themes_path .. "/icons/titlebar/max.png",
  titlebar_floating_button_normal_inactive = themes_path .. "/icons/titlebar/inactive.png",

  titlebar_maximized_button_normal_active = themes_path .. "/icons/titlebar/ontop.png",
  titlebar_maximized_button_focus_active = themes_path .. "/icons/titlebar/ontop.png",
  titlebar_maximized_button_normal_inactive = themes_path .. "/icons/titlebar/inactive.png",
  titlebar_maximized_button_focus_inactive = themes_path .. "/icons/titlebar/ontop.png",

  -- Image
  awesome_icon = themes_path .. "/icons/awesome.png",
  noche = themes_path .. "/icons/night.png",
  dia = themes_path .. "/icons/day.png",
  cactus = themes_path .. "/icons/cactus.png",
  cactu = themes_path .. "/icons/cactu.png",
  pfp = themes_path .. "/icons/pfp.jpg",


  icon_theme = nil,
}



return theme

