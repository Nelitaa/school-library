require_relative '../nameable'

describe Nameable do
  it 'test correct_name' do
    nameable = Nameable.new

    excpected = 'Nameable has not implemented method \'correct_name\''
    expect { nameable.correct_name }.to raise_error(NotImplementedError, excpected)
  end
end
