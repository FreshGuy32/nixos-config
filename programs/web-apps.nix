{ ... }:

{
  programs.quick-web-apps = {
    enable = true;

    apps.youtube = {
      name = "Youtube";
      url = "https://youtube.com";
      category = "AudioVideo";
      showBadge = false;
      profile = "Private";
    };

    apps.reddit = {
      name = "Reddit";
      url = "https://reddit.com";
      showBadge = false;
      profile = "Private";
      linkScope = "exact_host";
    };
  };
}
