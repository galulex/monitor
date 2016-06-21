server 'ec2-52-90-199-20.compute-1.amazonaws.com',
       user: 'ubuntu',
       roles: %w(app db web)

set :ssh_options,
    forward_agent: true,
    auth_methods: ['publickey'],
    keys: ['../alex.pem']
