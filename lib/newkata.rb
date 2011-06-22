require "thor/group"  

module NewKata

  class App < Thor::Group
    include Thor::Actions

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
    
    def create_class_file
      template('../templates/lib/skel.rb.tt', "#{name.downcase}/lib/#{name.downcase}.rb")
    end

    def create_spec_file
      template('../templates/spec/skel_spec.rb.tt', "#{name.downcase}/spec/#{name.downcase}_spec.rb")
    end
    
    def copy_config_files
      copy_file "../templates/Gemfile", "#{name.downcase}/Gemfile"
      copy_file "../templates/Guardfile", "#{name.downcase}/Guardfile"
    end

  end
  
end
