class AddSponsoredPostToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :topic_id, :integer
    add_index :topics, :topic_id
  end
end
