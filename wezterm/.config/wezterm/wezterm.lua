local wezterm = require("wezterm")
local mappings = require("modules.mappings")

-- Show which key table is active in the status area
-- wezterm.on("update-right-status", function(window, pane)
-- 	local name = window:active_key_table()
-- 	if name then
-- 		name = "TABLE: " .. name
-- 	end
-- 	window:set_right_status(name or "")
-- end)

return {
	default_cursor_style = "BlinkingBlock",
	color_scheme = "Poimandres",
	colors = {
		cursor_bg = "#A6ACCD",
		cursor_border = "#A6ACCD",
		cursor_fg = "#1B1E28",
	},
	-- font
	font = wezterm.font("Iosevka Nerd Font"),
	font_size = 15,
	-- line_height = 1.8,
	window_background_opacity = 0.98,
	-- tab bar
	use_fancy_tab_bar = false,
	tab_bar_at_bottom = false,
	hide_tab_bar_if_only_one_tab = true,
	tab_max_width = 999999,
	-- window_padding = {
	-- 	left = 30,
	-- 	right = 30,
	-- 	top = 30,
	-- 	bottom = 30,
	-- },
	-- window_decorations = "RESIZE",
	inactive_pane_hsb = {
		brightness = 0.7,
	},
	send_composed_key_when_left_alt_is_pressed = false,
	send_composed_key_when_right_alt_is_pressed = true,
	-- key bindings
	leader = mappings.leader,
	keys = mappings.keys,
	key_tables = mappings.key_tables,
}
