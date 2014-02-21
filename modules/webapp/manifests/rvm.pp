class webapp::rvm {

  class { '::rvm': }

  ruby_system_ruby { 'ruby-2.0.0-p247':
    ensure      => present,
    default_use => true,
    require     => Class['rvm'],
  }

}
