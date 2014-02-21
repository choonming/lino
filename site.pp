node base {

  class { 'vim':
    ensure      => present,
    opt_misc    => [ 'nu', 'ts=2', 'et', 'showmatch', 'shiftwidth=2' ],
    opt_syntax  => true,
  }

  package { 'curl':
    ensure  => present,
  }

  resources { 'firewall':
    purge  => true,
  }

}


node web inherits base {

  include webapp::magic

}

node database inherits base {

  include db::testdb

}
