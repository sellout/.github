# Sellout’s .github

[![built with garnix](https://img.shields.io/endpoint?url=https%3A%2F%2Fgarnix.io%2Fapi%2Fbadges%2Fsellout%2F.github)](https://garnix.io/repo/sellout/.github)
[![Nix CI](https://nix-ci.com/badge/gh:sellout:.github)](https://nix-ci.com/gh:sellout:.github)
[![Project Manager](https://img.shields.io/badge/%20-Project%20Manager-%235277C3?logo=nixos&labelColor=%23cccccc)](https://sellout.github.io/project-manager/)

Default community health files for `github:sellout` repos

This repo is implicitly depended on by any other repo under the “sellout” user on GitHub. It contains files that are presented as if they are part of each repo _unless_ that repo contains an overriding file.

More about this special repository can be found in [GitHub’s docs](https://docs.github.com/en/communities/setting-up-your-project-for-healthy-contributions/creating-a-default-community-health-file).

It’s not apparent from the docs what the priority of the locations searched is, or whether this repo can have community health files distinct from the default ones it provides. As such, I’m assuming the following priority order:

1. the root of the repo
2. the `.github` directory
3. the `docs` directory
4. this repo’s root
5. this repo’s `.github` directory
6. this repo’s `docs` directory

With the restriction that _some_ files (e.g., issue templates) must live in .github). It’s not obvious to me where files specific to this repo would live.

As such, I am putting GitHub-specific files in .github (issue templates, FUNDING.yml, etc.) and the rest in the root directory (or wherever they are likely to be found outside of GitHub – e.g., CONTRIBUTING.md).

## development

We recommend the following steps to make working in this repository as easy as possible.

### Nix users

#### `direnv allow`

This command ensures that any work you do within this repository happens within a consistent reproducible environment. That environment provides various debugging tools, etc. When you leave this directory, you will leave that environment behind, so it doesn’t impact anything else on your system.

#### `project-manager switch`

This is sort-of a catch-all for keeping your environment up-to-date. It regenerates files, wires up the project’s Git configuration, ensures the shells have the right packages, configured the right way, enables checks & formatters, etc.

## building & development

There is a flake-based Nix build. If you are unfamiliar with Nix, [Nix adjacent](...) can help you get things working in the shortest time and least effort possible.

### if you have `nix` installed

`nix develop` will put you into an environment where the traditional build tooling works. If you also have `direnv` installed, then you should automatically be in that environment when you're in a directory in this project.

`nix flake check` will do a comprehensive check of the state of the repository (package-specific tests are usually run as part of `nix build`, but this covers formatting, consistency, and larger integration testing).
