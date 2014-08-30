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

end
