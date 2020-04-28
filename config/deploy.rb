lock '3.13.0'

set :application, 'chat-space'

set :repo_url,  'git@github.com:kumati7/chat-space.git'


set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

set :rbenv_type, :user
set :rbenv_ruby, 'ruby 2.5.1' 

set :ssh_options, auth_methods: ['publickey'],
                  keys: ['~/.ssh/wheyprotein_pem.pem'] 

set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }

set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }
set :keep_releases, 5

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end

set :linked_files, %w{ config/secrets.yml }