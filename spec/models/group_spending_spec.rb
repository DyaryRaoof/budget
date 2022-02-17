require 'rails_helper'

RSpec.describe GroupSpending, type: :model do
  subject { GroupSpending.new(group_id: Group.first.id, spending_id: Spending.first.id) }
  before { subject.save }

  it 'should be valid' do
    expect(subject).to be_valid
  end

  it 'object should be invalid' do
    subject.group_id = nil
    expect(subject).to_not be_valid
  end

  it 'object should be invalid' do
    subject.spending_id = nil
    expect(subject).to_not be_valid
  end
end
