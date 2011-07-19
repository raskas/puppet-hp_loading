class hp-loading::enclosure ($ip,
                             $tftp,
                             $oa="",
                             $power="",
                             $fan="",
                             $interconnect="",
                             $blade=""
                            ) {

  include hp-loading::package
  $key = "/etc/ntc/enclosurekey"

  package {
    "hp-firmware-c7000":
      ensure => "installed";
  }

  file {
    "/etc/ntc/enclosurekey":
      owner  => "root",
      group  => "root",
      mode   => 0400,
      source => "puppet:///hp-loading/enclosure/enclosurekey";
    "/etc/ntc/enclosurekey.pub":
      owner  => "root",
      group  => "root",
      mode   => 0400,
      source => "puppet:///hp-loading/enclosure/enclosurekey.pub";
    "/etc/ntc/hp_enclosure.conf":
      owner   => "root",
      group   => "root",
      mode    => 0644,
      content => template("hp-loading/enclosure/hp_enclosure.conf.erb");
    "/etc/ntc/hp_enclosure.yaml":
      owner   => "root",
      group   => "root",
      mode    => 0644,
      content => template("hp-loading/enclosure/hp_enclosure.yaml.erb");
  }

}
