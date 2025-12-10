require('common');

local settings = T{ };
settings["clocks"] = T{ };
settings["clocks"][1] = T{ };
settings["font"] = T{ };
settings["font"]["background"] = T{ };
settings["clocks"][1][1] = ":";
settings["clocks"][1][2] = 1;
settings["format"] = "[%I:%M:%S]";
settings["font"]["font_height"] = 15;
settings["font"]["font_family"] = "Arial";
settings["font"]["color"] = 4294967295;
settings["font"]["visible"] = true;
settings["font"]["background"]["visible"] = true;
settings["font"]["background"]["color"] = 2147483648;
settings["font"]["position_y"] = 0;
settings["font"]["position_x"] = 130;
settings["separator"] = " - ";

return settings;
