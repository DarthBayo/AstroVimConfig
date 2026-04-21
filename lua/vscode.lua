-- Minimal Neovim config for the VSCode Neovim extension.
-- VSCode handles everything (files, tabs, git, terminal, search).
-- This file only configures modal editing behaviour.

local opt = vim.opt

opt.clipboard = "unnamedplus" -- sync with system clipboard
opt.ignorecase = true         -- case-insensitive search...
opt.smartcase = true          -- ...unless query has uppercase
opt.hlsearch = true           -- highlight search matches
opt.incsearch = true          -- show matches while typing
opt.scrolloff = 8             -- keep 8 lines visible around cursor

-- Clear search highlight with Escape in normal mode
vim.keymap.set("n", "<Esc>", "<Cmd>nohlsearch<CR>", { silent = true })

-- Keep visual selection when indenting
vim.keymap.set("v", "<", "<gv", { silent = true })
vim.keymap.set("v", ">", ">gv", { silent = true })

-- Move selected lines up/down (delegates to VSCode's move line action)
local vscode = require "vscode"
vim.keymap.set("v", "J", function() vscode.action "editor.action.moveLinesDownAction" end, { silent = true })
vim.keymap.set("v", "K", function() vscode.action "editor.action.moveLinesUpAction" end, { silent = true })
