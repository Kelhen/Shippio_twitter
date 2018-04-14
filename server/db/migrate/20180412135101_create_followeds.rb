class CreateFolloweds < ActiveRecord::Migration[5.2]
  def change
    create_table :followeds do |t|
      t.references :user
      t.references :followed

      add_foreign_key :followeds, :users, column: :user, primary_key: :id
      add_foreign_key :followeds, :users, column: :followed, primary_key: :id

      t.timestamps
    end
  end
end
