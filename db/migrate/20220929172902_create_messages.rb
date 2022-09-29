class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.integer :send_id
      t.integer :rec_id
      t.string :content

      t.timestamps
    end
  end
end
