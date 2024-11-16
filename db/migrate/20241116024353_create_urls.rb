class CreateUrls < ActiveRecord::Migration[7.2]
  def change
    create_table :urls do |t|
      t.string :text
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
