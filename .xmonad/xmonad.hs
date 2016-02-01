import XMonad
import XMonad.Hooks.ManageDocks
import XMonad.Layout.NoBorders
import XMonad.Layout.Tabbed
import XMonad.Layout.StackTile
import XMonad.Hooks.DynamicLog
import XMonad.Util.EZConfig
import XMonad.Operations
import XMonad.Hooks.SetWMName
import XMonad.Layout.Fullscreen
import XMonad.Layout.PerWorkspace (onWorkspace)
import XMonad.Util.Run(spawnPipe)
import qualified  XMonad.StackSet as W
import qualified Data.Map as M

myWorkspaces = ["1:web","2:term","3:dev"] ++ map show [4..9]

myLayouts = ( avoidStruts $ smartBorders $ 
              Tall 1 (3/100) (1/2) |||
              StackTile 1 (3/100) (1/2) ||| 
              simpleTabbed )

--myManageHook = composeAll [
  --className =? "Gtk-recordmydesktop" --> doFloat,
  --className =? "Xmessage"            --> doFloat,
  --className =? "Gxmessage"           --> doFloat,
  --className =? "Galculator"          --> doFloat, 
  --className =? "Gksu"                --> doFloat 
--  ]

myLog = dynamicLogString xmobarPP {
  ppCurrent         = xmobarColor "#33859D" "" . wrap "[" "]",
  ppTitle           = xmobarColor "#98D1CE" "" . wrap "[" "]",
  ppHidden          = xmobarColor "#D26939" "",
  ppHiddenNoWindows = xmobarColor "#98D1CE" ""
  , ppLayout        = xmobarColor "#33859D" "" 
}

myKeys x = M.union (keys defaultConfig x) (keysToAdd x) 
  where
    keysToAdd = \c -> mkKeymap c $ [
      ("<XF86AudioRaiseVolume>", spawn "ponymix increase 2"),
      ("<XF86AudioLowerVolume>", spawn "ponymix decrease 2")
      ]

main = do
  xmproc <- spawnPipe "/usr/bin/xmobar ~/.xmonad/xmobartop.hs"
  xmonad $ defaultConfig {
    modMask            = mod4Mask,
    terminal           = "urxvt",
    borderWidth        = 2,
    normalBorderColor  = "#081F2D",
    focusedBorderColor = "#D26939",
    workspaces         = myWorkspaces,
    layoutHook         = myLayouts,
    logHook            = myLog >>= xmonadPropLog,
    manageHook         = manageHook defaultConfig <+> manageDocks, 
    keys               = myKeys,
    handleEventHook    = fullscreenEventHook,
    startupHook        = setWMName "LG3D" }
    