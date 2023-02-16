require_relative '../teacher'

describe Teacher do
  before(:each) do
    @teacher = Teacher.new(1, 'math', 25, 'John', 'Y')
  end

  it 'test initialize' do
    expect(@teacher.id).to eq(1)
    expect(@teacher.specialization).to eq('math')
    expect(@teacher.age).to eq(25)
    expect(@teacher.name).to eq('John')
    expect(@teacher.parent_permission).to eq('Y')
  end

  it 'test can_use_services?' do
    expect(@teacher.can_use_services?).to eq(true)
  end

  it 'test to_json' do
    expected = { JSON.create_id => 'Teacher', 'id' => 1, 'specialization' => 'math', 'age' => 25, 'name' => 'John',
                 'parent_permission' => 'Y' }.to_json
    expect(@teacher.to_json).to eq(expected)
  end

  it 'test json_create' do
    json = { JSON.create_id => 'Teacher', 'id' => 1, 'specialization' => 'math', 'age' => 25, 'name' => 'John',
             'parent_permission' => 'Y' }.to_json

    teacher = Teacher.json_create(JSON[json])

    expect(teacher).to be_instance_of(Teacher)
    expect(teacher.id).to eq(1)
    expect(teacher.specialization).to eq('math')
    expect(teacher.age).to eq(25)
    expect(teacher.name).to eq('John')
    expect(teacher.parent_permission).to eq('Y')
  end
end
