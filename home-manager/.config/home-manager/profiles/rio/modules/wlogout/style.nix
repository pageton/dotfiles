let
  theme = import ./theme.nix;
in
{
  style = ''
    * {
      background-image: none;
      font-size: 18px;
    }

    window {
      background-color: rgba(30, 30, 46, 0.75);
    }

    button {
      color: ${theme.main-fg};
      background-color: ${theme.main-bg};
      border: 2px solid ${theme.border-color};
      border-radius: 16px;
      padding: 20px;
      margin: 20px;
      background-repeat: no-repeat;
      background-position: center;
      background-size: 25%;
      transition: all 0.25s ease-in-out;
    }

    button:hover {
      background-color: ${theme.hover-bg};
      background-size: 35%;
      border-color: #f38ba8;
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
