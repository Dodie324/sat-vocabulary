class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.date :date
      t.string :word, null: false
      t.string :speech_type, null: false
      t.string :definition, null: false
      t.text :sentence, null: false

      t.timestamps
    end
  end
end
