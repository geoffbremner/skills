---

👤 **Author:** Geoff Bremner  
🔗 **Connect:** https://linktr.ee/gbaudio  
🤖 **Built with Gemini and tested with Gemini.**

---

# Pi Integration Guide

This is a lightweight implementation of skills, originally forked from Matt Pocock skills, purposely focussed on pi.dev, used and maintained by Geoff Bremner. Geoff Bremner modifies these skills and AGENT instructions to fit his workflow.

## Prerequisites

You need to have pi installed and configured. See **Step 0** below.

## Step 0: Install Pi

Visit [pi.dev](https://pi.dev/) and follow the installation instructions for your platform.

## Step 1: Clone this Repository

```bash
cd ~/Documents
git clone https://github.com/geoffbremner/skills
cd skills
```

This document:
- Is LLM friendly, but can be done manually.
- has only been tested on macOS
- works from any clone location

## Step 2: Link Skills to Pi

Run the setup script from the repository root:

```bash
./scripts/setup-pi.sh
```

The script links Pi's standard global skill directory (`~/.pi/agent/skills`) to this repository. If an existing skills directory is found, it is moved to a timestamped backup before the link is created. The script is safe to run again and supports a custom Pi agent directory via `PI_AGENT_DIR`.

All repository skills are discovered recursively. The `in-progress` and `deprecated` directories are available but are not intended for normal use.

## Step 3: Agent Instructions

The setup script automatically links the shared agent instructions for all workflows:

1. **Obsidian Knowledge** — My workflow for maintaining knowledge, vault organization, and documentation. Inspired by Nick Milo.
2. **Software Engineering** — My workflow for code, debugging, and infrastructure. Inspired by Matt Pocock and Andrej Karpathy.
3. **Files** — A workflow for managing multiple external physical drives.

The linked files are:

```text
~/.pi/agent/AGENTS.md
~/.pi/agent/AGENTS_OBSIDIAN.md
~/.pi/agent/AGENTS_SOFTWARE.md
~/.pi/agent/AGENTS_FILES.md
```

This ensures that upon Pi launch, you specify working on software, knowledge, file management, or a hybrid of these. Because these are links, updates pulled into the repository are used automatically after restarting Pi or running `/reload`.

## Step 4: Verify Skills Installation

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

1. Confirm the global skills directory points to this clone:
   ```bash
   readlink ~/.pi/agent/skills
   ```
2. If the link is missing or points to an old clone, run this again from the repository root:
   ```bash
   ./scripts/setup-pi.sh
   ```
3. Restart Pi or run `/reload`.
4. Verify that skills have valid `SKILL.md` frontmatter with both `name` and `description` fields.

### Skill collisions from another global directory

Pi also discovers skills from `~/.agents/skills`. If you have an unrelated skills directory there, it can cause name collisions with this repository's skills. The setup script does not modify or remove unrelated skill directories.

If collisions remain after setup, inspect the other global skill directory:

```bash
find ~/.agents/skills -name SKILL.md -print
```
