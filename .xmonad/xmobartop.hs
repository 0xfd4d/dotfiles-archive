Config { 
    font = "xft:Droid Sans:size=10:regular:antialias=true",
    bgColor = "#0A0F14",
    fgColor = "#98D1CE",
    position = Static { xpos = 0 , ypos = 0, width = 1366, height = 20 },
    commands = [ Run Cpu ["-S", "True", "-t", "CPU: <total>", "-L","5","-H","40","--normal","#D26939","--high","#C33027"] 10, 
                Run Memory ["-S", "True",  "-t","RAM: <usedratio> (<used>MiB of <total>MiB)"] 10,
                Run XMonadLog
                ], 
     template = "%cpu%   %memory%   %XMonadLog%"
   }