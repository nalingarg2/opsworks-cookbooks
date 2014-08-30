include_recipe 'dependencies'

node[:deploy].each do |application, deploy|

  opsworks_deploy_user do
    deploy_data deploy
  end

execute "install_update" do
	command "apt-get update"
end
  
  package "git" do
	action :install
end


directory "/git" do
	mode 0755
	owner "ubuntu" 
	group "ubuntu" 
	action :create
end

package "ngnix" do
	action :install
end

service "ngnix" do
	action[:enable,:start]
	suport :reload => true
	notifies :reload
end

package "gunicorn" do
	action :install
end

service "gunicorn" do
	action[:enable,:start]
	suport :reload => true
	notifies :reload
end

python_pip "django" do
  version "1.1.4"
end


end
