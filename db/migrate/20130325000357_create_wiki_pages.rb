class CreateWikiPages < ActiveRecord::Migration
  def self.up
    create_table :wiki_pages do |t|
      t.string :title
      t.text :content
      t.string :created_by
      t.datetime :creation_date

      t.timestamps
    end
  end
  def self.down
    drop_table :wiki_pages
  end
end
