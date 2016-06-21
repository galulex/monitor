lock '3.5.0'

set :application, 'monitor'
set :repo_url, 'git@github.com:galulex/monitor.git'

set :deploy_to, '/home/ubuntu'

set :linked_files, fetch(:linked_files, []).push('config/app.yml')
set :linked_dirs, fetch(:linked_dirs, []).push('tmp')
