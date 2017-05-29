role :app, %w(0.0.0.0)

set :ssh_options, {
  forward_agent: true,
  user: 'deployer'
}
