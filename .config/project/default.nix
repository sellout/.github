### All available options for this file are listed in
### https://sellout.github.io/project-manager/options.xhtml
{config, ...}: {
  project = {
    name = ".github";
    summary = "Default community health files for `github:sellout` repositories";
  };

  programs.vale = {
    excludes = [
      "./CODE_OF_CONDUCT.md" # not written by us
    ];
    vocab.${config.project.name}.accept = [
      "rebase"
    ];
  };

  ## publishing
  services.github.settings.repository.private = false;
  services.github.settings.repository.topics = [];
}
