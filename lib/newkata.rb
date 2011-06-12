require "thor/group"

class NewKata < Thor::Group
  include Thor::Actions

  argument :name

  def self.source_root
    File.dirname(__FILE__)
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
