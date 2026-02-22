# ansible-runner

Ansible runner Docker image for homelab CronJobs. Based on `python:3.12-slim` with `ansible-core` and `community.general` collection.

## Usage

```bash
docker run --rm ghcr.io/jcwearn/ansible-runner:latest playbook.yml
```

## Release

Releases are automated via GitHub Actions. Add a `release:major`, `release:minor`, or `release:patch` label to a PR. On merge, a new semver tag and GitHub Release are created, and the Docker image is built and pushed to GHCR.
