class webapp::git {

  class { '::git': }

  git::workdir { "web.example.com":
    repository      => "http://www.example.com/repo.git",
    local_container => "/var/www",
    local_name      => "web",
    branch          => "staging",
  }

}
