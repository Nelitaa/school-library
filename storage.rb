require 'json'

class Storage
  def self.save(name, object)
    objects = object.map(&:to_json)
    File.write("#{name}.json", JSON.generate(objects))
  end

  def self.load(name)
    return [] unless File.exist?("#{name}.json")

    JSON.parse(File.read("#{name}.json"), create_additions: true)
  end
end
