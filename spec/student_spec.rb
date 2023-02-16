require_relative '../student'
require_relative '../classroom'
require 'json'

describe Student do
  before(:each) do
    @student = Student.new(1, 'Classroom A', 15, 'John', 'Y')
  end

  it 'test initialize' do
    expect(@student.id).to eq(1)
    expect(@student.classroom).to eq('Classroom A')
    expect(@student.age).to eq(15)
    expect(@student.name).to eq('John')
    expect(@student.parent_permission).to eq('Y')
  end

  it 'test play hooky' do
    expect(@student.play_hooky).to eq('¯(ツ)/¯')
  end

  it 'test classroom=' do
    classroom = Classroom.new('Classroom B')

    @student.classroom = classroom

    expect(@student.classroom).to eq(classroom)
    expect(classroom.students).to include(@student)
  end

  it 'test to_json' do
    expected = { JSON.create_id => 'Student', 'id' => 1, 'classroom' => 'Classroom A', 'age' => 15, 'name' => 'John',
                 'parent_permission' => 'Y' }.to_json

    expect(@student.to_json).to eq(expected)
  end

  it 'test create from json' do
    json = { JSON.create_id => 'Student', 'id' => 1, 'classroom' => 'Classroom A', 'age' => 15, 'name' => 'John',
             'parent_permission' => 'Y' }.to_json

    student = Student.json_create(JSON.parse(json))

    expect(student).to be_instance_of Student
    expect(student.id).to eq(1)
    expect(student.classroom).to eq('Classroom A')
    expect(student.age).to eq(15)
    expect(student.name).to eq('John')
    expect(student.parent_permission).to eq('Y')
  end
end
