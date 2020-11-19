class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.boolean :read
      t.boolean :currently_own

      t.timestamps
    end
  end
end
