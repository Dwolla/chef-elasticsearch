#
# Cookbook Name:: elasticsearch
# Recipe:: plugins
#

include_recipe "elasticsearch"

bash "install_elasticsearch-plugins" do
  code <<-EOH
    /usr/share/elasticsearch/bin/plugin -install karmi/elasticsearch-paramedic
    /usr/share/elasticsearch/bin/plugin -install mobz/elasticsearch-head
    /usr/share/elasticsearch/bin/plugin -install lukas-vlcek/bigdesk
  EOH
end
