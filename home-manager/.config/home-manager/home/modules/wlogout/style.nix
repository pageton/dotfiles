{ config, ... }:

let
  colors = config.theme.catppuccin.colors;
in
{
  programs.wlogout.style = ''
    * {
    background-image: none;
    font-size: 18px;
    }

    window {
    background-color: rgba(30, 30, 46, 0.75);
    }

    button {
    color: #${colors.text.alpha};
    background-color: #${colors.crust.alpha};
    border: 2px solid #${colors.surface0.alpha};
    border-radius: 16px;
    padding: 20px;
    margin: 20px;
    background-repeat: no-repeat;
    background-position: center;
    background-size: 25%;
    transition: all 0.25s ease-in-out;
    }

    button:hover {
    background-color: #${colors.pink.alpha};
    background-size: 35%;
    border-color: #${colors.red.alpha};
    }

    #lock {
    background-image: image(url("./icons/lock.png"));
    }

    #logout {
    background-image: image(url("./icons/logout.png"));
    }

    #suspend {
    background-image: image(url("./icons/suspend.png"));
    }

    #shutdown {
    background-image: image(url("./icons/shutdown.png"));
    }

    #hibernate {
    background-image: image(url("./icons/hibernate.png"));
    }

    #reboot {
    background-image: image(url("./icons/reboot.png"));
    }
  '';
}
