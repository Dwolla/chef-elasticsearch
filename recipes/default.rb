#
# Cookbook Name:: elasticsearch
# Recipe:: default
#

include_recipe "java"

yum_key "RPM-GPG-KEY-elasticsearch" do
  url "http://packages.elasticsearch.org/GPG-KEY-elasticsearch"
  action :add
end

yum_repository "elasticsearch" do
  repo_name "elasticsearch"
  description "Elasticsearch 0.90.x Stable"
  url "http://packages.elasticsearch.org/elasticsearch/0.90/centos"
  key "RPM-GPG-KEY-elasticsearch"
  action :add
end

package "elasticsearch" do
  action :install
end

service "elasticsearch" do
  action [ :stop, :start, :enable ]
end
