script "login_to_registry" do
  interpreter "bash" 
  user "root"
  code <<-EOH
  DOMAIN="#{node[:app][:domain]}";
  USER="#{node[:app][:username]}";
  PASS="#{node[:app][:password]}";
  MAIL="NONE";
  docker login --username="${USER}" --password="${PASS}" --email="${MAIL}" ${DOMAIN} ;
  EOH
end
