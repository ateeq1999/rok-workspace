# rok-workspace

The meta-repo of the rok toolchain: the folder its member repos are
checked out in, side by side. It releases nothing; each member releases
on its own.

| Member | What it is |
| --- | --- |
| [rok-data](https://github.com/ateeq1999/rok-data) | PostgreSQL runtime, codegen, the sqlc engine, and its CLI |
| [rok-tools](https://github.com/ateeq1999/rok-tools) | developer Tools as a library and a CLI |
| [rok-ui](https://github.com/ateeq1999/rok-ui) | shadcn-style components for GPUI desktop apps |

`rok-templates` and `rok-v2` (the `rok` command) join as the split in
[docs/plan.md](docs/plan.md) lands.

## Get every member

```powershell
git clone https://github.com/ateeq1999/rok-workspace.git PROJECT_ROK
cd PROJECT_ROK
.\scripts\sync.ps1          # clones what is missing, fast-forwards the rest
```

The members are ignored by this repo's `.gitignore`: committing here
never commits a member.

## Build across members

A member normally builds against the other members' crates.io releases.
To build it against their local checkouts instead, pass the patch file:

```powershell
cd rok-v2
cargo build --config ..\.cargo\patch-local.toml
```

It is never picked up implicitly, so ordinary builds and release checks
see exactly what crates.io serves.
