require 'rake'
 
begin
  puts "=========================================================="
  puts "Attempting to copy required files into your application..."
  puts "=========================================================="
  RAKE_FILE = File.join(File.dirname(__FILE__), '/tasks/spread.rake')
  load RAKE_FILE
  
  Rake::Task['spread:install_files'].invoke
  puts "=========================================================="
  puts "Success!"
  puts "=========================================================="
rescue Exception => ex
  puts "FAILED TO COPY FILES DURING INSTALL.  PLEASE RUN rake spread:install_files."
  puts "EXCEPTION: #{ex}"
end