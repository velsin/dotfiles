# Keep user-installed commands (including dbt Fusion) available first.
$env.PATH = (
    $env.PATH
    | prepend ($env.HOME | path join ".local" "bin")
    | uniq
)
