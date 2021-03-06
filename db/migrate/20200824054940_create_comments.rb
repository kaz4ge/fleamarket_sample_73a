class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :product, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :comment
      t.timestamps
    end
  end
end
