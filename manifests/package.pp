
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

}
