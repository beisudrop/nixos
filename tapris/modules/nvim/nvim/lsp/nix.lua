---@type vim.lsp.Config
return {
  cmd = { "nil" }, -- Ensure 'nil' is in your PATH
  filetypes = { "nix" },
  root_markers = { "flake.nix", "shell.nix", "default.nix", ".git" },
  settings = {
    ["nil"] = {
      formatting = {
        command = { "nixfmt" }, -- Optional: specify nixfmt if installed
      },
      diagnostics = {
        ignored = {}, -- Add diagnostic codes to ignore if needed
      },
      nixpkgs = {
        -- Optional: explicitly set nixpkgs path if auto-detection fails
        -- path = "/path/to/nixpkgs",
      },
    },
  },
}
