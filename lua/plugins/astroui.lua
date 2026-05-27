local function tab_git_status(bufnr)
  local status = vim.b[bufnr].gitsigns_status_dict
  if not status then return "" end
  if status.added and status.added > 0 then return "+" end
  if status.changed and status.changed > 0 then return "~" end
  if status.removed and status.removed > 0 then return "-" end
  return ""
end

---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@param opts AstroUIOpts
  opts = function(_, opts)
    local provider = require "astroui.status.provider"
    if not provider._tab_git_status_wrapped then
      local filename = provider.filename
      provider.filename = function(provider_opts)
        local base = filename(provider_opts)
        return function(self)
          local text = base(self)
          if not (self and self.tab_type) then return text end

          local git_status = tab_git_status(self.bufnr)
          if git_status == "" then return text end

          return git_status .. " " .. text
        end
      end
      provider._tab_git_status_wrapped = true
    end

    opts.colorscheme = "astrodark"
    opts.highlights = opts.highlights or {
      init = {},
      astrodark = {},
    }
    opts.icons = vim.tbl_extend("force", opts.icons or {}, {
      LSPLoading1 = "⠋",
      LSPLoading2 = "⠙",
      LSPLoading3 = "⠹",
      LSPLoading4 = "⠸",
      LSPLoading5 = "⠼",
      LSPLoading6 = "⠴",
      LSPLoading7 = "⠦",
      LSPLoading8 = "⠧",
      LSPLoading9 = "⠇",
      LSPLoading10 = "⠏",
    })
  end,
  specs = {
    {
      "AstroNvim/astrocore",
      ---@param astro_opts AstroCoreOpts
      opts = function(_, astro_opts)
        astro_opts.autocmds = astro_opts.autocmds or {}
        astro_opts.autocmds.git_tabline_redraw = {
          {
            event = "User",
            pattern = "GitSignsUpdate",
            desc = "Redraw tabline when git status changes",
            callback = function() vim.schedule(vim.cmd.redrawtabline) end,
          },
        }
      end,
    },
  },
}
