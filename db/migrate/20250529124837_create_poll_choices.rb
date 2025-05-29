class CreatePollChoices < ActiveRecord::Migration[8.0]
  def change
    create_table :poll_choices do |t|
      t.references :poll, null: false, foreign_key: true
      t.string :name
      t.string :identifier

      t.timestamps
    end
  end
end
