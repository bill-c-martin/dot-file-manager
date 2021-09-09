# Git Aliases
	# logs and status
	alias gl="git lg" 
	alias glf="git lg -p " # append file name to see detailed commit history on file. Or $ tig [filename] for interactive text version. (Install tig)
	alias glc="git lgc" # view log current branch
	alias gls="git lgs" # view git log, shortened version
	alias gs="git status"
	alias gss="git submodule status"
	
	# branches
	alias gb="git branch"
	alias gc="git checkout"
	
	# add and committing
	alias gac="git add . && git commit -m "
	alias ga="git add "
	alias gcm="git commit -m "

	# push/pulls
	alias gf="git fetch --all"
	alias gp="git pull"
	alias gpo="git push origin "
	
	# submodules
	alias gpr-first-time="git submodule update --init --recursive"	
	alias gpr="git pull && git submodule update --remote --recursive"
	# alias gpr="git pull --recurse-submodules"

	# diffs
	alias gd="git diff"
	alias gdf="git diff --name-only"
	function gdg { git diff --color "$1" | grep --color=never $'^\e\[32m'; } # git diff that shows only the green additions
	function gdr { git diff --color "$1" | grep --color=never $'^\e\[31m'; } # git diff that shows only the red deletions
	alias gdp="git diff HEAD~1 HEAD"
	alias gdpf="git diff --name-only HEAD~1 HEAD"

	# tags
	alias gtl="git tag -n9" # List all tags, including 9 lines of tag messages
	alias gtd="git tag -d " # delete tag locally, add tag name after this command
	alias gtdr="git push origin :refs/tags/" # Delete remote tag, add tag name after this command
	alias gtp="git push --tags" # push all tags

        # Git branch cleanup
		# delete local/remote branches
		alias gdbl="git branch -d " #append brand name
		alias gdbr="git push origin --delete " # append branch name

		# Clean up master-merged branches local/remote
		alias gcl-check="git branch --merged master | egrep -v '(^\*|master|dev-master|dev-stage|dev-leap|staging|Staging|production)' | sed 's/origin\///'"
		alias gcl="git branch --merged master | egrep -v '(^\*|master|dev-master|dev-stage|dev-leap|staging|Staging|production)' | sed 's/origin\///' | xargs -n 1 git branch -d"
		alias gcr-check="git branch -r --merged master | egrep -v '(^\*|master|dev-master|dev-stage|dev-leap|staging|Staging|production)' | sed 's/origin\///'"
		alias gcr="git branch -r --merged master | egrep -v '(^\*|master|dev-master|dev-stage|dev-leap|staging|Staging|production)' | sed 's/origin\///' | xargs -n 1 git push --delete origin"


# Files
	alias clear-magento-var-cd='sudo rm -rf generated var/di/* var/generation/* var/cache/* var/log/*.gz var/page_cache/* var/session/* var/view_preprocessed/* pub/static/*'
	alias clear-cache-cd-dev='sudo -u www-data find . -type f -delete'
	alias clear-cache-cd='sudo -u nginx find . -type f -delete'
	alias ls-by-size='ls --human-readable --size -1 -S --classify' #sort by filesize
	alias left='ls -t -1' # most recently modified files
	alias count='find . -type f | wc -l' # count files
	alias count-files-by-subdir='du -a | cut -d/ -f2 | sort | uniq -c | sort -nr'
	alias trash='mv --force -t ~/.local/share/Trash ' # use instead of rm to prevent accidents
	alias list-symlinks='ls -lR . | grep ^l' # lists recursively for current dir 
	function list-symlinks-efs { find -L /var/www/ /etc -xtype l -exec ls -l {} \; 2>/dev/null | awk -e '$11 ~ /^\/mnt\/efs\// {print $9 $10 $11}'; }  # list all nfs symlinks
	function encrypt() { 
		local in="$1"
		local out="$2"
		openssl enc -aes-256-cbc -in "$in" -out "$out"
	}
	function decrypt() { 
		local in="$1"
		local out="$2"
		openssl enc -d -aes-256-cbc -in "$in" -out "$out"
	}
	alias decrypt-1password='decrypt ~/1password/1password.enc ~/1password/1password.dec'
	alias encrypt-1password='encrypt ~/1password/1password.dec ~/1password/1password.enc'

# Permissions
	alias show-permissions='stat -c %a ' ## add file/dir
	alias fix-ssh-permissions='chmod 700 ~/.ssh && chmod 600 ~/.ssh/id_rsa && chmod 600 ~/.ssh/id_ed25519 && chmod 600 ~/.ssh/authorized_keys && chmod 644 ~/.ssh/id_rsa.pub && chmod 644 ~/.ssh/id_ed25519.pub && chmod 600 ~/.ssh/config'
	alias fix-git-permissions-to-nginx='sudo chown -R nginx:nginx .git/*'
	alias fix-wp-permissions-to-www-data-in-current-dir='sudo chown www-data:www-data -R . ; sudo chmod ug+rw -R . '
	alias fix-wp-permissions-to-nginx-in-current-dir='sudo chown nginx:nginx -R . ; sudo chmod ug+rw -R . '

# Disk Management
	alias du-cd='du -d 1 -h .'
	alias du-filesystem='df -h'
	alias truncate='sudo truncate --size 0 ' #append log name to truncate

# Server Management
	alias rsync-from-remote-to-local='rsync -avzh #user@server:/from/path/on/remote /to/path/to/local'
	alias nginx-reload='sudo nginx -s reload'

	# Amazon Linux	
	alias show-amazon-linux-topic="sudo amazon-linux-extras list"
	alias enable-amazon-linux-topic="sudo amazon-linux-extras enable " # append package name 
	alias disable-amazon-linux-topic="sudo amazon-linux-extras disable " # append package name 
	alias yum-list-installed="yum list installed"
	alias yum-list-available="yum list available"
	alias yum-install-package="yum install " # append package name
	alias yum-update-package="yum update " # append package name

# Other
	alias rbrc=". ~/.bashrc" # refresh bash configs
	alias a="cat ~/.bash_aliases" # print aliases, pipe with: a | grep <text-to-search-in-a-command>
	alias servers="cat ~/.ssh/config | grep 'Host '"

# Network
	alias print-all-processes-listening-to-ports="sudo ss -tulpn"
	function print-pid-listening-to { sudo ss -tulpn | grep :$1; } # usage: print-pid-listening-to 80
	function print-process-listening-to { sudo ss -tulpn | grep ":$1" | cut -d',' -f 2 | cut -d'=' -f 2 | head -n 1 | xargs -I {} sudo ls -l /proc/{}/exe;  } # usage: print-process-listening-to 80

# DNS
	alias dig-txt="dig +short txt " # append brand.com
	alias dig-a="dig +short txt " # append brand.com
	alias dig-aaaa="dig +short txt " # append brand.com
	alias dig-mx="dig +short mx " # append brand.com
	alias dig-ns="dig +short ns " # append brand.com

# Source Code	
	alias cdhb="cd ~/source/hempbombs-clean/"
	alias cdns="cd ~/source/naturesscript.com/"
	alias cdpp="cd ~/source/perfectpawshemp.com/"
	alias cdm="cd ~/source/gwcbd.com/"
	alias cdmcc="cd ~/source/magento-cloud/"

# Docker
        # function dcu { docker-compose -f $(pwd | cut -d/ -f 1-5)/.docker/docker-compose.yml up -d; }
        # function dcd { docker-compose -f $(pwd | cut -d/ -f 1-5)/.docker/docker-compose.yml down; }
        alias dcu="docker-compose up -d"
	alias dcd="docker-compose down"
	alias dcl="docker container list"
        alias dcla="docker container list -a"
	alias dspa="docker system prune -a" # destroys docker containers
        alias dssh="docker exec -it $(dcl | grep nginx | awk -F '[[:space:]][[:space:]]+' '{ print $7 }') /bin/bash"

	# MCC Docker
	alias mcc-ssh='docker exec -it magento-cloud_fpm_1 bash'
	alias mcc-bash='docker-compose exec fpm '
	alias mcc-bin-magento='docker-compose exec fpm bin/magento '
	alias mcc-docker-clear='mcc-bin-magento cache:clean && mcc-bash clear-magento-var-cd' 
	alias mcc-bash2='docker exec magento-cloud_fpm_1 bash -c '
	alias mcc-redis='docker exec -it magento-cloud_redis_1 redis-cli '
	alias mcc-redis-flush='docker exec -it magento-cloud_redis_1 redis-cli FLUSHALL'
	alias mcc-redis-stat='docker exec -it magento-cloud_redis_1 redis-cli --stat'
	alias mcc-redis-bigkeys='docker exec -it magento-cloud_redis_1 redis-cli --bigkeys'
	alias mcc-redis-latency='docker exec -it magento-cloud_redis_1 redis-cli --latency'
	alias mcc-redeploy='mcc-docker-clear && docker-compose exec fpm bin/magento setup:upgrade && docker-compose exec fpm bin/magento setup:di:compile && docker-compose exec fpm bin/magento setup:static-content:deploy -f'
