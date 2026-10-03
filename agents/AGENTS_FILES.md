# FILES WORKFLOW

Traverse local storage and report structure before acting.

## Traversal
1. If `<root>/MANIFEST.md` exists, read it first and trust it over a fresh walk; read `~/.pi/agent/AGENTS_MANIFEST.md` for how to maintain it.
2. Otherwise map the root with `find [DIR] -maxdepth [X] -not -path '*/.*' 2>/dev/null`. [X] Can change based on the level of effort.
3. Skip caches and media blobs unless they are the target - ex. `node_modules`, `.git`.
4. Present the structure and the proposed operations, then wait for confirmation.

## Moves, renames and deletes
These are write-mode operations. Perform them one batch at a time and record each in the manifest when one exists.