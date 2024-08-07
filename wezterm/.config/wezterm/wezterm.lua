local wezterm = require("wezterm")
local sessionizer = require("sessionizer")

local config = {
    audible_bell = "Disabled",
    check_for_updates = false,
    inactive_pane_hsb = {
        hue = 1.0,
        saturation = 1.0,
        brightness = 1.0,
    },
    font_size = 12.0,
    initial_rows = 30,
    initial_cols = 100,
    tab_bar_at_bottom = true,
    launch_menu = {},
    leader = { key="a", mods="CTRL" },
    disable_default_key_bindings = true,
    keys = {
        -- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
        { key = "a", mods = "LEADER|CTRL",  action=wezterm.action{SendString="\x01"}},
        { key = "-", mods = "LEADER",       action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
        { key = "\\",mods = "LEADER",       action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
        { key = "z", mods = "LEADER",       action="TogglePaneZoomState" },
        { key = "c", mods = "LEADER",       action=wezterm.action{SpawnTab="CurrentPaneDomain"}},
        { key = "h", mods = "LEADER",       action=wezterm.action{ActivatePaneDirection="Left"}},
        { key = "j", mods = "LEADER",       action=wezterm.action{ActivatePaneDirection="Down"}},
        { key = "k", mods = "LEADER",       action=wezterm.action{ActivatePaneDirection="Up"}},
        { key = "l", mods = "LEADER",       action=wezterm.action{ActivatePaneDirection="Right"}},
        { key = "H", mods = "LEADER|SHIFT", action=wezterm.action{AdjustPaneSize={"Left", 5}}},
        { key = "J", mods = "LEADER|SHIFT", action=wezterm.action{AdjustPaneSize={"Down", 5}}},
        { key = "K", mods = "LEADER|SHIFT", action=wezterm.action{AdjustPaneSize={"Up", 5}}},
        { key = "L", mods = "LEADER|SHIFT", action=wezterm.action{AdjustPaneSize={"Right", 5}}},
        { key = "1", mods = "LEADER",       action=wezterm.action{ActivateTab=0}},
        { key = "2", mods = "LEADER",       action=wezterm.action{ActivateTab=1}},
        { key = "3", mods = "LEADER",       action=wezterm.action{ActivateTab=2}},
        { key = "4", mods = "LEADER",       action=wezterm.action{ActivateTab=3}},
        { key = "5", mods = "LEADER",       action=wezterm.action{ActivateTab=4}},
        { key = "6", mods = "LEADER",       action=wezterm.action{ActivateTab=5}},
        { key = "7", mods = "LEADER",       action=wezterm.action{ActivateTab=6}},
        { key = "8", mods = "LEADER",       action=wezterm.action{ActivateTab=7}},
        { key = "9", mods = "LEADER",       action=wezterm.action{ActivateTab=8}},
        { key = "&", mods = "LEADER|SHIFT", action=wezterm.action{CloseCurrentTab={confirm=true}}},
        { key = "x", mods = "LEADER",       action=wezterm.action{CloseCurrentPane={confirm=true}}},

        { key = "n", mods="SHIFT|CTRL",     action="ToggleFullScreen" },
        { key ="v",  mods="SHIFT|CTRL",     action=wezterm.action.PasteFrom 'Clipboard'},
        { key ="c",  mods="SHIFT|CTRL",     action=wezterm.action.CopyTo 'Clipboard'},
        { key = "+", mods="SHIFT|CTRL",     action="IncreaseFontSize" },
        { key = "-", mods="CTRL",           action="DecreaseFontSize" },
        { key = "0", mods="CTRL",           action="ResetFontSize" },

        { key = "f", mods="LEADER",         action=wezterm.action_callback(sessionizer.toggle) },
        { key = "w", mods="LEADER",         action=wezterm.action.ShowLauncherArgs { flags = 'FUZZY|WORKSPACES' }, },
    },
    set_environment_variables = {},
}

config.colors = require("rosepine").colors()
config.window_frame = require("rosepine").window_frame()

config.font = wezterm.font 'FiraCode Nerd Font'
config.tab_max_width = 16

config.default_prog = {'pwsh.exe'}

return config
