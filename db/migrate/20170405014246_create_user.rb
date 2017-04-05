class CreateUser < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
    t.string :username
    t.string :password_digest
    t.string :password_confirmation
    end
  end
end
