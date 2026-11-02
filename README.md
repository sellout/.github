# Sellout’s .github

[![Nix CI](https://nix-ci.com/badge/gh:sellout:.github)](https://nix-ci.com/gh:sellout:.github)
[![Project Manager](https://img.shields.io/badge/%20-Project%20Manager-%235277C3?logo=nixos&labelColor=%23cccccc)](https://sellout.github.io/project-manager/)

Default community health files for `github:sellout` repositories

This repository is implicitly depended on by any other repository under the “sellout” user on GitHub. It contains files that are presented as if they’re part of each repository _unless_ that repository contains an overriding file.

## usage

More about this special repository can be found in [GitHub’s docs](https://docs.github.com/en/communities/setting-up-your-project-for-healthy-contributions/creating-a-default-community-health-file).

It’s not apparent from the docs what the priority of the locations searched is, or whether this repository can have community health files distinct from the default ones it provides. As such, I’m assuming the following priority order:

1. the root of the repository
2. the `.github` directory
3. the `docs` directory
4. this repo’s root
5. this repo’s `.github` directory
6. this repo’s `docs` directory

With the restriction that _some_ files (for example, issue templates) must live in .github). It’s not clear to me where files specific to this repository would live.

As such, I am putting GitHub-specific files in .github (issue templates, FUNDING.yml, etc.) and the rest in the root directory (or wherever they’re likely to be found outside of GitHub – for example, CONTRIBUTING.md).

## contributing

- [contributor guide](https://sellout.github.io/flaky/CONTRIBUTING/nix.html)

## comparisons

Other projects similar to this one, and how they differ.
