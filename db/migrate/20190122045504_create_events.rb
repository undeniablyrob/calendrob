class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :uuid
      t.datetime :start_time
      t.datetime :end_time
      t.integer :duration
      t.datetime :created_at
      t.string :location
      t.boolean :canceled
      t.string :canceler_name
      t.string :cancel_reason
      t.datetime :canceled_at
    end
  end
end
