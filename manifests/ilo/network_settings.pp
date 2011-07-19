
class hp-loading::ilo::network_settings (ip_address,
                                         subnet_mask,
                                         gateway) {

  include hp-loading

  file {
    "/usr/local/lib/hp-loading/hponcfg/Set_Network_Settings.xml":
      owner   => "root",
      group   => "root",
      mode    => 0644,
      content => template("hp-loading/hponcfg/Set_Network_Settings.xml.erb"),
      notify  => Service["hp-loading"];
  }

}
