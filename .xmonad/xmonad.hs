import XMonad

import XMonad.Hooks.SetWMName
import XMonad.Layout.Fullscreen

myTerminal      = "urxvt"
myWorkspaces    = ["1:www","2:dev","3:term"] ++ map show [4..9]
myBorderWidth   = 2
myNormalBorderColor = "#353b3e"
myFocusedBorderColor = "lightgrey"

main = do {
        xmonad defaults
    }

defaults = defaultConfig
    { modMask               = mod4Mask 
    , terminal              = myTerminal
    , workspaces            = myWorkspaces
    , startupHook           = setWMName "LG3D"
    , borderWidth           = myBorderWidth
    , normalBorderColor     = myNormalBorderColor
    , focusedBorderColor    = myFocusedBorderColor
    , handleEventHook       = fullscreenEventHook
    }
