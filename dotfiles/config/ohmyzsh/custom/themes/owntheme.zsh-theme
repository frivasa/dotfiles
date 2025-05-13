PROMPT=$'%{$fg_bold[blue]%} ~%{$reset_color%}$(git_prompt_info) %{$fg[green]%}$(pixi_prompt_info)%{$reset_color%}%{$fg[yellow]%}%D{[%Y-%m-%d %H:%M:%S]}\
%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[yellow]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""
