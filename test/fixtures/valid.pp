file { '/tmp/puppet-test-valid':
  ensure  => file,
  content => 'Hello from puppet parser validate test',
  mode    => '0644',
}

notify { 'valid_manifest_test':
  message => 'This is a valid Puppet manifest for testing.',
}
