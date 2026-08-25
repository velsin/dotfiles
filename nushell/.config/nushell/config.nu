# Prompt
# Starship automatically reads the shared ~/.config/starship.toml config.
use starship.nu

# Command shortcuts carried over from Fish.
alias kctl = kubectl
alias tf = terraform
alias tg = terragrunt

alias gits = git status
alias gitap = git add -p
alias gitcm = git commit -m

alias py = python3
alias pyvenv = overlay use .venv/bin/activate.nu

# ~/.local/bin is added to PATH by env.nu.
alias dbtf = dbt

# Kubernetes resource summary carried over from the Fish function.
def k8s-resources [] {
    print "--- NODES"
    ^kubectl top nodes

    print "\n--- PODS (Top 10 CPU)"
    ^kubectl top pods --all-namespaces --sort-by=cpu | ^head -11

    print "\n--- PODS (Top 10 Memory)"
    ^kubectl top pods --all-namespaces --sort-by=memory | ^head -11
}
