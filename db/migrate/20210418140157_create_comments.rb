class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.belongs_to :trip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
