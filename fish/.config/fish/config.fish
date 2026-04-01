if status is-interactive
    # Commands to run in interactive sessions can go here
    atuin init fish | source
    starship init fish | source
end

## Abbreviations 

abbr kctl "kubectl"
abbr tf "terraform"
abbr tg "terragrunt"

abbr gits "git status"
abbr gitap "git add -p"
abbr gitcm "git commit -m"

abbr py "python3"
abbr pyvenv "source .venv/bin/activate"

