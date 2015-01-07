require 'grape'
require 'mongoid'

require 'centry/api'
require "centry/mongoid"

module Centry

  class Plugin

    @@paths = []

    def self.load_all
      @@paths.each do |dir|
        puts "loading path #{dir}"
        Dir.glob( "#{dir}/{helpers,entities,models,mailer}/**/*.rb" ).each do |file|
          require file
        end
      end
      @@paths.each do |dir|
        Dir.glob( "#{dir}/{api}/**/*.rb" ).each do |file|
          require file
        end
        # self.require_api_root( dir )
        self.register_mailer_paths( dir )
        self.register_mailer_assets_paths( dir )
        self.register_assets_paths( dir ) if Centry.respond_to?(:assets)
        self.register_i18n_paths( dir )
      end
    end

    def self.find_view( viewname )
      @@paths.each do |dir|
        Dir.glob( "#{dir}/{views}/**/*.erb" ).each do |file|
          return file if File::basename(file) == viewname
        end
      end
      nil
    end

    def self.find_static_file( filename )
      @@paths.each do |dir|
        Dir.glob( "#{dir}/../public/**/*" ).each do |file|
          return file if file.split('public').last == filename
        end
      end
      nil
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

    def self.register_mailer_paths( dir )
      mailer_path = File::join( dir, 'views' )
      return unless File::exists? mailer_path
      Centry::Mailer.register_view_path( mailer_path )
    end

    def self.register_i18n_paths( dir )
      locale_path = File::join( dir, '..', 'config', 'locales' )
      return unless File::exists? locale_path
      I18n.load_path << Dir[File::join( locale_path, '*.{rb,yml}').to_s]
    end

    def self.register_assets_paths( dir )
      assets_path = File::join( dir, 'assets' )
      Centry.assets << File::join( assets_path, '/javascripts' )
      Centry.assets << File::join( assets_path, '/stylesheets' )
      Centry.assets << File::join( assets_path, '/images' )
    end

    def self.register_mailer_assets_paths( dir )
      mailer_assets_path = File::join( dir, 'assets', 'mailer' )
      return unless File::exists? mailer_assets_path
      Centry::Mailer.register_mailer_assets_path( mailer_assets_path )
    end

  end

end
