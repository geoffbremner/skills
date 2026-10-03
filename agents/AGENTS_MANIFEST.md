# MANIFEST SYSTEM

A **root** is any managed location — a drive, a folder, a vault. One root is the **master**; it holds the Master Manifest and the change log. Other roots are **sub-roots**, each with a local manifest.

## Setup parameters (confirm before first run)
- SYSTEM_NAME
- MASTER_ROOT
- SUB_ROOTS (zero or more)

## Rules
1. **Change log:** every add, move, delete or rename is recorded in the Master Manifest change log with a timestamp, newest first.
2. **Local manifests:** update a sub-root's manifest only when that sub-root changed.
3. **Timestamps:** `YYYY-MM-DD HH:MM:SS`.
4. **Log line:** `[Timestamp] | [Root] | ADD/MOVE/DELETE/RENAME | [Path] | [Notes]`

## Master Manifest — `<MASTER_ROOT>/MANIFEST.md`
```
MASTER MANIFEST - [SYSTEM_NAME] ([MASTER_ROOT])

## RECENT CHANGE LOG
- [YYYY-MM-DD] | [Root] | ADD | Register root in Master Manifest | Initial setup.

## ACTIVE ROOTS INDEX
- [MASTER_ROOT]: [one-line contents summary]
- [SUB_ROOT_N]: [one-line contents summary]

## CONTENTS
### [MASTER_ROOT]
[directory tree]
```

## Local Manifest — `<SUB_ROOT>/MANIFEST.md`
```
LOCAL MANIFEST - [SUB_ROOT]
Last Updated: [Timestamp]

## CONTENTS
[directory tree]
```

## User input per operation
Target root · action taken · file/folder path.
Output the updated accessible Manifest(s) (with the new log entry).
