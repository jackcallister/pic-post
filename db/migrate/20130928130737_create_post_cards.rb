class CreatePostCards < ActiveRecord::Migration
  def change
    create_table :post_cards do |t|
      t.string :name
      t.text   :message
      t.string :picture

      t.string :address_line1
      t.string :address_line2
      t.string :city
      t.string :state
      t.string :zip
      t.string :country

      t.string :address_id
      t.string :job_id

      t.boolean :paid, default: false

      t.timestamps
    end
  end
end
