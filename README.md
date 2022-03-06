## Setup

Init a repo in `~`, and pull in dot files, which will merge with any pre-existing files already in `~`:

```bash
cd ~
git init .
git remote add -t \* -f origin git@github.com:bill-c-martin/dot-files.git
git checkout main
git pull
```

Add this to `~/.bashrc`:

```bash
# Load custom bash settings and aliases
if [ -f ~/.dotfiles/bash/.init ]; then
    . ~/.dotfiles/bash/.init
fi
```

Refresh bash:

```bash
. ~/.bashrc
```

Install `bat`:

```bash
sudo apt install bat
```

## Usage

Aliases are grouped in files under `~/.dotfiles/bash/aliases/*`.

Print alias groups:

```bash
a
```

View aliases for a particular `<alias-group>` from above output:

```bash
a <alias-group>
```
