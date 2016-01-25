import XMonad

import XMonad.Hooks.SetWMName
 
main = xmonad defaultConfig
        { modMask = mod4Mask -- Use Super instead of Alt
          , terminal = "urxvt"
          , workspaces = myWorkspaces
          , startupHook           = setWMName "LG3D"
          , borderWidth = 2
          , normalBorderColor  = "#111111"
          , focusedBorderColor = "#353b3e"
        }

myWorkspaces :: [String]
myWorkspaces =  ["1:www","2:dev","3:term","4:media"] ++ map show [5..9]