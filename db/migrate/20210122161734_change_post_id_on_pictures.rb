class ChangePostIdOnPictures < ActiveRecord::Migration[6.1]
  def change
    change_column( "pictures", "post_id", :bigint, :null => false)
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
