## Updating the oh-my-zsh default theme to use the hour
Using the .zsh utility [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) if you want to update the propmt to show the hour and the complete path:

1. Edit the file in `.oh-my-zsh/themes/robbyrussell.zsh-theme`
2. Remove the lines: https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/robbyrussell.zsh-theme#L1-L2
3. Add the following lines:
```
PROMPT="%{$fg_bold[yellow]%} [%{$fg_bold[green]%}%D{%f/%m/%y}|%*%{$fg_bold[yellow]%}]"
PROMPT+=' %{$fg[cyan]%}%~%{$reset_color%} $(git_prompt_info)'
```
