module Centry

  class Plugin

    @@paths = []

    def self.load_all
      @@paths.each do |dir|
        Dir.glob( "#{dir}/{helpers,api,models,mailer}/**/*.rb" ).each do |file|
          require file
        end
        self.require_api_root( dir )
      end
    end

    def self.register_path( path )
      raise "invalid path #{path}" unless File::exists?(path)
      @@paths << Pathname.new(path).realpath.to_s
    end

    def self.paths
      @@paths
    end

    private

    def self.require_api_root( dir )
      api_root = File::join( dir, 'api.rb' )
      return unless File::exists? api_root
      require api_root
    end

  end

end