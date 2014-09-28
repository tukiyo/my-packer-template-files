# .bash_profile
cat <<'...' >/mnt/home/vagrant/.sh_profile
zerodisk() {
    yes | sudo pacman -Scc
    sudo dd if=/dev/zero of=/tmp/ZERO bs=1M
    sudo rm -f /tmp/ZERO
}
startup() {
    uptime
}
export LANG=ja_JP.UTF-8
EDITOR=vim
VISUAL=vim
[[ $SHLVL -eq 1 ]] && startup
alias systemctl='sudo systemctl'
alias pacman='sudo pacman'
alias d='sudo docker'
alias r='ranger'
alias journalctl='sudo journalctl'
alias vi='vim -p'
alias mutt='mutt -f ~/Maildir/'
alias yaourt='yaourt --noconfirm -S'
...

cat <<'...' >>/mnt/home/vagrant/.bash_profile
[[ -f ~/.sh_profile ]] && . ~/.sh_profile
...

# create directories
mkdir /mnt/home/vagrant/{Maildir,Mail,Downloads,git,local,Documents,vagrant,src,projects,Desktop,.vim}
mkdir /mnt/home/vagrant/Maildir/{new,cur,tmp}
mkdir /mnt/home/vagrant/.vim/bundle/
chmod 600 /mnt/home/vagrant/Maildir/{new,cur,tmp}

# vimrc
cat <<'...' >/mnt/root/.vimrc
sy on
se hlsearch
se nowrapscan
se nowrap
...
cp /mnt/root/.vimrc /mnt/home/vagrant/.vimrc 
cat <<'...' > /mnt/home/vagrant/.vim/neobundle
"required
set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

""""""""""""""""""""""""""
"NeoBundle 'tyru/open-browser.vim'
""""""""""""""""""""""""""

"required
call neobundle#end()
filetype plugin indent on

"plugin install check
NeoBundleCheck
...
cat <<'...' >/mnt/home/vagrant/.vimrc 
source ~/.vim/neobundle
...

# fix permissions
arch-chroot /mnt chown -R vagrant:vagrant /home/vagrant/
