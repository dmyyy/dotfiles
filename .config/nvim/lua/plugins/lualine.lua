return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = function()
      local config = require("lualine").get_config()

      -- moves lazy vim lualine to tab line (top of terminal)
      config.tabline.lualine_a = config.sections.lualine_a
      config.tabline.lualine_b = config.sections.lualine_b
      config.tabline.lualine_c = config.sections.lualine_c
      config.tabline.lualine_x = config.sections.lualine_x
      config.tabline.lualine_y = config.sections.lualine_y
      config.tabline.lualine_z = config.sections.lualine_z
      config.sections = {}
      return config
    end,
  },
}

--
