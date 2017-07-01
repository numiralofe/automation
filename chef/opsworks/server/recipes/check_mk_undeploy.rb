host_name=(node["opsworks"]["instance"]["hostname"])
monit_server=(node[:app][:monit][:server])
monit_username=(node[:app][:monit][:username])
monit_password=(node[:app][:monit][:password])

script "check_mk_undeploy" do 
  interpreter "bash"
  user "root"
  code <<-EOH
    wget --no-check-certificate --post-data 'request={"attributes":{"tag_criticality": "offline"}, "hostname": "#{host_name}"}' 'https://#{monit_server}/prod/check_mk/webapi.py?action=edit_host&_username=#{monit_username}&_secret=#{monit_password}' -O /root/check_mk_register.log -o /root/wget.log
    wget --no-check-certificate --post-data 'request={"sites":["prod"]}' 'https://#{monit_server}/prod/check_mk/webapi.py?action=activate_changes&_username=#{monit_username}&_secret=#{monit_password}' -q -o -
  EOH
end
