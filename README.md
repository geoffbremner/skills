---

👤 **Author:** Geoff Bremner  
🔗 **Connect:** https://linktr.ee/gbaudio  
🤖 **Built with Gemini and tested with Gemini.**

---

# Pi Integration Guide

This is a lightweight implementation of skills, originally forked from Matt Pocock skills, purposely focussed on pi.dev, used and maintained by Geoff Bremner. Geoff Bremner modifies these skills and AGENT instructions to fit his workflow.

## Prerequisites

You need to have pi installed and configured. See [pi documentation](https://pi.dev/) for installation instructions.

## Step 1: Clone this Repository

```bash
cd ~/Documents
git clone https://github.com/geoffbremner/skills
cd skills
```

This document:
- Is LLM friendly, but can be done manually.
- has only been tested on macOS
- works from `~/Documents/skills`

## Step 2: Configure Pi Settings

Create or edit the pi settings file at `~/.pi/agent/settings.json`.

**To create:**

Run this ONCE to ensure no duplication.

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

**Note:** We only include `engineering`, `productivity`, and `misc` directories. The `personal`, `in-progress`, and `deprecated` directories are intentionally excluded.

## Step 3: Add AGENTS.md

The agent configuration is split between two _primary_ workflows:

1. **Obsidian Knowledge** — My workflow for maintaining knowledge, vault organization, and documentation. Inspired by Nick Milo.
2. **Software Engineering** — My workflow for code, debugging, and infrastructure. Inspired by Matt Pocock and Andrej Karpathy

Add core agent functionality to your install:

```bash
cp agents/AGENTS.md ~/.pi/agent/AGENTS.md
cp agents/AGENTS_OBSIDIAN.md ~/.pi/agent/AGENTS_OBSIDIAN.md
cp agents/AGENTS_SOFTWARE.md ~/.pi/agent/AGENTS_SOFTWARE.md
```

OPTIONAL - FILES workflow for managing multiple external physical drives

```bash
cp agents/AGENTS_FILES.md ~/.pi/agent/AGENTS_FILES.md
```

This ensures that upon pi launch, you specify working on software, knowledge, or a hybrid of both.
## Step 4: Verify skills Installation

Reload skills in pi:
```
/reload
```
Then verify skills are loaded by asking:
```
What skills do you have available?
```
## Step 5: Add extensions:

### curl.md
```bash
pi install npm:@curl.md/pi
```
This allows you to paste URLs and pi will fetch them. This is Geoff's must-have tool for pi.
#### TEST in pi:
```bash
Read the curl.md Pi extension docs and summarize how it works.
https://curl.md/docs/plugins/pi
```
### token usage dashboard
```
pi install npm:pi-token-usage
```
#### TEST in pi:
```bash
/usage
```
## Troubleshooting

### Skills not showing up?

1. Check the path in `~/.pi/agent/settings.json` matches where you cloned the repo. If there are problems check using vim:
```bash
vim ~/.pi/agent/settings.json
```
2. Run `/reload`
3. Verify JSON syntax is valid (no trailing commas, proper quotes)