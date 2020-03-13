class AddUserIdToMypages < ActiveRecord::Migration[5.2]
  def change
    add_column :mypages, :user_id, :integer
  end
end
