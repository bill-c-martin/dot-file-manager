## Setup

```bash
cd ~
git clone git@github.com:bill-c-martin/dot-files.git
chmod +x dot-files/setup.sh
./dot-files/setup.sh
```
The setup script ask if it can point your `~` dot files to the versions in this repo:

- `.gitconfig`
- `.vimrc`
- `.bashrc`

And will offer to append an include in `~/.bashrc` for this repo's aliases.

Then, refresh bash:

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
