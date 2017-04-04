class CreateObservation < ActiveRecord::Migration[5.0]
  def change
    create_table :observations do |t|
      t.date    :date
      t.time    :time
      t.integer :duration
      t.string  :location
      t.string  :logged_by
      t.string  :comments
    end
  end
end
