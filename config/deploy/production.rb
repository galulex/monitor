server 'ec2-54-234-248-203.compute-1.amazonaws.com',
       user: 'ubuntu',
       roles: %w(app db web)

set :ssh_options,
    forward_agent: true,
    auth_methods: ['publickey'],
    keys: ['../alex.pem']
