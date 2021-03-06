name "xz"
default_version "5.2.1"

version "5.0.5" do
  source md5: "19d924e066b6fff0bc9d1981b4e53196"
end

version "5.2.1" do
  source md5: "3e44c766c3fb4f19e348e646fcd5778a"
end

dependency "libiconv"

#source :url => "http://webops-resources.dev.bloomberg.com/other_stuff/xz-#{version}.tar.gz"
source :url => "http://tukaani.org/xz/xz-#{version}.tar.gz"

relative_path "xz-#{version}"

env = {
  "PKG_CONFIG_PATH" => "#{install_dir}/embedded/lib/pkgconfig",
  "LDFLAGS" => "-L#{install_dir}/embedded/lib -L#{install_dir}/embedded/lib64 -I#{install_dir}/embedded/include",
  "CPPFLAGS" => "-L#{install_dir}/embedded/lib -L#{install_dir}/embedded/lib64 -I#{install_dir}/embedded/include",
  "LD_RUN_PATH" => "#{install_dir}/embedded/lib"
}

build do

  configure = [
    "./configure",
    "--prefix=#{install_dir}/embedded",
  ]

  command configure.join(" "), :env => env
  command "make -j #{workers}", :env => env
  command "make install"

end
