class AddFileToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :file, :string
  end
end
