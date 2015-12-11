class CreateLikePros < ActiveRecord::Migration
  def change
    create_table :like_pros do |t|
      t.references :micropot, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
