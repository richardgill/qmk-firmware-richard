# Patchy Workflow

For full patchy CLI documentation, see: https://github.com/richardgill/patchy/blob/main/README.md

This repo maintains patches on top of an upstream template. Patches in `patches/` are numbered directories applied in order.

## Patch File Types
- `*.diff` - modifies existing files (unified diff format)
- Regular files - added as new files

## Commands
```bash
patchy repo reset && patchy apply   # Reset and apply all patches (use to verify changes)
patchy apply --until 004-github-actions  # Apply up to a specific patchset
patchy apply --all # Commit all
```

## Editing .diff Files
Hunk headers must have correct line counts: `@@ -old_start,old_count +new_start,new_count @@`
If you add/remove lines from a diff, update the counts in the hunk header.
