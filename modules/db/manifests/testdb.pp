class db::testdb {

  include db
  
  mysql::db { 'testdb':
    user     => 'myuser',
    password => 'mypass',
    host     => 'localhost',
    grant    => ['ALL'],
  }

  mysql_user { 'readuser':
    ensure  => present,
    password_hash => mysql_password('password'),
  }

  mysql_grant { 'readuser@localhost/testdb.*':
    ensure     => 'present',
    options    => ['GRANT'],
    privileges => ['SELECT'],
    table      => 'testdb.*',
    user       => 'readuser@localhost',
  }

  mysql_database { 'testdb2':
    ensure  => 'present',
    charset => 'latin1',
    collate => 'latin1_swedish_ci',
  }

}
