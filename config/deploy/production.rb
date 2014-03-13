server "my_fancy_server.com", roles:[:app, :web, :db] , :primary => true
set :deploy_to, "/home/#{user}/apps/#{application}"
default_run_options[:pty] = true
ssh_options[:forward_agent] = true
ssh_options[:port] = 22