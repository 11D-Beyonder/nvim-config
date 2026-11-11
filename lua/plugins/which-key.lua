require("which-key").setup {
  ---@type false | "classic" | "modern" | "helix"
  preset = "helix",
}

require("which-key").add {
  { "<leader>f", group = "Find", icon = { icon = "", color = "blue" } },
}
