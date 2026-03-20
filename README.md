# zsh-alias-preview

Show a live preview of alias expansion in the Zsh message area while typing.

This plugin is useful when you use short aliases (for example, `gco`, `dcu`) and want a quick reminder of what they expand to before pressing Enter.

## Features

- Live alias preview while editing the command line.
- Optional command filter: only show previews for selected expanded commands (for example `git`, `docker`).
- Truncates long expansions to keep the message area readable.
- Avoids unnecessary redraw noise by only updating when the message changes.

## Installation

### Oh My Zsh (manual)

1. Clone this repo into your custom plugins directory:
    
```bash
git clone https://github.com/Casta-mere/zsh-alias-preview \
	${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-alias-preview
```

2. Add `zsh-alias-preview` to `plugins=(...)` in your `~/.zshrc`.

3. Reload your shell:

```bash
source ~/.zshrc
```

## Configuration

Edit the plugin file and customize this array:

```zsh
typeset -ga ALIAS_PREVIEW_COMMANDS=(git docker)
```

Behavior:

- If an alias expands to a command in this list, preview is shown.
- If not, no preview is shown.

Example:

- Alias `gco='git checkout'` will be previewed (`git` matches).
- Alias `ll='ls -alF'` will not be previewed unless you add `ls`.