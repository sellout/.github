# How to Contribute

## behave

See our [code of conduct](./CODE_OF_CONDUCT.md) for details of what that means.

## reporting issues

Open anything on the forge you’re viewing the code on (most likely GitHub).

All contributions are welcome, we love improvements to docs and tests.

## making changes

### embrace the graph

There is no rebasing here.. You branch where you branch and resolve conflicts in a merge commit.

### all code is autoformatted

Running `nix fmt` should keep your changes in line with the rest of the repository. CI will tell you if that hasn’t happened. We recommend ensuring that each commit is formatted, to keep reformatting noise out of other changes.

If you do need to bulk re-format (e.g., you have a long series of commits, and the work to modify them all, reformatting and resolving conflicts, would be onerous) then make a separate commit that _only_ formats, then another small commit adding the previous SHA to `"${repo_root}/.config/git/ignoreRevs"`.

### be conscious of versioning

Breaking changes should be made in separate PRs from backward compatible changes as much as possible.

For example, if you are adding a new API that replaces an existing one, there should first be a PR that adds the new API alongside the old one, then a second PR that removes the old API. If there are name conflicts, defer them until the breaking change, making the work to adjust to the breaking change minimal. E.g.,

You have original code like:

```
Foo.MyAPI
  call1
  call2
```

then you want to have a new API that replaces call2 and replaces call1 with call3, so you add

```
Foo.MyAPI
  call2'
  call3
```

and mark `call1` and `call2` deprecated.

Then in the breaking change, you remove `call1` and `call2`, then rename `call2'` to `call2` and define `call2'` as a deprecated alias for `call2`. Then a _later_ breaking change will remove `call2'`.

If the API is undergoing more significant changes, then rather than having them live in one place, you can put it in an adajcent module. Starting from the same original code, you add

```
Foo.MyAPI'
  call2
  call3
```

then in the breaking change, you remove `Foo.MyAPI`, rename `Foo.MyAPI'` to `Foo.MyAPI`, and make `Foo.MyAPI'` an alias to `Foo.MyAPI` with deprecated re-exports of everything it had. No future additions to `Foo.MyAPI` should be exposed via the `Foo.MyAPI'` alias.

If there are no conflicts in the changes, simply adding and removing, then there is no need for the third (future) PR. The initial two PRs will suffice.

See [the README](./README.md#versioning) for more specific information on what kind of changes are considered “breaking”.
