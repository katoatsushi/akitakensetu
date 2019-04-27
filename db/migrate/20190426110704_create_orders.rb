class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      #県内、県外,名古屋市内,名古屋市外
      t.string :work_place_range
      #行き先
      t.string :work_place
      #何日から
      t.date :start_date
      t.string :start_date_detail
      #何日まで
      t.date :finish_date
      t.string :finish_date_detail
      #積込作業
      t.boolean :loading_work
      #設置・交換・引き上げ
      t.string :work_type
      #車種
      t.string :car_type
      #備考
      t.text :attention
      #誰の依頼か?
      t.integer :user_id
      
      t.timestamps
    end
  end
end
