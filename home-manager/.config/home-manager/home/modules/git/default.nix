{ ... }:

{
  programs.git = {
    enable = true;
    userName = "Rio";
    userEmail = "riomahod@gmail.com";

    signing = {
      key = "8B734A2ECB630FE7";
      signByDefault = true;
    };

    extraConfig = {
      core = {
        editor = "nvim";
      };
      init = {
        defaultBranch = "main";
      };
      pull.rebase = false;
      push.autoSetupRemote = true;
      merge.conflictStyle = "diff3";
    };
  };
}
