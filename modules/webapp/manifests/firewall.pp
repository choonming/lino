class webapp::firewall { 

  class { '::firewall': }

  firewall { '100 allow www access':
    chain   => 'INPUT',
    action  => 'accept',
    dport   => '80',
    proto   => 'tcp',
  }

}
