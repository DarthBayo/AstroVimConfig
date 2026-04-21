---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    mappings = {
      n = {
        -- Move tabs (like Ctrl+Shift+PageUp/Down in browsers)
        ["<C-S-PageUp>"] = {
          function() require("astrocore.buffer").move(-vim.v.count1) end,
          desc = "Move buffer tab left",
        },
        ["<C-S-PageDown>"] = {
          function() require("astrocore.buffer").move(vim.v.count1) end,
          desc = "Move buffer tab right",
        },

        -- Navigate tabs (browser-like, safe through GNOME Terminal + Tmux)
        -- NOTE: Ctrl+Tab and Alt+1-9 are intercepted by GNOME Terminal.
        -- If you disable those shortcuts in Edit → Preferences → Shortcuts,
        -- you can swap these for <C-Tab>/<C-S-Tab> and <A-1>–<A-9>.
        ["<A-l>"] = {
          function() require("astrocore.buffer").nav(vim.v.count1) end,
          desc = "Next buffer tab",
        },
        ["<A-h>"] = {
          function() require("astrocore.buffer").nav(-vim.v.count1) end,
          desc = "Previous buffer tab",
        },

        -- Jump to specific tab by position
        ["<Leader>1"] = { function() require("astrocore.buffer").nav_to(1) end, desc = "Go to buffer tab 1" },
        ["<Leader>2"] = { function() require("astrocore.buffer").nav_to(2) end, desc = "Go to buffer tab 2" },
        ["<Leader>3"] = { function() require("astrocore.buffer").nav_to(3) end, desc = "Go to buffer tab 3" },
        ["<Leader>4"] = { function() require("astrocore.buffer").nav_to(4) end, desc = "Go to buffer tab 4" },
        ["<Leader>5"] = { function() require("astrocore.buffer").nav_to(5) end, desc = "Go to buffer tab 5" },
        ["<Leader>6"] = { function() require("astrocore.buffer").nav_to(6) end, desc = "Go to buffer tab 6" },
        ["<Leader>7"] = { function() require("astrocore.buffer").nav_to(7) end, desc = "Go to buffer tab 7" },
        ["<Leader>8"] = { function() require("astrocore.buffer").nav_to(8) end, desc = "Go to buffer tab 8" },
        ["<Leader>9"] = { function() require("astrocore.buffer").nav_to(9) end, desc = "Go to buffer tab 9" },
      },
    },
  },
}
