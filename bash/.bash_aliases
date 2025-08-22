alias kctl="kubectl"
alias tf="terraform"
alias tg="terragrunt"

alias gits="git status"
alias gitap="git add -p"
alias gitcm="git commit -m"

alias py="python3"
alias pyvenv="source .venv/bin/activate"

# k8s
alias k8s-resources='echo "=== NODES ===" && kubectl top nodes && echo -e "\n=== PODS (Top 10 CPU) ===" && kubectl top pods --all-namespaces --sort-by=cpu | head -11 && echo -e "\n=== PODS (Top 10 Memory) ===" && kubectl top pods --all-namespaces --sort-by=memory | head -11'
