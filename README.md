# Sellout’s .github

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
