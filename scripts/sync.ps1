# Clone every member repo in repos.toml that is missing; fast-forward the rest.
$root = Split-Path $PSScriptRoot
foreach ($line in Get-Content "$root\repos.toml") {
    if ($line -match '^\s*([\w.-]+)\s*=\s*"([^"]+)"') {
        $dir = Join-Path $root $Matches[1]
        if (Test-Path $dir) { git -C $dir pull --ff-only } else { git clone $Matches[2] $dir }
    }
}
