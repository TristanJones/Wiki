class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title, 			:null => false, :default => ""
      t.text :content
      t.string :created_by

      t.timestamps
    end
  end
end
