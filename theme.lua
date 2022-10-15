local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local themes_path = "/home/polo/.config/awesome"

theme = {
  font_name = "FiraCode Nerd Font",
  font_asian = "Noto Sans Mono CJK SC",

  useless_gap = dpi(10),
  border_width = dpi(2),
  border_normal = "#0d1b2a",
  border_focus  = "#0d1b2a",

  wallpaper = themes_path .. "/wallpaper/ibuki.jpg",

  titlebar_close_button_normal = themes_path .. "/icons/titlebar/close.png",
  titlebar_close_button_focus = themes_path .. "/icons/titlebar/close.png",

  titlebar_floating_button_focus_active = themes_path .. "/icons/titlebar/maximize.png",
  titlebar_floating_button_normal_active = themes_path .. "/icons/titlebar/maximize.png",
  titlebar_floating_button_focus_inactive = themes_path .. "/icons/titlebar/maximize.png",
  titlebar_floating_button_normal_inactive = themes_path .. "/icons/titlebar/maximize.png",

  titlebar_maximized_button_normal_active = themes_path .. "/icons/titlebar/minimize.png",
  titlebar_maximized_button_focus_inactive = themes_path .. "/icons/titlebar/minimize.png",
  titlebar_maximized_button_normal_active = themes_path .. "/icons/titlebar/minimize.png",
  titlebar_maximized_button_focus_inactive = themes_path .. "/icons/titlebar/minimize.png",
  awesome_icon = themes_path .. "/icons/awesome.png",
  icon_theme = nil
}


return theme

