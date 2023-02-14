require 'json'

class Storage
  def self.save(name, object)
    File.write("#{name}.json", JSON.generate(object))
  end

  def self.load(name)
    return [] unless File.exist?("#{name}.json")

    JSON.parse(File.read("#{name}.json"))
  end
end
