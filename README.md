# Original Repo by Matt Pocock.

https://github.com/mattpocock/skills

Below, my fork focusses on integrating with pi.dev agent harness.

# Pi Integration Guide

**By: Geoff Bremner**

This guide explains how to integrate Matt Pocock's skills into your pi coding agent instance.

## Prerequisites

You need to have pi installed and configured. See [pi documentation] (https://pi.dev/) for installation instructions.

## Step 1: Fork the Repository

**On your home computer:** Go to `https://github.com/mattpocock/skills` and click **Fork** to create your own copy.

## Step 2: Clone Your Fork

```bash
cd ~/Documents
git clone https://github.com/YOUR_USERNAME/skills.git
```

Replace `YOUR_USERNAME` with your GitHub username. This creates a `skills` directory at `~/Documents/skills`.

## Step 3: Add Upstream Remote

Add Matt's original repo as upstream so you can pull his updates:

```bash
cd ~/Documents/skills
git remote add upstream https://github.com/mattpocock/skills.git
```

Manually check it:
```bash
git remote -v
```

If it's not working...
```bash
git remote set-url upstream https://github.com/mattpocock/skills.git
```

## Step 4: Configure Pi Settings

Create or edit the pi settings file at `~/.pi/agent/settings.json`.

**To create:**

```bash
mkdir -p ~/.pi/agent
cat > ~/.pi/agent/settings.json << 'EOF'
{
  "skills": [
    "~/Documents/skills/skills/engineering",
    "~/Documents/skills/skills/productivity",
    "~/Documents/skills/skills/misc"
  ]
}
EOF
```

**To edit:**

```bash
code ~/.pi/agent/settings.json
# or: vim ~/.pi/agent/settings.json
```

Add the `skills` array to your existing JSON:

```json
{
  "model": "your-existing-model",
  "skills": [
    "~/Documents/skills/skills/engineering",
    "~/Documents/skills/skills/productivity",
    "~/Documents/skills/skills/misc"
  ]
}
```

**Note:** We only include `engineering`, `productivity`, and `misc` directories. The `personal`, `in-progress`, and `deprecated` directories are intentionally excluded.

## Step 5: Verify the Installation

Reload skills in pi:

```
/reload
```

Then verify skills are loaded by asking:

```
What skills do you have available?
```

## Available Skills

> **Note:** This list may become outdated as Matt's repo evolves. Fork the repo (Step 1) to maintain your own stable version.

Once configured, you'll have access to:

### Engineering Skills
- `/skill:diagnose` — Debug hard bugs with a disciplined loop
- `/skill:grill-with-docs` — Align on requirements and build shared language
- `/skill:triage` — Triage issues through state machine
- `/skill:improve-codebase-architecture` — Find deepening opportunities
- `/skill:tdd` — Test-driven development with red-green-refactor
- `/skill:to-issues` — Break plans into vertical-slice issues
- `/skill:to-prd` — Turn conversation into a PRD
- `/skill:zoom-out` — Get broader context on code
- `/skill:prototype` — Build throwaway prototypes

### Productivity Skills
- `/skill:caveman` — Ultra-compressed communication mode
- `/skill:grill-me` — Get interviewed about your plan
- `/skill:handoff` — Create handoff document for another agent
- `/skill:write-a-skill` — Create new skills

### Misc Skills
- `/skill:git-guardrails-claude-code` — Block dangerous git commands
- `/skill:migrate-to-shoehorn` — Migrate to @total-typescript/shoehorn
- `/skill:scaffold-exercises` — Create exercise structures
- `/skill:setup-pre-commit` — Set up Husky pre-commit hooks

## Model Compatibility

These skills work with **all models** supported by pi (Claude, GPT-4, local models, etc.). The configuration is model-agnostic.

## Updating Skills

To get Matt's latest updates:

```bash
cd ~/Documents/skills
git pull upstream main
git push origin main  # push to your fork
```

Then reload skills in pi:

```
/reload
```

## Troubleshooting

### Skills not showing up?

1. Check the path in `~/.pi/agent/settings.json` matches where you cloned the repo
2. Run `/reload`
3. Verify JSON syntax is valid (no trailing commas, proper quotes)
