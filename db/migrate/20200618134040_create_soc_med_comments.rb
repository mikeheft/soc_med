class CreateSocMedComments < ActiveRecord::Migration[6.0]
  def change
    create_table :soc_med_comments do |t|
      t.references :owner, null: false, polymorphic: true
      t.references :target, null: false, polymorphic: true
      t.text :content, null: false, default: ''
      t.integer :number_of_likes, default: 0, index: true

      t.timestamps
    end

    add_index :soc_med_comments, %i[owner_id owner_type target_id target_type], name: :idx_soc_med_comments_on_owner_and_target
  end
end
