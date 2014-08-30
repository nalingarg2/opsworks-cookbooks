include_recipe 'dependencies'

node[:deploy].each do |application, deploy|

  opsworks_deploy_user do
    deploy_data deploy
  end
  
  package "git" do
	action :install
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
