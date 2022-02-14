require 'rails_helper'

RSpec.describe "spendings/new", type: :view do
  before(:each) do
    assign(:spending, Spending.new(
      author: nil,
      name: "MyString",
      amount: 1.5
    ))
  end

  it "renders new spending form" do
    render

    assert_select "form[action=?][method=?]", spendings_path, "post" do

      assert_select "input[name=?]", "spending[author_id]"

      assert_select "input[name=?]", "spending[name]"

      assert_select "input[name=?]", "spending[amount]"
    end
  end
end
