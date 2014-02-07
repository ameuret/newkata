require "thor/group"  
require "bundler"

module NewKata

  class App < Thor::Group
    include Thor::Actions

    class_option :gem, :type => :boolean
    argument :name, type: :string, desc: "The name of the class on which this kata is focused"
    desc "Creates a project directory fully equipped to support BDD with RSpec"
    def self.banner
      "#{basename} NAME"
    end
    
    def self.source_root
      File.dirname(__FILE__)
    end

    def check_name
      begin
        instance_eval("class #{name};end")
      rescue SyntaxError
        puts "The name argument must be usable as a Ruby class name."
        raise ArgumentError
      end
    end
    
    def create_spec_file
      template('../templates/spec/skel_spec.rb.tt', "#{name.downcase}/spec/#{name.downcase}_spec.rb")
    end
    
    def add_gem_support
      return unless options[:gem]
      Bundler.with_clean_env do
        system "bundle gem #{name.downcase}"
      end
    end
  
    def create_class_file
      return if options[:gem]
      template('../templates/lib/skel.rb.tt', "#{name.downcase}/lib/#{name.downcase}.rb")
    end

    def copy_config_files
      copy_file "../templates/Guardfile", "#{name.downcase}/Guardfile"
      if !options[:gem]
        copy_file "../templates/Gemfile", "#{name.downcase}/Gemfile"
      else
        prepend_to_file("#{name.downcase}/Gemfile","# Statements produced by 'bundle gem'")
        append_to_file "#{name.downcase}/Gemfile" do
          File.read(find_in_source_paths("../templates/Gemfile_append"))
        end
      end
    end
  
    def patch_gemspec
      return unless options[:gem]
      gsub_file("#{name.downcase}/#{name.downcase}.gemspec",
                /spec.add_development_dependency/,
                '#spec.add_development_dependency')
      inject_into_file("#{name.downcase}/#{name.downcase}.gemspec",
                       "  # Dev dependency are best managed in the Gemfile\n",
                       before: "  #spec.add_development_dependency")
    end
  
    def epilogue
      say "Ready, focused, code !", Thor::Shell::Color::GREEN
      say "  cd #{name.downcase}", Thor::Shell::Color::GREEN
      say "  bundle", Thor::Shell::Color::GREEN
      say "  guard # (if you like it)", Thor::Shell::Color::GREEN
      return unless options[:gem]
      say "  (don't worry about the yellow, Bundler is just warning you about the missing gem descriptions)", Thor::Shell::Color::GREEN
    end

  end
  
end
