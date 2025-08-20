{ pkgs,  ... }:
{

  services.tlp = {
    enable = true;
      
    settings = {
      SOUND_POWER_SAVE_ON_AC = 0;
      DISK_APM_LEVEL_ON_AC = "255 255";
      INTEL_GPU_MIN_FREQ_ON_AC = 600;
      INTEL_GPU_MAX_FREQ_ON_AC = 1150;
      INTEL_GPU_BOOST_FREQ_ON_AC = 1150;
      WIFI_PWR_ON_AC = "off";
      MEM_SLEEP_ON_AC = "deep";
      CPU_SCALING_GOVERNOR_ON_AC = "powersave";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      CPU_MIN_PERF_ON_AC = 0;
      CPU_MAX_PERF_ON_AC = 100;
      CPU_BOOST_ON_AC = 1;
      RUNTIME_PM_ON_AC = "on";

      SOUND_POWER_SAVE_ON_BAT = 10;
      DISK_APM_LEVEL_ON_BAT = "64 64";
      INTEL_GPU_MIN_FREQ_ON_BAT = 600;
      INTEL_GPU_MAX_FREQ_ON_BAT = 1000;
      INTEL_GPU_BOOST_FREQ_ON_BAT = 1000;
      WIFI_PWR_ON_BAT = "on";
      MEM_SLEEP_ON_BAT = "deep";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "performance";
      CPU_MIN_PERF_ON_BAT = 0;
      CPU_MAX_PERF_ON_BAT = 100;
      CPU_BOOST_ON_BAT = 1;
      RUNTIME_PM_ON_BAT = "auto";
        
      NMI_WATCHDOG = 0;
      START_CHARGE_THRESH_BAT0 = 70;
      STOP_CHARGE_THRESH_BAT0 = 80;
      START_CHARGE_THRESH_BAT1 = 70;
      STOP_CHARGE_THRESH_BAT1 = 80;
    };
  };
}













































