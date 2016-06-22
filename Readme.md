Server Monitor
-

Dependecies
-

`Ruby > 2.0`
`Passenger`
`Bundler`

Simple agent that streams server information

Setup
-

- `gem install bundler`
- `git clone git@github.com:galulex/monitor.git`
- `cd monitor`
- `bundle`
- `cp config/app.yml.example config/app.yml`

How to Deploy
-

*Before deploy make sure that all dependencies are satisfied for you server*

Configure `config/deploy/production.rb`
Configure `config/deploy.rb`
Create    `~/agent/shared/config/app.yml` with configs listed in `app.yml.example`
Install passenger `gem install passenger`
Run `bundle exec cap production deploy`
Login to instance and run passenger `passenger start`. It restarts automaticaly for next deploys

Server: `passenger start`
-

Test: `bundle exec rspec`
-
