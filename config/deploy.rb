default_run_options[:pty] = true
set :application, 'dayday3'
set :user, 'goodxiexin'
set :domain, 'www.zaituu.com'
set :git_account, 'gaoxh04@gmail.com'
set :scm_passphrase, Proc.new { Capistrano::CLI.password_prompt('Git Password: ')}

role :app, "www.zaituu.com" 
role :web,  "www.zaituu.com" 
role :db,  "www.zaituu.com"

default_run_options[:pty] = true
set :repository,  "git@github.com:gaoxh04/dayday3.git"
set :scm, "git"
set :user, user

ssh_options[:forward_agent] = true
set :branch, "master"
set :deploy_via, :remote_cache
set :git_shallow_clone, 1
set :git_enable_submodules, 1
set :use_sudo, false
set :deploy_to, "/home/goodxiexin/dayday3" 

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

# namespace :deploy do
#   task :start {}
#   task :stop {}
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
