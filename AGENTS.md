# Repository Guidelines

## Project Structure

This repository is a compact Neovim configuration. `init.lua` enables the module cache and loads the configuration modules. `options.lua` holds global editor options and leader-key settings, `lua/plugins/init.lua` declares plugins and loads their configurations, and each plugin's setup lives in its own module under `lua/plugins/`. `lua/keymaps.lua` defines key mappings, and `lua/autocmds.lua` defines autocommands. `nvim-pack-lock.json` records exact plugin revisions; there are no separate source, test, or asset directories.

## Development and Validation

Run Neovim with this configuration to validate startup and behavior:

- `nvim --clean -u .\init.lua` starts Neovim using this config entry point (plugin availability may depend on your local package setup).
- `nvim --headless -u .\init.lua +q` provides a quick headless startup check after dependencies are installed.
- `git diff --check` checks the patch for whitespace errors.

There is no build step, test suite, or formatter configured. For UI-dependent changes, launch the config normally and inspect the relevant behavior (for example, the Catppuccin colorscheme or `:NvimTreeToggle`).

## Lua Style and Configuration Practices

Use two spaces for indentation, as in the existing Lua files. Keep Neovim option assignments in `options.lua`, plugin declarations in `lua/plugins/init.lua`, each plugin's setup in its own file under `lua/plugins/`, key mappings in `lua/keymaps.lua`, and autocommands in `lua/autocmds.lua`. Prefer explicit `vim.o`, or `vim.g` assignments consistent with the setting being changed, and add short comments when behavior or timing is not self-evident. Use Neovim's conventional special-key spelling in mappings (for example, `<Esc>`, `<CR>`, and `<C-w>`); command strings conventionally use lowercase `<cmd>`. Preserve valid Lua syntax and keep plugin source names consistent with their lockfile entries.

## Plugin Lockfile

When adding or updating plugins, update the `vim.pack.add` declarations in `init.lua` and regenerate or update `nvim-pack-lock.json` using the supported Neovim package workflow. Review the recorded source and revision in the diff so dependency changes are intentional.

## Commits and Pull Requests

- Use the Angular Conventional Commits format: `<type>(<scope>): <imperative summary>`. Common types include `feat`, `fix`, `docs`, `style`, `refactor`, `perf`, `test`, `build`, `ci`, and `chore`; add `!` after the type or scope for a breaking change and explain it with a `BREAKING CHANGE:` footer when appropriate. Keep the subject concise and imperative, for example `feat(init): add statusline plugin` or `fix(options): correct split behavior`. The existing history also follows this scoped format. Pull requests should explain the user-visible change, list any manual startup or UI checks performed, and include screenshots only when a visual change is relevant. Keep changes focused and include lockfile updates when plugin revisions change.
- Before every commit, run `stylua .` to format all Lua files recursively, update `README.md` to reflect the changes, and then create the commit.
- Update `AGENTS.md` when repository structure or development conventions change, and before committing changes that make its guidance stale.
