# Claude Code Settings

This repository contains custom Claude Code settings and configurations, including specialized agents and slash commands optimized for .NET development.

## Contents

- **agents/** - Custom agent configurations for specialized tasks
  - Test runner, analysis, and fix specialists
  - Code implementation agents
  - Evaluation specialist for quality metrics

- **commands/** - Slash commands for common workflows
  - `/fix-bugs` - Orchestrate test and bug fixes
  - `/create-feature` - Feature implementation workflow
  - `/analyze-tests` - Parallel test failure analysis

- **statusline.ps1** - PowerShell statusline configuration

These prompts are particularly useful for .NET development workflows, including test-driven development, bug fixing, and feature implementation.

## How to Apply Settings

### Method 1: Run the Installer Script (Recommended)

1. Clone or download this repository
2. Run `apply-settings.cmd`
3. Restart Claude Code

The script will automatically copy all settings to your `%USERPROFILE%\.claude` directory.

### Method 2: Manual Installation

Copy the contents of this repository to your Claude Code settings directory:

```cmd
xcopy /E /Y agents %USERPROFILE%\.claude\agents\
xcopy /E /Y commands %USERPROFILE%\.claude\commands\
copy /Y statusline.ps1 %USERPROFILE%\.claude\statusline.ps1
```

Then restart Claude Code for changes to take effect.

## Usage

Once installed, you can use the slash commands in Claude Code:

- `/fix-bugs` - Start an automated bug fixing workflow
- `/create-feature` - Begin feature implementation with existing implementation plan
- `/analyze-tests` - Analyze test failures systematically

The custom agents will be automatically available for specialized tasks.
