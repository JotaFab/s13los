{ config, pkgs, ... }:

{
  programs.wofi = {
    enable = true;
    settings = {
      content_halign = "fill";
      insensitive = true;
      allow_images = true;
      image_size = 30;
      allow_markup = true;
      width = 400;
      term = "ghostty";
      dmenu-parse_action=true;
    };
    style = ''
      window {
      margin: 0px;
      border: 1px solid #005bf8ff;
      background-color: #282a36;
      }

      #input {
      margin: 5px;
      border: none;
      color: #f8f8f2;
      background-color: #44475a;
      }

      #inner-box {
      margin: 5px;
      border: none;
      background-color: #282a36;
      }

      #outer-box {
      margin: 5px;
      border: none;
      background-color: #282a36;
      }

      #scroll {
      margin: 0px;
      border: none;
      }

      #text {
      margin: 5px;
      border: none;
      color: #f8f8f2;
      } 

      #entry.activatable #text {
      color: #282a36;
      }

      #entry > * {
      color: #f8f8f2;
      }

      #entry:selected {
      background-color: #44475a;
      }

      #entry:selected #text {
      font-weight: bold;
      }
       
    '';
  };
}
