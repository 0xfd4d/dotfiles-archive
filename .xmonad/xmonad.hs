import XMonad

import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.SetWMName

import XMonad.Operations

import XMonad.Layout.Fullscreen

import XMonad.Util.EZConfig
import XMonad.Util.Run

--import qualified  XMonad.StackSet as W
import qualified Data.Map as M

import System.IO

myWorkspaces = ["www","term","dev"] ++ map show [4..9]

myLayouts = tiled ||| Mirror tiled ||| Full
                where
                    tiled = Tall (1) (3/100) (1/2)


myManageHook = composeAll [
    className =? "URxvt" --> doShift "term",
    className =? "Subl3" --> doShift "dev"
    ]

myKeys x = M.union (keys defaultConfig x) (keysToAdd x) 
            where
                keysToAdd = \c -> mkKeymap c $ [
                    ("<XF86AudioRaiseVolume>", spawn "ponymix increase 2"),
                    ("<XF86AudioLowerVolume>", spawn "ponymix decrease 2")
                    ]

main = do
    xmproc <- spawnPipe "/usr/bin/xmobar ~/.xmonad/xmobartop.hs"
    xmonad $ defaultConfig {
        modMask             = mod4Mask,
        terminal            = "urxvt",
        borderWidth         = 1,
        normalBorderColor   = "#081F2D",
        focusedBorderColor  = "#D26939",
        workspaces          = myWorkspaces,
        layoutHook          = avoidStruts $ myLayouts,
        manageHook          = myManageHook <+> manageHook defaultConfig,
        keys                = myKeys,
        startupHook         = setWMName "LG3D",
        logHook             = dynamicLogWithPP xmobarPP {
                                ppOutput            = hPutStrLn xmproc,
                                ppCurrent           = xmobarColor "#D26939" "" . wrap "[" "]",
                                ppTitle             = xmobarColor "#98D1CE" "" . wrap "[" "]",
                                ppHidden            = xmobarColor "#33859D" "",
                                ppHiddenNoWindows   = xmobarColor "#98D1CE" "",
                                ppLayout            = const "" 
                                }
    }
    