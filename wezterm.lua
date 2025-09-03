local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- General settings
config.default_cwd = "C:\\Users\\jack.hickey.CHIPSIDE\\source\\repos"
config.window_close_confirmation = "NeverPrompt"
config.default_prog = { "powershell.exe", "-NoLogo" }
config.font = wezterm.font("Consolas")
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.window_decorations = "NONE | RESIZE"

-- Window padding
config.window_padding = { left = 15, right = 15, top = 15, bottom = 15 }

-- Color scheme toggle
wezterm.on("toggle-colorscheme", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	overrides.color_scheme = (overrides.color_scheme == "Zenburn") and "Cloud (terminal.sexy)" or "Zenburn"
	window:set_config_overrides(overrides)
end)

-- Colors
config.color_scheme = "Cloud (terminal.sexy)"
config.colors = {
	background = "#0c0b0f",
	cursor_border = "#bea3c7",
	cursor_bg = "#bea3c7",
	tab_bar = {
		background = "#0c0b0f",
		active_tab = { bg_color = "#0c0b0f", fg_color = "#bea3c7" },
		inactive_tab = { bg_color = "#0c0b0f", fg_color = "#f8f2f5" },
		new_tab = { bg_color = "#0c0b0f", fg_color = "white" },
	},
}

return config
