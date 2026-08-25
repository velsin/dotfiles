# Generated from `starship init nu`, kept here so a freshly stowed config works
# immediately without requiring a generated cache file.
export-env {
    $env.STARSHIP_SHELL = "nu"

    load-env {
        STARSHIP_SESSION_KEY: (random chars -l 16)
        PROMPT_MULTILINE_INDICATOR: (
            ^starship prompt --continuation
        )
        PROMPT_INDICATOR: ""
        PROMPT_COMMAND: {||
            (
                ^starship prompt
                    --cmd-duration ($env.CMD_DURATION_MS? | default 0)
                    $"--status=($env.LAST_EXIT_CODE? | default 0)"
                    --terminal-width (term size).columns
            )
        }
        PROMPT_COMMAND_RIGHT: {||
            (
                ^starship prompt
                    --right
                    --cmd-duration ($env.CMD_DURATION_MS? | default 0)
                    $"--status=($env.LAST_EXIT_CODE? | default 0)"
                    --terminal-width (term size).columns
            )
        }
        config: ($env.config? | default {} | merge {
            render_right_prompt_on_last_line: true
        })
    }
}
