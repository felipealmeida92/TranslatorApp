class CreateTranslations < ActiveRecord::Migration[7.1]
  def change
    create_table :translations do |t|
      t.text :original_text
      t.string :source_lang
      t.text :translated_text
      t.string :target_lang

      t.timestamps
    end
  end
end
