# ansible-runner

Ansible runner Docker image for homelab CronJobs. Based on `python:3.14-slim` with `ansible-core` and `community.general` collection.

## Usage

```bash
docker run --rm ghcr.io/jcwearn/ansible-runner:0.1 playbook.yml
```

Published tags: `X.Y.Z` (immutable), `X.Y` and `X` (both move to the newest release in their series), and `sha-<short>`. There is no `latest` tag — this README used to advertise one that was never published.

## Release

Releases are automated. Put exactly one of `release:major`, `release:minor`, `release:patch`, or `release:skip` on a PR; on merge, [jcwearn/workflows](https://github.com/jcwearn/workflows) computes the next semver, builds and pushes the image, and only then creates the tag and GitHub Release.

`release:skip` exists so a docs-only or CI-only PR has a way out that isn't "forget the label and go red after the merge."

### Note on v0.1.29 – v0.1.35

Those seven tags and GitHub Releases exist, but **no container image was ever pushed for them.** Each release run failed at the build step on a GitHub Actions cache-quota error, over roughly a month, without anyone noticing — the tag was created before the image was built, so a failed build still left a version behind.

They're left in place: the tags and Releases are real, and nothing consumes those versions. `0.1.36` onward supersedes them. The ordering that caused it is fixed — the build now runs before anything is tagged, so a failed build leaves no version at all.
