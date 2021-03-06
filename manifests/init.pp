# Class: iissetup
# ===========================
#
# Full description of class iissetup here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'iissetup':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2016 Your name here, unless otherwise noted.
#
class iissetup {

dism { 'IIS-WebServer' :
  ensure => present,
  all    => true,
}

iis::manage_app_pool {'skillbuilder_pool':
    enable_32_bit           => true,
    managed_runtime_version => 'v4.0',
  }
   iis::manage_site {'www.puppetskill.net':
    site_path     => 'C:\inetpub\wwwroot\puppetskill',
    port          => '80',
    ip_address    => '*',
    host_header   => 'www.puppetskill.net',
    app_pool      => 'skillbuilder_pool'
  }
   iis::manage_virtual_application {'static_page_app':
    site_name   => 'www.puppetskill.net',
    site_path   => 'C:\inetpub\wwwroot\static_page_app',
    app_pool    => 'skillbuilder_pool'
  }


}
