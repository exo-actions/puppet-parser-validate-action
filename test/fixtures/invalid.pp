# This file has a deliberate syntax error - missing comma
file { '/tmp/puppet-test-invalid'
  ensure  => file,
  content => 'This manifest has a syntax error',
  mode    => '0644'
}
