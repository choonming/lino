class db::firewall {

  class { '::firewall': }

  firewall { '100 allow mysql access':
    chain   => 'INPUT',
    action  => 'accept',
    proto   => 'tcp',
    dport   => '3306',
  }

}
