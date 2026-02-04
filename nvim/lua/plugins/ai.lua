return {
  {
    "yetone/avante.nvim",
    opts = {
      provider = "codex",
      acp_providers = {
        ["codex"] = {
          command = "npx",
          args = { "@zed-industries/codex-acp" },
          env = {
            NODE_NO_WARNINGS = "1",
            OPENAI_API_KEY = os.getenv("OPENAI_API_KEY"),
          },
        },
      },
    },
  },
}
