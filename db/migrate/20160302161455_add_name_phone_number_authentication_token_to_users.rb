class AddNamePhoneNumberAuthenticationTokenToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :name, :string
  	add_column :users, :phone_number, :string
  	add_column :users, :authentication_token, :string
  end
end
