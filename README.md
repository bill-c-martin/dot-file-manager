Inits a repo in `~`, and merges repo files with pre-existing files there

```bash
cd ~
git init .
git remote add -t \* -f origin git@github.com:bill-c-martin/dot-files.git
git checkout main
git pull
. ~/.bashrc
```
