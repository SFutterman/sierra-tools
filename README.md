# 🍌 sierra-tools

Personal dev tools for Sierra Futterman. CLI utilities, menubar widgets, and a banana-based productivity system.

## Tools

### `banana` — Commit tracker with monkey energy

Commit = 1 🍌. PR = 5 🍌 (a whole bunch). Beat your daily high score.

```bash
banana                    # log a commit
banana "optional note"    # log a commit with context
banana pr                 # log a PR (+5 🍌)
banana pr "PR title"      # log a PR with context
banana stats              # bar chart of your history
banana undo               # remove last entry
```

The menubar shows `🍌 3` all day. Turns `🏆🍌 7` when you beat your personal best.

---

### `cc` — Claude Code shortcuts

```bash
cc plugins          # open Claude Code plugins directory
cc alias <desc>     # create a shell alias via Claude
```

---

## Setup

```bash
git clone https://github.com/sierrafutterman/sierra-tools ~/.sierra
cd ~/.sierra
./setup.sh
```

`setup.sh` will:
- Create `bananas.json` (gitignored — your data stays local)
- Mark all scripts executable
- Add `~/.sierra/bin` to your PATH
- Guide you through SwiftBar setup for the menubar counter

### SwiftBar (menubar counter)

1. `brew install --cask swiftbar`
2. Open SwiftBar, press **Cmd+Shift+G**, paste `~/.sierra/swiftbar-plugins/`
3. Done — counter appears in menubar immediately

---

## Data

`bananas.json` is gitignored. It lives only on your machine. Every banana entry stores a full timestamp, type (`commit`/`pr`), optional note, and count.
