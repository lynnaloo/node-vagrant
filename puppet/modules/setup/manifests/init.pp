class setup($node_version = "v0.10.26") {
  # Add some default path values
  Exec { path => ['/usr/local/bin','/usr/local/sbin','/usr/bin/','/usr/sbin','/bin','/sbin', "/home/vagrant/nvm/${node_version}/bin"], }

  exec { "apt-update":
      command => "/usr/bin/apt-get update"
  }

  Exec["apt-update"] -> Package <| |>

  # Support packages
  class { support: }

  # Install Node
  class { 'nvm':
      node_version => $node_version,
      require => [Class["support"]]
  }

  define npm( $directory="/home/vagrant/nvm/${setup::node_version}/lib/node_modules" ) {
    exec { "install-${name}-npm-package":
      unless => "test -d ${directory}/${name}",
      command => "npm install -g ${name}",
      require => Exec['install-node'],
    }
  }

  # Global npm modules
  npm { ["nodemon", "node-inspector"]:
  }

  # Make sure our code directory has proper permissions
  file { '/home/dev':
      ensure => "directory",
      owner  => "vagrant",
      group  => "vagrant"
  }
}
