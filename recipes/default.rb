#
# Cookbook Name:: elasticsearch
# Recipe:: default
#

include_recipe "java"

elasticsearch_src_filename = "elasticsearch-0.90.0.tar.gz"
elasticsearch_src_filepath = "#{Chef::Config['file_cache_path']}/#{elasticsearch_src_filename}"

remote_file elasticsearch_src_filepath do
  source "https://download.elasticsearch.org/elasticsearch/elasticsearch/#{elasticsearch_src_filename}"
end

bash "install_elasticsearch" do
  cwd ::File.dirname(elasticsearch_src_filepath)
  code <<-EOH
    tar -xf #{elasticsearch_src_filename}
    rm #{elasticsearch_src_filename}
    mv elasticsearch-* elasticsearch
    mv elasticsearch /usr/local/share
    EOH
  not_if { ::File.exists?("/usr/local/share/elasticsearch") }
end

bash "install_elasticsearch-servicewrapper" do
  cwd ::File.dirname(elasticsearch_src_filepath)
  code <<-EOH
    curl -L http://github.com/elasticsearch/elasticsearch-servicewrapper/tarball/master | tar -xz
    mv *servicewrapper*/service /usr/local/share/elasticsearch/bin/
    rm -Rf *servicewrapper*
    /usr/local/share/elasticsearch/bin/service/elasticsearch install
    EOH
    not_if { ::File.exists?("/usr/local/share/elasticsearch/bin/service/elasticsearch") } 
end

service "elasticsearch" do
  action [ :stop, :start, :enable ]
end
