require 'find'
 
module Spread
  class Assets
    @source = File.expand_path(File.join(File.dirname(__FILE__), '..', 'files'))
    @destination = RAILS_ROOT
    class << self 
      attr_accessor :source, :destination
    end
    
    def self.install
      paths = []
      Find.find(source) do |path|
        Find.prune if path =~ /\/\..+/
        Find.prune if path =~ /CVS/
        paths << path
      end
      paths.each do |path| 
        dest_path = path.gsub(source, destination)
        if File.directory?(path)
          FileUtils.mkdir_p(dest_path) unless File.exists?(dest_path)
        else
          FileUtils.cp(path, dest_path)
        end
      end
    rescue Exception => e
      puts "Error trying to copy files: #{e.inspect}"
      raise e
    end
    
  end  
end
 
namespace :spread do
  desc "Install files required by spread"
  task :install_files do  
    Spread::Assets.install
  end
end
