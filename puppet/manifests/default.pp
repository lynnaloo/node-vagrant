# Inspired by https://github.com/TryGhost/Ghost-Vagrant/blob/master/manifests/base.pp

$node_version = "v0.12.0"

file { '/etc/motd':
	content => "
***********************************

  Node Development Virtual Machine

- OS:      Ubuntu 14.04
- Node:    ${node_version}
- IP:      192.168.33.20

***********************************
\n"
}

class { setup:
	node_version => $node_version
}
