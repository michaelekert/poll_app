class CreatePolls < ActiveRecord::Migration[8.0]
  def change
    create_table :polls do |t|
      t.string :question
      t.string :email

      t.timestamps
    end
  end
end
