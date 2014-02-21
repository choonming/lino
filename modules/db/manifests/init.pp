class db {

  include db::firewall
  class { '::mysql::server':
    root_password => 'password',
  }
  
}
