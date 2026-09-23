local wezterm = require('wezterm')
local act = wezterm.action

-- if you are *NOT* lazy-loading smart-splits.nvim (recommended)
local function is_vim(pane)
  -- this is set by the plugin, and unset on ExitPre in Neovim
  return pane:get_user_vars().IS_NVIM == 'true'
end

local direction_keys = { h = 'Left', j = 'Down', k = 'Up', l = 'Right' }

local function split_nav(resize_or_move, key)
  return {
    key = key,
    mods = resize_or_move == 'resize' and 'META' or 'CTRL',
    action = wezterm.action_callback(function(win, pane)
      if is_vim(pane) then
        -- pass the keys through to vim/nvim
        win:perform_action({
          SendKey = { key = key, mods = resize_or_move == 'resize' and 'META' or 'CTRL' },
        }, pane)
      else
        if resize_or_move == 'resize' then
          win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
        else
          win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
        end
      end
    end),
  }
end

local config = {}
config.leader = { key = 'b', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
  { key = 'c', mods = 'ALT', action = act.CopyTo('Clipboard') },
  { key = 'v', mods = 'ALT', action = act.PasteFrom('Clipboard') },
  { key = 'r', mods = 'LEADER', action = act.ReloadConfiguration },

  -- tab manager
  --
  { key = 'c', mods = 'LEADER', action = act.SpawnTab('CurrentPaneDomain') },

  { key = 'p', mods = 'LEADER', action = act.ActivateTabRelative(-1) },
  { key = 'n', mods = 'LEADER', action = act.ActivateTabRelative(1) },

  -- Split panes with same directory (Prefix + v / b)
  { key = 'v', mods = 'LEADER', action = act.SplitHorizontal({ domain = 'CurrentPaneDomain' }) },
  { key = 'b', mods = 'LEADER', action = act.SplitVertical({ domain = 'CurrentPaneDomain' }) },

  -- copy mode same as tmux vim mode
  { key = 'Enter', mods = 'LEADER', action = wezterm.action.ActivateCopyMode },
  { key = '[', mods = 'LEADER', action = wezterm.action.ActivateCopyMode },

  { key = 's', mods = 'LEADER', action = act.ShowLauncherArgs({ flags = 'WORKSPACES' }) },

  -- move between split panes
  split_nav('move', 'h'),
  split_nav('move', 'j'),
  split_nav('move', 'k'),
  split_nav('move', 'l'),
  -- resize panes
  split_nav('resize', 'h'),
  split_nav('resize', 'j'),
  split_nav('resize', 'k'),
  split_nav('resize', 'l'),
}

for i = 1, 9 do
  table.insert(config.keys, {
    key = tostring(i),
    mods = 'ALT',
    action = act.ActivateTab(i - 1),
  })
end

return config
