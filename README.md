# Portable neovim config

## Treesitter grammars

Highlighting uses Neovim's built-in `vim.treesitter`. Parsers and queries are compiled and copied by hand into `~/.local/share/nvim/site/`, which is on the runtime path by default.

Requirements: `git`, `tree-sitter-cli` (`sudo pacman -S tree-sitter-cli`), a C compiler.

| Parser | Repository |
|---|---|
| bash | https://github.com/tree-sitter/tree-sitter-bash |
| c | https://github.com/tree-sitter/tree-sitter-c |
| cpp | https://github.com/tree-sitter/tree-sitter-cpp |
| go | https://github.com/tree-sitter/tree-sitter-go |
| java | https://github.com/tree-sitter/tree-sitter-java |
| lua | https://github.com/tree-sitter-grammars/tree-sitter-lua |
| php | https://github.com/tree-sitter/tree-sitter-php |
| python | https://github.com/tree-sitter/tree-sitter-python |
| rust | https://github.com/tree-sitter/tree-sitter-rust |
| javascript | https://github.com/tree-sitter/tree-sitter-javascript |
| typescript | https://github.com/tree-sitter/tree-sitter-typescript |
| tsx | https://github.com/tree-sitter/tree-sitter-typescript |
| php_only | https://github.com/tree-sitter/tree-sitter-php |
| html | https://github.com/tree-sitter/tree-sitter-html |
| blade | https://github.com/EmranMR/tree-sitter-blade |

### Compile a parser

```sh
mkdir -p ~/.local/share/nvim/site/parser
git clone https://github.com/tree-sitter/tree-sitter-bash
tree-sitter build -o ~/.local/share/nvim/site/parser/bash.so tree-sitter-bash
```

The output file name must be the parser name (`<parser>.so`).

### Copy queries

```sh
git clone https://github.com/nvim-treesitter/nvim-treesitter
mkdir -p ~/.local/share/nvim/site/queries
cd nvim-treesitter/runtime/queries
cp -r bash c cpp go java lua php php_only python rust javascript typescript tsx ecma jsx html html_tags blade ~/.local/share/nvim/site/queries/
```

### Check

`:checkhealth vim.treesitter`
