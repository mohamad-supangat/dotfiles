local wezterm = require('wezterm')
local mappings = require('modules.mappings')
local config = wezterm.config_builder()

config.term = 'xterm-256color'
config.default_cursor_style = 'BlinkingBlock'
config.color_scheme = 'Gruvbox Material (Gogh)'

config.font = wezterm.font('JetBrains Mono')
config.font_size = 12

config.use_fancy_tab_bar = true
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true
config.tab_max_width = 999999
config.window_decorations = 'RESIZE'

-- key bindings
config.leader = mappings.leader
config.keys = mappings.keys
config.key_tables = mappings.key_tables

wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

return config
