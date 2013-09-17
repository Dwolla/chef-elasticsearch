name              "elasticsearch"
maintainer        "Dwolla, Inc."
maintainer_email  "fred@dwolla.com"
license           "Apache 2.0"
description       "Installs Elasticsearch"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "1.0.0"

recipe "elasticsearch", "Installs Elasticsearch"
recipe "elasticsearch::plugins", "Installs Elasticsearch plugins"

%w{
    debian
    ubuntu
    centos
    redhat
    scientific
    fedora
    amazon
    oracle
}.each do |os|
  supports os
end

depends "java"
