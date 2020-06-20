class CreateTests < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.string :fileone
      t.string :filetwo

      t.timestamps
    end
  end
end
