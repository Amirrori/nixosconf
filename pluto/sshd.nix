{
  services.openssh = {
    settings.PasswordAuthentication = false;
    allowSFTP = false; # Don't set this if you need sftp
    settings.KbdInteractiveAuthentication = false;
    # Removed AllowTcpForwarding; redundant/unused.
    extraConfig = ''
      X11Forwarding no
      AllowAgentForwarding no
      AllowStreamLocalForwarding no
      AuthenticationMethods publickey
    '';
  };
}
