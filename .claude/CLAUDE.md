## Patchy

This project uses `patchy` to maintain patches against an upstream repo.

- Config: `./patchy.json` (jsonc)
- Patches: `./patches/`
- Cloned repo: `./clones/qmk_firmware/`

Key commands:
- `patchy generate` - Generate patches from changes in the cloned repo
- `patchy apply` - Apply all patches to the cloned repo
- `patchy repo reset` - Reset cloned repo to base revision (discard all changes)

Make changes in `./clones/qmk_firmware/`, then run `patchy generate` to update patches.
