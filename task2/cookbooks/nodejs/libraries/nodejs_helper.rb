module NodeJs
  module Helper
    def npm_dist
      if node['nodejs']['npm']['url']
        { 'url' => node['nodejs']['npm']['url'] }
      else

        require 'open-uri'
        require 'json'
        result = JSON.parse(URI.parse("https://registry.npmjs.org/npm/#{node['nodejs']['npm']['version']}").read, max_nesting: false)
        ret = { 'url' => result['dist']['tarball'], 'version' => result['_npmVersion'], 'shasum' => result['dist']['shasum'] }
        Chef::Log.debug("Npm dist #{ret}")
        ret
      end
    end

    def npm_list(package, path = nil, environment = {})
      require 'json'
      cmd = if path
              Mixlib::ShellOut.new("npm list #{package} -json", cwd: path, environment: environment)
            else
              Mixlib::ShellOut.new("npm list #{package} -global -json", environment: environment)
            end

      begin
        JSON.parse(cmd.run_command.stdout, max_nesting: false)
      rescue JSON::ParserError => e
        Chef::Log.error("nodejs::library::nodejs_helper::npm_list exception #{e}")
        {}
      end
    end

    def url_valid?(list, package)
      require 'open-uri'

      begin
        URI.parse(list.fetch(package, {}).fetch('resolved'))
      rescue KeyError
        # the package may have been installed without using a url
        true
      rescue URI::InvalidURIError
        false
      end
    end

    def version_valid?(list, package, version)
      (version ? list[package]['version'] == version : true)
    end

    def npm_package_installed?(package, version = nil, path = nil, environment = {})
      list = npm_list(package, path, environment)['dependencies']
      # Return true if package installed and installed to good version
      # see if we really want to add the url check
      !list.nil? && list.key?(package) && version_valid?(list, package, version) && url_valid?(list, package)
    end
  end
end
