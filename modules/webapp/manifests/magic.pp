class webapp::magic {

  include webapp
  include webapp::rvm
  include webapp::git
  include webapp::php

  class { '::mysql::bindings':
    php_enable  => true,
  }

  nginx::vhost { 'magic.example.com':
    ensure      => present,
    server_name => 'magic.example.com',
    access_log  => '/srv/www/example/logs/web-access.log',
    error_log   => '/srv/www/example/logs/web-error.log',
    root        => '/srv/www/example/public_html/piktov2/public/',
    require     => Package['nginx'],
  }

  nginx::upstream { 'web':
    members => [ '1.2.3.4', '2.3.4.5' ],
    require => Package['nginx'],
  }

}
