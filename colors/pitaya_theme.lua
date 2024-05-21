local system_colors = {
	c17 = "#00005f",
	c24 = "#005f87",
	c38 = "#00afd7",
	c44 = "#00d7d7",
	c51 = "#00ffff",
	c58 = "#5f5f00",
	c75 = "#5fafff",
	c151 = "#afd7af",
	c160 = "#d70000",
	c164 = "#d700d7",
	c186 = "#d7d787",
	c234 = "#1c1c1c",
	c235 = "#262626",
	c236 = "#303030",
	c237 = "#3a3a3a",
	c238 = "#444444",
	c239 = "#4e4e4e",
	c240 = "#585858",
	c241 = "#626262",
	c242 = "#6c6c6c",
	c243 = "#767676",
	c249 = "#b2b2b2",
	c254 = "#e4e4e4",
}

local colors = {
  white = "#e7e7e7",

	red = "#f27775",
	pink = "#ff64b5",
	blue = "#6ab9c9",
	green = "#64e6ae",
	yellow = "#d0e385",
	orange = "#f2a475",
	dead_orange = "#cf9d81",

	dark_green = "#062d06",
	dark_red = "#440606",
	dark_blue = "#141c2e",

	subtle = "#908caa",
	subtle_darker = "#444351",
	love = "#eb6f92",
	rose = "#ea9a97",
	foam = "#9ccfd8",
	iris = "#c4a7e7",
	subtle_green = "#61977c",
}

local color_groups = {
	comment = system_colors.c241,
}

local M = {
	system_colors = system_colors,
	colors = colors,
	color_groups = color_groups,
}

return M
