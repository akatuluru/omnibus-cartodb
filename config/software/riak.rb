name "riak"
default_version "2.1.1"

dependency "erlang"

source :url => "http://s3.amazonaws.com/downloads.basho.com/riak/2.1/#{version}/#{name}-#{version}.tar.gz"

relative_path "riak-#{version}"

build do
command "tar zxvf riak-2.1.1.tar.gz " \
        "cd #{name}-#{version} " \
  
  make "locked-deps"
  make "rel"
end
