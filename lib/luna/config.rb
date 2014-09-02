module Luna

  module Config

    def self.host
      defined?(@@config) || load_config
      @@config.host
    end

    def self.load_config
      @@config = ConfigFileLoader.new
    end

    private
    class ConfigFileLoader

      def initialize
        read_config_file
      end

      def host
        @infos[Rails.env]['host']
      end

      private
      def read_config_file
        file = File.open(File.join(Rails.root.to_s, 'config', 'luna.yml'))
        @infos = YAML::load(file.read)
      end

    end

  end

end

