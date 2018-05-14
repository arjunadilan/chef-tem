package 'apache' do
  package_name 'httpd'
end
service 'httpd' do
  action [:start, :enable ]
end

file '/var/www/html/index.html' do
  content 'Hello World'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

file '/etc/motd' do
  content 'Dilan Chef Server LA'
  
end

execute 'command-test' do
  command 'echo blah > /etc/motd'
  only_if 'test -r /etc/motd'
end





