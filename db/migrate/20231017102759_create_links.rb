class CreateLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :links do |t|
      t.belongs_to :category, null: false, foreign_key: true
      t.belongs_to :spending, null: false, foreign_key: true

      t.timestamps
    end
  end
end
