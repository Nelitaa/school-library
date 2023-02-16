require_relative '../person'

describe Person do
  before(:each) do
    @person = Person.new(1, 18, 'John Doe', 'Y')
  end

  it 'test can use services?' do
    expect(@person.can_use_services?).to eq(true)
  end

  it 'test correct name' do
    expect(@person.correct_name).to eq('John Doe')
  end
end
