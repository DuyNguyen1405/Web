class AddReferences < ActiveRecord::Migration
  def change
  	add_reference :comments, :user, index: true, foreign_key: true
  	add_reference :comments, :review, index: true, foreign_key: true
  	add_reference :reviews, :user, index: true, foreign_key: true
  	
  	add_reference :musics, :movie, index: true, foreign_key: true
  	add_reference :videos, :movie, index: true, foreign_key: true
  	add_reference :reviews, :movie, index: true, foreign_key: true
  end
end
