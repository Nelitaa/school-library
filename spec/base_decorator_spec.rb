require_relative '../base_decorator'
require_relative '../person'

describe BaseDecorator do
  it 'test correct_name' do
    person = Person.new(1, 22, 'maximilianus')
    @base_decorator = BaseDecorator.new(person)

    expect(@base_decorator.correct_name).to eq('maximilianus')
  end
end
