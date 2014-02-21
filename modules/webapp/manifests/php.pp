class webapp::php {

  class { '::php': }

  php::module { 'mcrypt': }

}
