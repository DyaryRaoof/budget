class CreateSpendings < ActiveRecord::Migration[7.0]
  def change
    create_table :spendings do |t|
      t.references :author, null: false, foreign_key: {to_table: :users}, index: true
      t.string :name
      t.float :amount

      t.timestamps
    end
  end
end