{ config, pkgs, ... }:

{
  programs.wofi = {
    enable = true;
    style = ''
      #input {
      margin: 5px;
      border: none;
      color: #d8dee9;
      background-color: #1e1e1e;
      }

      #inner-box {
      margin: 5px;
      border: none;
      background-color: #1e1e1e; 
      }

      #outer-box {
      margin: 5px;
      border: none;
      background-color: #1e1e1e;
      }

      #scroll {
      margin: 0px;
      border: 1e1e1e;
      }

      #text {
      margin: 5px;
      border: none;
      color: #c4c4c4;
      }

      #entry:selected {
      background-color: #1e1e1e;
      }
      window {
          border-radius: 2px; /* 10px radius for rounded corners */
      }
       
    '';
  };
}
