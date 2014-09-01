include_recipe 'dependencies'

node[:deploy].each do |application, deploy|

  opsworks_deploy_user do
    deploy_data deploy
  end
  
execute "install_update" do
	command "apt-get update"
end

package "python-pip" do 
	action :install
end


end
