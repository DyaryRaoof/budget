require 'rails_helper'

RSpec.describe Group, type: :model do
  subject { Group.new(name: 'name', icon: 'group icon', author_id: User.first.id) }
  before { subject.save }

  it 'name should be name' do
    expect(subject.name).to eq 'name'
  end

  it 'object should be invalid' do
    subject.name =  nil
    expect(subject).to_not be_valid
  end

  it 'object should be invalid' do
    subject.icon =  nil
    expect(subject).to_not be_valid
  end

end
