class AddPictureToMicropots < ActiveRecord::Migration
  def change
    add_column :micropots, :picture, :string
  end
end
