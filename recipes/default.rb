#
# Cookbook Name:: elasticsearch
# Recipe:: default
#

include_recipe "java"

yum_repository "elasticsearch" do
  description "Elasticsearch 1.2.x Stable"
  baseurl "http://packages.elasticsearch.org/elasticsearch/1.2/centos"
  gpgkey "http://packages.elasticsearch.org/GPG-KEY-elasticsearch"
  action :create
end

package "elasticsearch" do
  action :install
end

service "elasticsearch" do
  action [ :stop, :start, :enable ]
end
