class AddUserImageToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :user_image, :string
  end
end
