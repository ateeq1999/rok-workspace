# AGENTS.md — working in rok-workspace

This folder is the meta-repo: it holds the member repos side by side and
releases nothing. Each member is its own git repository with its own
AGENTS.md, CI and releases; read the member's AGENTS.md before changing
it. Commits made here never touch a member (`.gitignore` excludes them).

## Members

| Member | Holds | Its rules |
| --- | --- | --- |
| `rok-data/` | runtime (`rok-data-core`, `-macros`, facade), `rok-data-codegen`, the sqlc engine `rok-data-sqlc`, the CLI `rok-data-cli` | [rok-data/AGENTS.md](rok-data/AGENTS.md) |
| `rok-tools/` | the Tools library `rok-tools` and `rok-tools-cli` | [rok-tools/README.md](rok-tools/README.md), [rok-tools/GLOSSARY.md](rok-tools/GLOSSARY.md) |
| `rok-ui/` | GPUI component system | [rok-ui/AGENTS.md](rok-ui/AGENTS.md) |
| `rok-templates/` | the actix, axum and monorepo templates, their catalog, and their gates | [rok-templates/AGENTS.md](rok-templates/AGENTS.md) |
| `rok-v2/` | the `rok` binary (crate `rok-cli`): routing, help, the PATH fallback, binary releases and installers | [rok-v2/AGENTS.md](rok-v2/AGENTS.md) |
| `rok-docs/` | the toolchain's documentation site (TanStack Start, on Vercel), mirroring the members | [rok-docs/AGENTS.md](rok-docs/AGENTS.md) |

## Where a change belongs

| Change | Member |
| --- | --- |
| Query builder, models, migrations, the engine's generated code | `rok-data` |
| A `rok db`, `rok migrate`, `rok gen`, `rok sqlc` … command | `rok-data` (the CLI that owns the word) |
| A Tool or `rok tools …` | `rok-tools` |
| A template, an Integration, a template gate | `rok-templates` |
| Routing, `rok --help`, the PATH fallback, install scripts | `rok-v2` |
| A documentation page, the site's design | `rok-docs` (its source first, in the member it documents) |
| The member list, the patch file, cross-member CI, toolchain ADRs | this repo |

A change that spans members is one PR per member, merged in dependency
order (rok-data and rok-tools, then rok-templates, then rok-v2).

## Building across members

`cargo build --config ..\.cargo\patch-local.toml`, run inside a member,
builds it against the other members' checkouts instead of crates.io. Add
a crate there when a member starts publishing one. The file is never
found implicitly, so a member's own CI and release checks are unaffected.

## Decisions and vocabulary

- Decisions that span members are **toolchain ADRs** under
  `docs/decisions/`, cited as "toolchain ADR NNNN". The split itself is
  rok-data's workspace ADR 0032, which predates this repo.
- A member's own decisions stay in the member.
- [GLOSSARY-MAP.md](GLOSSARY-MAP.md) links every member's glossary and
  holds the toolchain's own terms.

## The plan in flight

[docs/plan.md](docs/plan.md): the runbook splitting rok-data into member
repos. Each step ends with a Verify block; do not start a step until the
previous one's Verify matches.
