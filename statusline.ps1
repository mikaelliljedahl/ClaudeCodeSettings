# Read JSON input from stdin
$jsonInput = [Console]::In.ReadToEnd() | ConvertFrom-Json

# Extract data from JSON with fallbacks
$currentDir = if ($jsonInput.workspace.current_dir) { $jsonInput.workspace.current_dir } else { $PWD.Path }
$dir = Split-Path -Leaf $currentDir
$model = if ($jsonInput.model.display_name) { $jsonInput.model.display_name } else { "Sonnet 4.5" }

# Ensure we have values
if (-not $dir) { $dir = Split-Path -Leaf $PWD.Path }
if (-not $model) { $model = "Claude" }

# Get git branch if in a git repo (use the current directory from JSON)
$branch = $null
if ($currentDir -and (Test-Path $currentDir)) {
    Push-Location $currentDir
    try {
        if (Test-Path '.git') {
            $branch = git symbolic-ref --short HEAD 2>$null
        }
    } finally {
        Pop-Location
    }
}

# Format output
if ($branch) {
    Write-Host "$model | $dir ($branch)"
} else {
    Write-Host "$model | $dir"
}
