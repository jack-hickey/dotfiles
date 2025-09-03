local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.default_cwd = "C:\\Users\\jack.hickey.CHIPSIDE\\source\\repos"
config.window_close_confirmation = "NeverPrompt"
config.default_prog = { "powershell.exe", "-NoLogo" }
config.font = wezterm.font("Consolas")
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "NONE | RESIZE"

config.color_scheme = "Cloud (terminal.sexy)"
config.colors = {
	background = "#0c0b0f",
	cursor_bg = "#bea3c7"
}

return config
