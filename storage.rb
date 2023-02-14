require 'json'

class Storage
  def self.save(name, object)
    File.write("#{name}.json", JSON.dump(object))
  end
end
