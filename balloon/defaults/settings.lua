require('common');

local settings = T{ };
settings["position"] = T{ };
settings["additional_chat_modes"] = T{ };
settings["scale"] = 1;
settings["position"]["y"] = 1182;
settings["position"]["x"] = 1280;
settings["always_on_top"] = true;
settings["text_speed"] = 100;
settings["move_close"] = true;
settings["in_combat"] = false;
settings["additional_chat_modes"][1] = 144;
settings["theme"] = "default";
settings["no_prompt_close_delay"] = 10;
settings["display_mode"] = 2;
settings["portraits"] = true;
settings["cinematic"] = true;

return settings;
