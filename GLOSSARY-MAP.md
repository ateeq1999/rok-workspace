# Glossary Map

The rok toolchain: member repos released on their own and reached
through one `rok` command.

## Language

**Member repo**:
One repository of the rok toolchain, released on its own.
_Avoid_: project (that is a user's app), package, sub-repo

**Meta-repo**:
The repository that lists every member repo and links their checkouts so they build together during development; it releases nothing.
_Avoid_: monorepo (that is a Template), umbrella repo, superproject

**Subcommand CLI**:
A specialized command line that `rok` dispatches to — linked into `rok`, or found on the `PATH` as `rok-<name>` — and that also runs on its own.
_Avoid_: plugin, sub-CLI, extension

## Contexts

- [rok-data](rok-data/GLOSSARY-MAP.md): the data pipeline, its engine and its templates (its own map lists three contexts)
- [rok-tools](rok-tools/GLOSSARY.md): the Tools and the Payload Runner

## Relationships

- **rok-v2 → rok-data, rok-tools**: `rok` links their Subcommand CLIs and forwards each one's words verbatim; the vocabulary of a command is its CLI's.
- **rok-templates → rok-data**: the engine's `init` reads the templates from the `rok-templates` crate; the templates' gates generate with a pinned `rok-data-cli`.
