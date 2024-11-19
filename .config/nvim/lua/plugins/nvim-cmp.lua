local lspkind_comparator = function(conf)
  local lsp_types = require("cmp.types").lsp
  return function(entry1, entry2)
    if entry1.source.name ~= "nvim_lsp" then
      if entry2.source.name == "nvim_lsp" then
        return false
      else
        return nil
      end
    end
    local kind1 = lsp_types.CompletionItemKind[entry1:get_kind()]
    local kind2 = lsp_types.CompletionItemKind[entry2:get_kind()]

    local priority1 = conf.kind_priority[kind1] or 0
    local priority2 = conf.kind_priority[kind2] or 0
    if priority1 == priority2 then
      return nil
    end
    return priority2 < priority1
  end
end

local label_comparator = function(entry1, entry2)
  return entry1.completion_item.label < entry2.completion_item.label
end

return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")

      -- table.insert(opts.sources, { name = "nvim_lsp" })

      -- use C-y for accepting autocomplete suggestions and disable enter
      opts.mapping = vim.tbl_deep_extend("force", opts.mapping, {
        ["<C-y>"] = cmp.mapping(
          cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Insert }),
          { "i", "c" }
        ),
        ["<CR>"] = cmp.config.disable,
      })

      -- make it so it doesn't start in the middle
      opts.completion = {
        completeopt = "menu,menuone,noinsert",
      }
      opts.preselect = cmp.PreselectMode.None

      opts.sorting.comparators = {
        lspkind_comparator({
          kind_priority = {
            Field = 11,
            Property = 11,
            Constant = 10,
            Enum = 10,
            EnumMember = 10,
            Event = 10,
            Function = 10,
            Method = 10,
            Operator = 10,
            Reference = 10,
            Struct = 10,
            Variable = 9,
            File = 8,
            Folder = 8,
            Class = 5,
            Color = 5,
            Module = 5,
            Keyword = 2,
            Constructor = 1,
            Interface = 1,
            Snippet = 0,
            Text = 1,
            TypeParameter = 1,
            Unit = 1,
            Value = 1,
          },
        }),
        label_comparator,
      }
    end,
  },
}
