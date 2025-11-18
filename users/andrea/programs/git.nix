{
  config,
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Andrea Erario";
        email = "andreaerario04@gmail.com";
      };
    };
    signing = {
      key = "42D080106CF8AB07";
      signByDefault = true;
    };
  };
}
