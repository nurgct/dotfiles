import XMonad                                                                                                                                                             
    import XMonad.Hooks.DynamicLog
    import XMonad.Hooks.ManageDocks
    import XMonad.Util.EZConfig(additionalKeys)
    import System.IO
    import Graphics.X11.ExtraTypes.XF86
    import XMonad.Hooks.FadeInactive 
    import XMonad.Hooks.EwmhDesktops
    -- The main function --
    main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig
        
    -- Command to launch the bar --
    myBar = "xmobar"
        
     -- Custom PP, configure it as you like. It determines what is being written to the bar.
    myPP = xmobarPP { ppCurrent = xmobarColor "#ff0000" "" . wrap " " " " }
        
    --Custom Terminal Emulutor--
    myTerminal = "sakura"
        
    -- Key binding to toggle the gap for the bar.
    toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)
        
    --Works Spaces--
    myWorkspaces = [" 1 "," 2 "," 3 "," 4 ", " 5 "]
        
    -- Main configuration, override the defaults to your liking.
    myConfig = ewmh $ defaultConfig
                           {
                            handleEventHook = handleEventHook def <+> fullscreenEventHook,
                            modMask = mod4Mask,
                            workspaces = myWorkspaces,
                            terminal = myTerminal
                            } `additionalKeys` 
                                [ ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock"),
                                  ((0, 0x1008FF11), spawn "amixer -q sset Master 2%-"),
                                  ((0, 0x1008FF13), spawn "amixer -q sset Master 2%+"),
                                  ((0, 0x1008FF02), spawn "lux -a 10%"), --increases the monitor brightness--
                                  ((0, 0x1008FF03), spawn "lux -s 10%") --decrease the monitor brightness--   
                                 ]
