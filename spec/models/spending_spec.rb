require 'rails_helper'

RSpec.describe Spending, type: :model do
  subject { Spending.new(name: 'name', amount: 11) }
  before { subject.save }

  it 'name should be name' do
    expect(subject.name).to eq 'name'
  end

  it 'object should be invalid' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'object should be invalid' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end
end
