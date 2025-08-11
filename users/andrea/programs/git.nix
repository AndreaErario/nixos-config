{
  config,
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
    userName = "Andrea Erario";
    userEmail = "andreaerario04@gmail.com";
    signing = {
      key = "42D080106CF8AB07";
      signByDefault = true;
    };
  };
}
