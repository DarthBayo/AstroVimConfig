-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Mason

---@type LazySpec
return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      position = "left",
      width = 50,
      mappings = {
        ["gy"] = {
          function(state)
            local node = state.tree:get_node()
            local rel = vim.fn.fnamemodify(node.path, ":~:.")
            vim.fn.setreg("+", rel)
            vim.notify("Copied: " .. rel, vim.log.levels.INFO)
          end,
          desc = "Copy relative path",
        },
        ["gY"] = {
          function(state)
            local node = state.tree:get_node()
            vim.fn.setreg("+", node.path)
            vim.notify("Copied: " .. node.path, vim.log.levels.INFO)
          end,
          desc = "Copy absolute path",
        },
      },
    },
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
      },
      follow_current_file = {
        enabled = true,
      },
    },
  },
}
