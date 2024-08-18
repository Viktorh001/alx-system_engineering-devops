'''this line can write a puppet out'''
# 0-strace_is_your_friend.pp

# Example: Fixing a file permission issue on a specific directory
file { '/var/www/html/some-directory':
  ensure  => 'directory',
  owner   => 'www-data',
  group   => 'www-data',
  mode    => '0755',
  recurse => true,
}

# Example: Ensure a specific configuration file is present
file { '/etc/apache2/sites-available/000-default.conf':
  ensure  => 'file',
  owner   => 'root',
  group   => 'root',
  mode    => '0644',
  source  => 'puppet:///modules/apache/000-default.conf',
  notify  => Exec['apache_reload'],
}

# Reload Apache after the fix
exec { 'apache_reload':
  command     => '/usr/sbin/service apache2 reload',
  refreshonly => true,
}
