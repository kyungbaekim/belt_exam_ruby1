class ChangeEmailOnUsers < ActiveRecord::Migration
  def change
    remove_column :users, :Email
    add_column :users, :email, :string
  end
end
