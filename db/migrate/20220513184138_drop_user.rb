class DropUser < ActiveRecord::Migration[7.0]
  def change
    drop_table :users do |t|
      t.string :email
      t.string :name
      t.timestamps
    end  
  end
end
