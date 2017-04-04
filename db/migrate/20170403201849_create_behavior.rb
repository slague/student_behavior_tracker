class CreateBehavior < ActiveRecord::Migration[5.0]
  def change
    create_table :behaviors do |t|
      t.string :keyword
    end
  end
end
