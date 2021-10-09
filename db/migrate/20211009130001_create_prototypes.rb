class CreatePrototypes < ActiveRecord::Migration[6.0]
  def change
    create_table :prototypes do |t|
      t.string     :title,      null: false, default: ""
      t.text       :catch_copy, null: false
      t.text       :concpt,     null: false
      t.references :user,       null: false, foreign_key: true

      t.timestamps
    end
  end
end
