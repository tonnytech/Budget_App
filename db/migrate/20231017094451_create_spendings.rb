class CreateSpendings < ActiveRecord::Migration[7.0]
  def change
    create_table :spendings do |t|
      t.string :name
      t.decimal :amount
      t.references :user, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
