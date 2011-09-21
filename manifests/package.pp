
class hp-loading::package {

  package {
    "ntc-hp-loading":
      ensure => installed,
      require => Package["hp-health", "hp-OpenIPMI", "conrep", "hponcfg"];
    "hp-health":
      ensure => installed;
    "hp-OpenIPMI":
      ensure => installed;
    "conrep":
      ensure => installed;
    "hponcfg":
      ensure => installed;
  }

  service {
    "hp-health":
      enable    => true,
      pattern   => "(hpasmlited)|(hpasmxld)",
      ensure    => running,
      require   => Package["hp-health"];
    "hp-asrd":
      enable    => true,
      ensure    => running,
      require   => Package["hp-health"];
  }

}
