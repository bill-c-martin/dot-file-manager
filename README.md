You can't clone this into your existing `~` folder without it creating a `~/dot-files/` directory, and these files need to be directly in `~/`

So instead, do these work around steps to set the repo up:

1. Login to a server
2. Go to home dir: `cd ~`
3. Initialize an empty git repo: `git init .`
4. Add `git remote add -t \* -f origin git@github.com:bill-c-martin/dot-files.git`
5. Force checkout master, `-f` is needed to overwrite local dot files: `git checkout -f master`
6. Set proper permissions for git fetch/pulls: `chmod 700 ~/.ssh && chmod 600 ~/.ssh/id_rsa && chmod 600 ~/.ssh/authorized_keys && chmod 644 ~/.ssh/id_rsa.pub && chmod 600 ~/.ssh/config`
7. Refresh bash profiles: `. ~/.bashrc` 
