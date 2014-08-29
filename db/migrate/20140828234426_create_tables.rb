class CreateTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :name
    	t.string :email
    	t.string :password_digest
    	t.timestamps
    end

    create_table :photos do |t|
    	t.belongs_to :user
    	t.attachment :avatar
    	t.timestamps
    end

    create_table :tags do |t|
    	t.string :name
    	t.timestamps
    end

    create_table :photos_tags do |t|
    	t.integer :photo_id
    	t.integer :tag_id
    	t.timestamps
    end
  end
end
