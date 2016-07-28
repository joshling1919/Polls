class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.timestamps
      t.string :user_name, null: false, index: true
    end

    create_table :polls do |t|
      t.timestamps
      t.string :title, null: false, index: true
      t.integer :author_id, null: false, index: true
    end

    create_table :questions do |t|
      t.timestamps
      t.integer :poll_id, null: false, index: true
      t.string :question_text, null: false, index: true
    end

    create_table :answer_choices do |t|
      t.timestamps
      t.integer :question_id, null: false, index: true
      t.string :answer_text, null: false, index: true
    end

    create_table :responses do |t|
      t.timestamps
      t.integer :answer_choice_id, null: false, index: true
      t.integer :user_id, null: false, index: true
    end 

  end



end
