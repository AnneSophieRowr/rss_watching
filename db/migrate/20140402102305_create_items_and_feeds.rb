class CreateItemsAndFeeds < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string    :title,         null: false
      t.string    :link,          null: false
      t.text      :description,   null: false
      t.datetime  :date,          null: false
      t.integer   :user_id,       null: false
    end

    create_table :feeds do |t|
      t.string  :name, null: false
    end

    create_table :feeds_items do |t|
      t.belongs_to :item
      t.belongs_to :feed
    end
  end
end
