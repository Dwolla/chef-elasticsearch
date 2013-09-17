#
# Cookbook Name:: elasticsearch
# Recipe:: plugins
#

include_recipe "elasticsearch"

bash "install_elasticsearch-plugins" do
  code <<-EOH
    /usr/local/share/elasticsearch/bin/plugin -install karmi/elasticsearch-paramedic
    /usr/local/share/elasticsearch/bin/plugin -install mobz/elasticsearch-head
    /usr/local/share/elasticsearch/bin/plugin -install lukas-vlcek/bigdesk
  EOH
end
