class CreateGroupSpendings < ActiveRecord::Migration[7.0]
  def change
    create_table :group_spendings do |t|
      t.references :group, null: false, foreign_key: true
      t.references :spending, null: false, foreign_key: true

      t.timestamps
    end
  end
end
