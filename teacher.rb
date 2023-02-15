require_relative 'person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(id, specialization, age, name = 'Unknown', parent_permission: true)
    super(id, age, name, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'specialization' => @specialization,
      'age' => @age,
      'name' => @name,
      'parent_permission' => @parent_permission
    }.to_json(*args)
  end

  def self.json_create(object)
    new(object['id'], object['specialization'], object['age'], object['name'], object['parent_permission'])
  end
end
