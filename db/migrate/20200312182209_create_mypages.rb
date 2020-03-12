class CreateMypages < ActiveRecord::Migration[5.2]
  def change
    create_table :mypages do |t|
      t.string :profile

      t.timestamps
    end
  end
end
