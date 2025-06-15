{ ... }:
{
  programs.zsh.shellAliases = {
    ".." = "z ..";
    ".j" = "just --justfile ~/.user.justfile --working-directory .";
    "7zenc" = "7z a -t7z -m0=lzma2 -mx=9 -mfb=64 -md=32m -ms=on -mhe=on -p";
    c = "cargo";
    cat = "bat --style header --style snip --style changes --style header";
    ccfull = "c +nightly fmt --check && c +nightly clippy && c +nightly c";
    cf = "c fmt";
    cfull = "cf --check && c clippy && c c";
    cr = "c r -q";
    e = "eza";
    fdate = "date +'%Y/%m/%d %r'";
    g = "TZ=UTC git";
    gc = "g commit -m";
    gcr = "g commit --amend '-S'";
    git-head = "git log HEAD^..HEAD --pretty=%H";
    gms = "g merge --squash";
    gr = "g rebase -i";
    grc = "g rebase --continue";
    j = "just";
    ll = "ls -l";
    md = "mkdir";
    tra = "trash put";
    ze = "zellij";
  };
}
