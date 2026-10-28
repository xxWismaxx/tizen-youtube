# Fork: proxy on 8098

This fork exists only to publish [SushyDev/tizen-youtube](https://github.com/SushyDev/tizen-youtube)
releases with the service proxy on port **8098** instead of 8099. Vetro already listens
on 8099 on the TV, and whichever starts first takes the port.

- `fork/patch.sh` replaces 8099 with 8098 everywhere outside `docs/` and fails if any is left.
- `.github/workflows/fork-release.yaml` runs daily: it takes the latest stable upstream tag,
  patches it, builds, tests, packages, and publishes a release with the same tag and asset names.
  Run it by hand from the Actions tab to rebuild a specific tag.
- Upstream's own workflows are removed here; nothing else on this branch is used.

Install from Tizen Homebrew's **GitHub** tab with `xxWismaxx/tizen-youtube`, after removing
the catalog build (same package id `tUb3Xq7Lm9`).

If the workflow fails, upstream changed something `patch.sh` does not expect; check the run log.
