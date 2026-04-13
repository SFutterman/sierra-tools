# ~/.sierra/ — Sierra's CLI Tools

## Architecture

```
~/.sierra/
├── bin/          # Executable scripts. Each file = one terminal command.
├── claude.md     # This file.
```

`~/.sierra/bin/` is on PATH via `~/.zshrc`. Any executable file placed in `bin/` becomes a globally available command.

## Adding a new command

1. Create a file in `~/.sierra/bin/<command-name>` (no extension).
2. First line: `#!/usr/bin/env bash` (or `#!/usr/bin/env python3`).
3. `chmod +x ~/.sierra/bin/<command-name>`.
4. It's now callable from anywhere as `<command-name>`.

## Conventions

- Scripts are self-contained. Dependencies are checked/installed at runtime.
- Data files live with the tool they belong to, not in `~/.sierra/`.
- Script names are lowercase, single-word. No prefixes.
- Scripts use `set -e` and fail fast with clear error messages.
- Each script has a one-line comment on line 2 describing what it does.

## Current commands

- `velocity` — Launches the Velocity TUI from `~/Tuning/Current/velocity_tui.py`.
