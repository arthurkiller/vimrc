#!/usr/local/bin/fish
function fish_prompt --description 'Write out the prompt'
    # Just calculate these once, to save a few cycles when displaying the prompt
    if not set -q __fish_prompt_hostname
        set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
    end

    if not set -q __fish_prompt_normal
        set -g __fish_prompt_normal (set_color normal)
    end

    if not set -q __git_cb
        set __git_cb ":"(set_color brown)(git branch 2>/dev/null | grep \* | sed 's/* //')(set_color normal)""
    end

    switch $USER
        case root
            if not set -q __fish_prompt_cwd
                if set -q fish_color_cwd_root
                    set -g __fish_prompt_cwd (set_color $fish_color_cwd_root)
                else
                    set -g __fish_prompt_cwd (set_color $fish_color_cwd)
                end
            end
        printf '%s@%s:%s%s%s%s# ' $USER $__fish_prompt_hostname "$__fish_prompt_cwd" (prompt_pwd) "$__fish_prompt_normal" $__git_cb

        case '*'
            if not set -q __fish_prompt_cwd
                set -g __fish_prompt_cwd (set_color $fish_color_cwd)
            end
        printf '%s@%s:%s%s%s%s$ ' $USER $__fish_prompt_hostname "$__fish_prompt_cwd" (prompt_pwd) "$__fish_prompt_normal" $__git_cb
    end
end

ssh-add -q ~/.ssh/id_rsa
ssh-add -q ~/.ssh/ali_rsa
ssh-add -q ~/.ssh/github_rsa
set -xg LANG "en_US.UTF-8"
set -axg PATH /Users/arthur/.bin
set -axg PATH /Users/arthur/codes/bin

set -xg GOPATH $HOME/codes
set -xg GOPROXY https://goproxy.cn
#set -xg CGO_ENABLED 0
set -xg ETCDCTL_API 3
alias cls='clear'
alias ll='ls -alh'

set -axg fish_user_paths "/usr/local/include"

#set -axg PATH /Users/arthur/Library/Python/2.7/bin
#set -axg PATH /Users/arthur/Library/Python/3.7/bin
#set -axg PATH $HOME/.cargo/bin
#set -axg PATH /usr/local/nginx/sbin
#set -axg PATH /Users/arthur/.composer/vendor/bin/
#set -axg PATH /usr/local/opt/llvm/bin
#set -axg fish_user_paths "/usr/local/sbin"
#set -axg fish_user_paths "/usr/local/opt/curl/bin"
#set -axg fish_user_paths "/usr/local/opt/libressl/bin"
#set -axg fish_user_paths "/usr/local/opt/openssl/bin"
#set -axg fish_user_paths "/usr/local/opt/llvm/bin"

#alias gfw='env http_proxy=http://127.0.0.1:1087 https_proxy=http://127.0.0.1:1087'
#alias jump='ssh liziang@relay02.baidu.com'
#alias pac='networksetup -setautoproxyurl Wi-Fi http://pac.internal.baidu.com/bdnew.pac'
#alias mdev='mount -t smbfs //work:liziangarthur@10.151.82.12:8099/work ~/work'
#alias mypw='sudo cat /Users/arthur/.pwd | sed -n '2p' | pbcopy'
#alias jump='ssh -A -p 34185 lza@42.62.69.161'

# add llvm here
fish_add_path /usr/local/opt/llvm/bin
ulimit -c unlimited
fish_add_path /usr/local/opt/sphinx-doc/bin

# maven config
set -agx M2_HOME /usr/local/opt/maven
set -agx M2 {$M2_HOME}/bin
set -agx PATH {$M2}:{$PATH}

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
fish_add_path /usr/local/sbin
