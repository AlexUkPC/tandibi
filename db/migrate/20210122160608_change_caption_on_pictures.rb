class ChangeCaptionOnPictures < ActiveRecord::Migration[6.1]
  def change
    change_column( "pictures", "caption", :string, :null => true)
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
