require 'rubygems' if RUBY_VERSION < "1.9"
require 'sinatra/base'
require 'yaml'

class ServerRotate < Sinatra::Base  
  get '/' do
    list = load_file_list
    if list.nil?
      "No files detected"
    else
      path = list['files'][list['current']]
      puts path
      list['current'] = list['current'].to_i + 1
      if list['current'] >= list['files'].count
        list['current'] = 0
      end
      puts list['current']
      save_file_list(list)
      send_file(path, :disposition => 'inline')
    end
  end
  
  
  def load_file_list
    path = File.join('cache', 'files.yml')
    unless File.exists?(path) 
      file_list = Dir.glob(File.join('files', "*"))
      return nil if file_list.empty?
      list = {'files' => file_list, 'current' => 0}
    else
      list = YAML.load(open(path).read)
    end
  end

  def save_file_list(list)
    File.open(File.join('cache', 'files.yml'), 'w') {|f| f.write(YAML.dump(list)) }
  end
  
end