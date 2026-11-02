#!/usr/bin/env bash

set -e

for dir in */; do
    if [[ -f "$dir/Cargo.toml" ]]; then
        echo "Cleaning: $dir"
        (cd "$dir" && cargo clean)
    fi
done

echo "All Rust projects cleaned."
