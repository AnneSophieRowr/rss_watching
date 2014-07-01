class ChangeLinkName < ActiveRecord::Migration
  def change
    rename_column :items, :link, :article_link
  end
end
