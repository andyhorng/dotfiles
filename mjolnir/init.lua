-- Load Extensions
local application = require "mjolnir.application"
local window = require "mjolnir.window"
local hotkey = require "mjolnir.hotkey"
local keycodes = require "mjolnir.keycodes"
local fnutils = require "mjolnir.fnutils"
local alert = require "mjolnir.alert"
local screen = require "mjolnir.screen"
-- User packages
local grid = require "mjolnir.bg.grid"
local hints = require "mjolnir.th.hints"
-- local tiling = require "mjolnir.tiling"

local mash      = {"cmd", "alt", "ctrl"}
local mover = {"cmd", "ctrl"}

-- window movement
-- Set grid size.
grid.GRIDWIDTH = 2
grid.GRIDHEIGHT = 2

-- a helper function that returns another function that resizes the current window
-- to a certain grid size.
local gridset = function(x, y, w, h)
    return function()
        cur_window = window.focusedwindow()
        grid.set(
            cur_window,
            {x=x, y=y, w=w, h=h},
            cur_window:screen()
        )
    end
end

-- hotkey.bind({"cmd"}, "e", hints.windowHints)
hotkey.bind(mover, '0', grid.maximize_window)
hotkey.bind(mover, 'left', gridset(0, 0, 1, 2))
hotkey.bind(mover, 'right', gridset(1, 0, 1, 2))
hotkey.bind(mover, 'up', gridset(0, 0, 2, 1))
hotkey.bind(mover, 'down', gridset(0, 1, 2, 1))

hotkey.bind(mash, 'right', grid.pushwindow_nextscreen)
hotkey.bind(mash, 'left', grid.pushwindow_prevscreen)

-- hotkey.bind(mash, "c", function() tiling.cyclelayout() end)
-- hotkey.bind(mash, "j", function() tiling.cycle(1) end)
-- hotkey.bind(mash, "k", function() tiling.cycle(-1) end)
-- hotkey.bind(mash, "space", function() tiling.promote() end)

-- tiling.set('layouts', {
--   'fullscreen', 'main-vertical'
-- })

alert.show("Mjolnir")
