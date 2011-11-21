module VersionHelper
  def old?(version)
    max_version = [0, 5, 1]
    (version.split('.').collect(&:to_i) <=> max_version) < 0
  end

  def archive_url_for(version)
    unless old?(version)
      "http://nodejs.org/dist/v#{ node[:nodejs][:version] }/node-v#{ node[:nodejs][:version] }.tar.gz"
    else
      "http://nodejs.org/dist/node-v#{ node[:nodejs][:version] }.tar.gz"
    end
  end
end

class Chef::Resource::Bash
  include VersionHelper
end
