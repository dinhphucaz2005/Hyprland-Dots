if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export EDITOR=micro
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export _JAVA_AWT_WM_NONREPARENTING=1
export QT_QPA_PLATFORM=xcb

exec "$@"

export SDKMAN_DIR="$HOME/.sdkman"
export IDEA_JDK=/usr/lib/jvm/java-21-openjdk
export ZSH="$HOME/.oh-my-zsh"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM=xterm-256color
export ANDROID_HOME=$HOME/Android/Sdk
export FLUTTER_HOME=$HOME/.dev/flutter

export PATH=$PATH:\
$HOME/.local/bin:\
$HOME/.pub-cache/bin:\
$FLUTTER_HOME/bin:\
$FLUTTER_HOME/bin/cache/dart-sdk/bin:\
$ANDROID_HOME/platform-tools:\
$ANDROID_HOME/cmdline-tools/latest/bin:\
$ANDROID_HOME/emulator

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=( 
    git
    dnf
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
source <(fzf --zsh)

alias la='ls -lha --no-user --no-permissions'
alias lt='ls -lh --tree --no-user --no-permissions'
alias logcat='adb logcat -s flutter:I | awk -F": " '"'"'{print $NF}'"'"''


ytmp3() {
    if [[ -z $1 ]]; then
        echo "Usage: ytmp3 <youtube_url>"
        return 1
    fi

    yt-dlp -x \
        --audio-format mp3 \
        --embed-thumbnail \
        --no-playlist \
        --add-metadata \
        -o "$HOME/Music/%(title)s.%(ext)s" \
        "$1"
}



[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias ff='fzf --preview "bat --style=numbers --color=always --line-range=:500 {}"'


