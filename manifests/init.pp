# == Class: webexplorer
#
# This is a puppet auto deploy for webexplorer
#
# === Parameters
#
# $path::       Override the path for the file
#               default: /usr/local/webexplorer
#
# === Authors
#
# Kaija Chang <kaija.chang@gmail.com>
#
# === Copyright
#
# Copyright 2015
#
class webexplorer($path    = '/usr/local/webexplorer') {
  ensure_packages(['git', 'nodejs'])
  vcsrepo { $path:
    ensure   => present,
    provider => git,
    source   => 'https://github.com/kaija/webexpolorer.git',
  }->
  exec { 'webexplore_npm_install':
    command => "npm install",
    cwd     => $path,
    path    => ['/usr/bin', '/usr/local/bin']
  }
}
