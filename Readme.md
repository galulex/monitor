Server Monitor
-

Dependecies
-

`Ruby > 2.0`
`Bundle`

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

Configure `config/deploy/production.rb`
Configure `config/deploy.rb`
Create    `~/agent/shared/config/app.yml` with configs listed in `app.yml.example`
Run `bundle exec cap production deploy`

Server: `passenger start`
-

Test: `bundle exec rspec`
-
