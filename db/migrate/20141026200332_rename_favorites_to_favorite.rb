class RenameFavoritesToFavorite < ActiveRecord::Migration
  def self.up
    rename_table :favorites, :favorite 
  end
  def self.down
    rename_table :favorite, :favorites 
  end
end
