# Neovim Config

Based on: [https://github.com/hack3rmann/nvim-config/tree/main]

Features:
- File explorer like VSCode
- Tabs and recent file switcher (Ctrl+Tab)
- Comment toggling
- LSP: Python, C/C++, Bash, Docker, JSON
- Manual completion
- Snippet expansion (LuaSnip + friendly-snippets)

## Setup

1. Install Neovim ≥ 0.9
2. Run `:Lazy sync` inside Neovim
3. Install LSP servers (see below)

> [!IMPORTANT]
> This command is for C/C++ projects that put their compile_commands.json not in the root of the project!

```bash
ln -s build/compile_commands.json ./compile_commands.json
```

## Language Servers (obsolete)

```bash
sudo apt install npm
# https://docs.npmjs.com/resolving-eacces-permissions-errors-when-installing-packages-globally
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
source ~/.nvm/nvm.sh
nvm install --lts
nvm use --lts

# Add NVM to Your Shell RC File
# For Bash (default on Ubuntu)
echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.bashrc
echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # Load NVM' >> ~/.bashrc
echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # Load NVM bash_completion' >> ~/.bashrc
source ~/.bashrc

# For Zsh
echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.zshrc
echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # Load NVM' >> ~/.zshrc
echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # Load NVM bash_completion' >> ~/.zshrc
source ~/.zshrc

npm install -g neovim

# sudo apt install clangd

# # pip install pyright
# npm install -g pyright

# npm install -g bash-language-server

# npm install -g dockerfile-language-server-nodejs

# npm install -g vscode-langservers-extracted
```

## Overview

Heck yeah, I'm glad it's working! 😸💻

You’ve now got a slick, non-toxic, totally *kawaii*, VSCode-tier Neovim setup — let's wrap it up with a cute, compact TL;DR on **how to use your config**:

---

## ✨ TL;DR — How to Use Your New Neovim Config

### 📁 Open the file tree (like VSCode)

```text
<leader>e         → Toggle file tree (Neo-tree)
```

### 🧷 Switch between buffers/tabs

```text
<Tab>             → Next buffer
<Shift-Tab>       → Previous buffer
<Ctrl-Tab>        → Last viewed file (MRU style!)
<Ctrl-Shift-Tab>  → Back again
```

### 🧠 LSP (Language Features)

```text
<leader>gd        → Go to definition (uses Telescope if installed)
<leader>gr        → Find references
<leader>gb        → Go back (Ctrl-t)
<leader>d         → Show diagnostics in float
K                 → Hover doc
```

### 🧵 Commenting

```text
<leader>c         → Toggle comment (line or selection)
```

### 🧠 Completion (manual, Sublime-style)

```text
<C-Space>         → Trigger completion manually
<Tab>             → Expand snippet / jump forward
<Shift-Tab>       → Jump backward in snippet
```

### ✂️ Clipboard (yes, system-wide!)

Paste from browser/Discord/etc. just like any GUI editor:

```bash
Ctrl+Shift+V      → (in terminal)
"+p or "*p        → (in Neovim, if you're fancy)
```

---

## 🛠 Language Support Built-in

| Language     | LSP         |
| ------------ | ----------- |
| Python       | `pyright`   |
| C/C++        | `clangd`    |
| Bash         | `bashls`    |
| Dockerfile   | `dockerls`  |
| JSON         | `jsonls`    |
| Typst        | `tinymist`  |
| Lua          | `lua_ls`    |
| WGSL, SQL... | Also there! |

Manage them using `mason.nvim` or `npm/pip` — your choice!

---

## 🌸 Bonus Tips

* Run `:Lazy` to manage plugins
* Run `:checkhealth` to verify LSP/completion/snippets are working
* Put snippet triggers like `main`, `def`, etc., and `<Tab>` to expand!
* `npx prettier --write .` works without global install (no clutter!)

---

## 🧼 Updating your system like a kawaii Arch user (but less smug)

```bash
:Lazy update      → update all plugins
:Mason            → install/update LSPs
```

---

If this config were a cat, it'd be:

> 👀 Minimal
> 🧠 Smart
> 🐾 Light on its feet
> 🎀 Just the right amount of floof

Let me know if you want me to pack it into a GitHub repo or ZIP for download.
You're doing awesome, senpai\~ 🐾💮

## Usefull hotkeys

Normal mode: Ctrl + e, Ctrl + y, zz
Insert mode: Ctrl + a
:e!
Insert mode: Ctrl + t --- Ctrl + d
Normal mode: r, r + Enter
Normal mode: \[ + Space, \] + Space
Normal mode: s
Normal mode: Ctrl + f, Ctrl + b
Normal mode: Ctrl + d, Ctrl + u

