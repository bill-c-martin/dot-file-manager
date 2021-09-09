
##############################
# MY CUSTOMIZATIONS
##############################

# Init ssh agent to store key pw
eval $(ssh-agent) && ssh-add;


# Git colored current branch name in terminal
force_color_prompt=yes
color_prompt=yes
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
if [ "$color_prompt" = yes ]; then
   PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@local\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]$(parse_git_branch)\[\033[00m\]\$ '
else
   PS1='${debian_chroot:+($debian_chroot)}\u@local:\w$(parse_git_branch)\$ '
fi
unset color_prompt force_color_prompt
