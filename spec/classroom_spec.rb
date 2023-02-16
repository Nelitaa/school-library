require_relative '../classroom'
require_relative '../student'

describe Classroom do
  before(:each) do
    @classroom = Classroom.new('Room 1')
  end

  it 'test label is set correctly' do
    expect(@classroom.label).to eq('Room 1')
  end

  it 'test students are empty by default' do
    expect(@classroom.students).to be_empty
  end

  it 'test adds student correctly' do
    student = Student.new(nil, 'Room2', 12, 'John')
    @classroom.add_student(student)
    expect(@classroom.students).to include(student)
    expect(student.classroom).to eq(@classroom)
  end
end
