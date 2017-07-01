require 'net/http'

private_ip=Net::HTTP.get(URI.parse('http://169.254.169.254/latest/meta-data/local-ipv4'))

host_name=(node["opsworks"]["instance"]["hostname"])
monit_server=(node[:app][:monit][:server])
monit_username=(node[:app][:monit][:username])
monit_password=(node[:app][:monit][:password])
monit_agent=(node[:app][:monit][:agent])

layer=(node["opsworks"]["instance"]["layers"][0])
folder=(node[:app][layer][:monit_folder])
# folder=(node[:app][:dockers_nginxv7][:monit_folder])


script "install_check_mk_agent" do 
  interpreter "bash"
  user "root"
  code <<-EOH
    apt-get install -y -qq xinetd ;
    cd /root ;
    wget --no-check-certificate https://#{monit_server}/prod/check_mk/agents/#{monit_agent} ;
    dpkg -i #{monit_agent} ;
    service xinetd restart ;
    wget --no-check-certificate https://#{monit_server}/prod/check_mk/agents/Aptoide/check_awsFrontends_http -O /usr/lib/check_mk_agent/local/check_awsFrontends_http ;
    chmod 755 /usr/lib/check_mk_agent/local/check_awsFrontends_http
    wget --no-check-certificate --post-data 'request={"attributes":{"tag_agent": "cmk-agent", "tag_criticality": "prod", "ipaddress": "#{private_ip}"}, "hostname": "#{host_name}", "folder": "#{folder}", "create_folders": 0}' 'https://#{monit_server}/prod/check_mk/webapi.py?action=add_host&_username=#{monit_username}&_secret=#{monit_password}' -O /root/check_mk_register.log -o /root/wget.log
    wget --no-check-certificate --post-data 'request={"attributes":{"tag_criticality": "prod", "ipaddress": "#{private_ip}"}, "hostname": "#{host_name}"}' 'https://#{monit_server}/prod/check_mk/webapi.py?action=edit_host&_username=#{monit_username}&_secret=#{monit_password}' -O /root/check_mk_register.log -o /root/wget.log
    wget --no-check-certificate --post-data 'request={"hostname": "#{host_name}"}' 'https://#{monit_server}/prod/check_mk/webapi.py?action=discover_services&_username=#{monit_username}&_secret=#{monit_password}&mode=refresh' -q -o -
    wget --no-check-certificate --post-data 'request={"hostname": "#{host_name}"}' 'https://#{monit_server}/prod/check_mk/webapi.py?action=discover_services&_username=#{monit_username}&_secret=#{monit_password}&mode=fixall' -q -o -
    wget --no-check-certificate --post-data 'request={"sites":["prod"]}' 'https://#{monit_server}/prod/check_mk/webapi.py?action=activate_changes&_username=#{monit_username}&_secret=#{monit_password}' -q -o -
  EOH
end
