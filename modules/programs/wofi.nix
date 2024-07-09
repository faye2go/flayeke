{
  pkgs,
  config,
  ...
}: let 
scheme = config.colorScheme.palette;
in {
  programs.wofi = {
    enable = true;

    settings = {
      prompt = "program menu";
      allow_images = true;
      image_size = "24";
      allow_markup = true;
      width = "30%";
      height = "60%";
      term = "kitty";
    };

    style = with scheme;  ''
    * {
    font-family: JetBrainsMono Nerd Font;
    font-weight: 300;
    font-stretch: condensed;
    }
    #window {
      background-color: transparent;
    }
    #outer-box {
      border-radius: 7px;
      background-color: rgba(73,77,100,0.3);
    }
    #input {
      margin: 10px 20px;
      background-color: rgba(73,77,100,0.5);
      color: #${base05};
      border-width: 0;
      border-radius: 7px;
    }
    #scroll {
      margin: 10px;
      background-color: rgba(73,77,100,0.5);
      border-radius: 7px;
    }
    #entry {
      color: #${base05};
      border-radius: 7px;
    }
    image {
      margin: 0px 5px;
    }
    list {
      background-color: transparent;
    }
    '';
  };
}