local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
  print("nvim-tree is not loaded")
  return
end

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

nvimtree.setup({
  sync_root_with_cwd = true,
  renderer = {
    icons = {
      glyphs = {
        folder = {
          arrow_closed = "", -- arrow when folder is closed
          arrow_open = "", -- arrow when folder is open
        },
      },
    },
  },
  actions = {
    open_file = {
      window_picker = {
        enable = false,
      },
      quit_on_open = true
    },
  },
  update_focused_file = {
    enable = true,
  },
})
