require 'rails_helper'

RSpec.describe "spendings/edit", type: :view do
  before(:each) do
    @spending = assign(:spending, Spending.create!(
      author: nil,
      name: "MyString",
      amount: 1.5
    ))
  end

  it "renders the edit spending form" do
    render

    assert_select "form[action=?][method=?]", spending_path(@spending), "post" do

      assert_select "input[name=?]", "spending[author_id]"

      assert_select "input[name=?]", "spending[name]"

      assert_select "input[name=?]", "spending[amount]"
    end
  end
end
