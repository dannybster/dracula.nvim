local dracula = require("dracula")
local configs = dracula.configs()
local colors = dracula.colors()

local bg = configs.lualine_bg_color or colors.ansi_0

local normal = {
  a = { fg = colors.ansi_0, bg = colors.ansi_4, gui = "bold" },
  b = { fg = colors.ansi_4, bg = bg },
  c = { fg = colors.ansi_7, bg = bg },
}

local command = {
  a = { fg = colors.ansi_0, bg = colors.ansi_6, gui = "bold" },
  b = { fg = colors.ansi_6, bg = bg },
}

local visual = {
  a = { fg = colors.ansi_0, bg = colors.ansi_5, gui = "bold" },
  b = { fg = colors.ansi_5, bg = bg },
}

local inactive = {
  a = { fg = colors.ansi_7, bg = colors.visual, gui = "bold" },
  b = { fg = colors.ansi_0, bg = colors.ansi_7 },
}

local replace = {
  a = { fg = colors.ansi_0, bg = colors.ansi_3, gui = "bold" },
  b = { fg = colors.ansi_3, bg = bg },
  c = { fg = colors.ansi_7, bg = bg },
}

local insert = {
  a = { fg = colors.ansi_0, bg = colors.ansi_2, gui = "bold" },
  b = { fg = colors.ansi_2, bg = bg },
  c = { fg = colors.ansi_7, bg = bg },
}

return {
  normal = normal,
  command = command,
  visual = visual,
  inactive = inactive,
  replace = replace,
  insert = insert,
}
