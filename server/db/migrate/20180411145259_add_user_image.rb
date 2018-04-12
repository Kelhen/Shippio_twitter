class AddUserImage < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |_t|
      add_column :users, :image, :string
    end
  end
end
