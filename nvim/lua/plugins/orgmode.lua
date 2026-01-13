return {
  {
    "nvim-orgmode/orgmode",
    event = "VeryLazy",
    dependencies = {
      "nvim-orgmode/telescope-orgmode.nvim",
      "nvim-orgmode/org-bullets.nvim",
    },
    ft = { "org" },
    config = function()
      -- Setup orgmode
      require("orgmode").setup({
        org_agenda_files = "~/org/**/*",
        org_default_notes_file = "~/org/misc.org",
        org_todo_keywords = { "TODO", "NEXT", "IN-PROGRESS", "WAITING", "DONE" },
        org_startup_indented = true,
        mappings = {
          org = {
            org_todo = "<leader>ot",
            org_set_tags_command = "<leader>oT",
          },
        },
      })
      require("org-bullets").setup()
      require("telescope").load_extension("orgmode")
      vim.keymap.set(
        "n",
        "<leader>fh",
        require("telescope").extensions.orgmode.search_headings,
        { desc = "Find headings (org)" }
      )
    end,
  },
}
