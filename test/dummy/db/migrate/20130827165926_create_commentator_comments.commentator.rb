# This migration comes from commentator (originally 20130827134616)
class CreateCommentatorComments < ActiveRecord::Migration
  def change
    create_table :commentator_comments do |t|
      t.references :commentable, polymorphic: true
      t.references :owner
      t.references :parent
      t.text :body
      t.timestamps
    end
  end
end
