# == Class: profile::puppetdb
#
# PuppetDB profile
#
# === Parameters
#
# None
#
# === Variables
#
# None
#
# === Examples
#
#  include profile::puppetdb

class profile::puppetdb {
  include ::puppetdb
  include ::puppetdb::master::config
}