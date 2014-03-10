#
# Cookbook Name:: elasticsearch
# Recipe:: plugins
#

include_recipe "elasticsearch"

unless File.directory? "/usr/share/elasticsearch/plugins/paramedic"
    bash "install_elasticsearch-paramedic" do
      code <<-EOH
        /usr/share/elasticsearch/bin/plugin -install karmi/elasticsearch-paramedic
      EOH
    end
end

unless File.directory? "/usr/share/elasticsearch/plugins/head"
    bash "install_elasticsearch-head" do
      code <<-EOH
        /usr/share/elasticsearch/bin/plugin -install mobz/elasticsearch-head
      EOH
    end
end

unless File.directory? "/usr/share/elasticsearch/plugins/bigdesk"
    bash "install_elasticsearch-bigdesk" do
      code <<-EOH
        /usr/share/elasticsearch/bin/plugin -install lukas-vlcek/bigdesk
      EOH
    end
end
