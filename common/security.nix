{ pkgs, ... }:
{
	security.auditd.enable = true;
	security.sudo.execWheelOnly = true;
  	security.audit.enable = true;
  	security.audit.rules = [
    		"-a exit,always -F arch=b64 -S execve"
  	];
	nix.settings.allowed-users = [ "@wheel" ];
	security.polkit.enable = true;
	security.polkit.extraConfig = ''
		polkit.addRule(function(action, subject) {
			if (
				subject.isInGroup("users")
				&& (
					action.id == "org.freedesktop.login1.reboot" ||
					action.id == "org.freedesktop.login1.reboot-multiple-sessions" ||
					action.id == "org.freedesktop.login1.power-off" ||
					action.id == "org.freedesktop.login1.power-off-multiple-sessions"
				)
			)
			{
				return polkit.Result.YES;
			}
		});
	'';
}
