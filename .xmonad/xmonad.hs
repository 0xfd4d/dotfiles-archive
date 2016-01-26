import XMonad

import XMonad.Hooks.SetWMName
import XMonad.Layout.Spacing 
main = xmonad defaultConfig
        { modMask               = mod4Mask --Use Super instead of Alt
          , terminal            = "urxvt"
          , workspaces          = myWorkspaces
          , startupHook         = setWMName "LG3D"
          , borderWidth         = 2
          , normalBorderColor   = "none"
          , focusedBorderColor  = "#353b3e"
          , layoutHook = spacing 2 $ Tall 1 (50/100) (1/2)
        }

myWorkspaces :: [String]
myWorkspaces =  ["1:www","2:dev","3:term","4:media"] ++ map show [5..9]
