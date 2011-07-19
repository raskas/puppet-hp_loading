
class hp-loading {

  include hp-loading::package

  package {
    "hp-firmware-DL360-G6":
      ensure => $productname ? {
        'ProLiant DL360 G6' => "installed",
        default             => "absent",
      };
    "hp-firmware-DL360-G7":
      ensure => $productname ? {
        'ProLiant DL360 G7' => "installed",
        default             => "absent",
      };
    "hp-firmware-BL460c-G7":
      ensure => $productname ? {
        'ProLiant BL460c G7' => "installed",
        default              => "absent",
      };
    "hp-firmware-BL460c-G6":
      ensure => $productname ? {
        'ProLiant BL460c G6' => "installed",
        default              => "absent",
      };
  }

  

  file {
    "/etc/modprobe.d/nic.conf":
      owner   => "root",
      group   => "root",
      mode    => 0644,
      source  => "puppet:///hp-loading/nic.conf";
    "/usr/local/lib/hp-loading/conrep/":
      owner   => "root",
      group   => "root",
      mode    => 0755,
      ensure  => directory,
      require => Package["ntc-hp-loading"];
    "/usr/local/lib/hp-loading/hponcfg/":
      owner   => "root",
      group   => "root",
      mode    => 0755,
      ensure  => directory,
      require => Package["ntc-hp-loading"];
    "/usr/local/lib/hp-loading/conrep/hyperthreading.xml":
      owner  => "root",
      group  => "root",
      mode   => 0644,
      source => "puppet:///hp-loading/conrep/hyperthreading.xml",
      notify => Service["hp-loading"];
    "/usr/local/lib/hp-loading/hponcfg/Set_Server_Name.xml":
      owner   => "root",
      group   => "root",
      mode    => 0644,
      content => template("hp-loading/hponcfg/Set_Server_Name.xml.erb"),
      notify  => Service["hp-loading"];
  }

  service {
    "hp-loading":
      enable    => true,
      ensure    => running,
      hasstatus => true,
      require   => Package["ntc-hp-loading"];
  }

}
