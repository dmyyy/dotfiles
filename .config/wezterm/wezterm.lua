local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- font
config.font = wezterm.font("Iosevka")
config.font_size = 12

-- window
config.window_decorations = "NONE"
config.window_padding = {
	bottom = 0,
}
-- TODO: figure out nice transparent bg after https://github.com/pop-os/cosmic-comp/issues/511 lands
-- config.window_background_opacity = 0.9
-- config.text_background_opacity = 0.2

config.automatically_reload_config = true

config.keys = {
	-- switch tabs
	{
		key = "h",
		mods = "SHIFT|CTRL",
		action = wezterm.action.ActivateTabRelative(-1),
	},
	{
		key = "l",
		mods = "SHIFT|CTRL",
		action = wezterm.action.ActivateTabRelative(1),
	},

	-- close open tabs without confirmation
	{
		key = "w",
		mods = "SHIFT|CTRL",
		action = wezterm.action.CloseCurrentTab({ confirm = false }),
	},

	-- -- copy mode with shift-ctrl-c
	-- {
	-- 	key = "c",
	-- 	mods = "SHIFT|CTRL",
	-- 	action = wezterm.action.ActivateCopyMode,
	-- },

	{ key = "{", mods = "SHIFT|CTRL", action = wezterm.action.ScrollByPage(-0.5) },
	{ key = "}", mods = "SHIFT|CTRL", action = wezterm.action.ScrollByPage(0.5) },

	-- toggle dark mode
	{
		key = "d",
		mods = "SHIFT|CTRL",
		action = wezterm.action.EmitEvent("toggle-dark-mode"),
	},
	-- switch between favorite themes
	{
		key = "t",
		mods = "CTRL",
		action = wezterm.action.EmitEvent("switch-theme"),
	},
}

DARK_MODE = true
FAVORITE_LIGHT_THEMES = {
	"Selenized Light (Gogh)",
}
FAVORITE_DARK_THEMES = {
	"CyberPunk",
	"Ayu Mirage",
	"Selenized Dark (Gogh)",
	"s3r0 modified (terminal.sexy)",
}
LIGHT_IDX = 1
DARK_IDX = 1

if DARK_MODE then
	config.color_scheme = FAVORITE_DARK_THEMES[1]
elseif not DARK_MODE then
	config.color_scheme = FAVORITE_LIGHT_THEMES[1]
end

wezterm.on("toggle-dark-mode", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	if not DARK_MODE then
		DARK_MODE = true
		overrides.color_scheme = FAVORITE_DARK_THEMES[DARK_IDX]
	elseif DARK_MODE then
		DARK_MODE = false
		overrides.color_scheme = FAVORITE_LIGHT_THEMES[LIGHT_IDX]
	end
	window:set_config_overrides(overrides)
end)

wezterm.on("switch-theme", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	if DARK_MODE then
		if DARK_IDX < #FAVORITE_DARK_THEMES then
			DARK_IDX = DARK_IDX + 1
		elseif DARK_IDX == #FAVORITE_DARK_THEMES then
			DARK_IDX = 1
		end
		overrides.color_scheme = FAVORITE_DARK_THEMES[DARK_IDX]
	elseif not DARK_MODE then
		if LIGHT_IDX < #FAVORITE_LIGHT_THEMES then
			LIGHT_IDX = LIGHT_IDX + 1
		elseif LIGHT_IDX == #FAVORITE_LIGHT_THEMES then
			LIGHT_IDX = 1
		end
		overrides.color_scheme = FAVORITE_LIGHT_THEMES[LIGHT_IDX]
	end
	window:set_config_overrides(overrides)
end)

return config
