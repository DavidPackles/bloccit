class RenameFavoriteToFavorites < ActiveRecord::Migration
  def self.up
    rename_table :favorite, :favorites
  end
  def self.down
    rename_table :favorites, :favorite
  end

end
