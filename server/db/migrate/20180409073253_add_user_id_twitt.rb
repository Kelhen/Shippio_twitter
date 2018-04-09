class AddUserIdTwitt < ActiveRecord::Migration[5.2]
  def change
    change_table :twitts do |t|
      t.references :user, foreign_key: true
    end
  end
end
