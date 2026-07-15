# Original Repo by Matt Pocock.

https://github.com/mattpocock/skills

Below, my fork focusses on integrating with pi.dev agent harness.

# Pi Integration Guide

**By: Geoff Bremner**

This guide explains how to integrate Matt Pocock's skills into your pi coding agent instance.

## Prerequisites

You need to have pi installed and configured. See [pi documentation] (https://pi.dev/) for installation instructions.

## Step 1: Clone this Repository

```bash
cd ~/Documents
git clone https://github.com/geoffbremner/skills
```

This document assumes you are working in ~/Documents directory.

Now you can manage and iterate on the skills built for your pi development flows.

## Step 2: Configure Pi Settings

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
vim ~/.pi/agent/settings.json
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

## Step 3: Add AGENTS.md

The agent configuration is split between two primary workflows:

1. **Obsidian Knowledge** — My workflow for maintaining knowledge, vault organization, and documentation. Inspired by Nick Milo.
2. **Software Engineering** — My workflow for code, debugging, and infrastructure. Inspired by Matt Pocock and Andrej Karpathy

Setup these instructions in your pi agent:

```bash
cp agents/AGENTS.md ~/.pi/agent/AGENTS.md
cp agents/AGENTS_OBSIDIAN.md ~/.pi/agent/AGENTS_OBSIDIAN.md
cp agents/AGENTS_SOFTWARE.md ~/.pi/agent/AGENTS_SOFTWARE.md
```

This ensures that upon launch, you can specify if you are working on software, knowledge, or a hybrid of both.

## Step 4: Add the curl skill to read webpages:

```bash
pi install npm:@curl.md/pi
```

This allows you to paste URLs and pi will fetch them

## Step 5: Verify the Installation

Reload skills in pi:

```
/reload
```

Then verify skills are loaded by asking:

```
What skills do you have available?
```

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
