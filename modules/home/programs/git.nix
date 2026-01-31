{ globals, ... }:

{
  programs.git = {
    enable = true;
    settings = {

      user.name = globals.GitName;
      user.email = globals.GitEmail;
      init.defaultBranch = "main";
      pull.rebase = true;
      color.ui = "auto";
    };
  };
}
