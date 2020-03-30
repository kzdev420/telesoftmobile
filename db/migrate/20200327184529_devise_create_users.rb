# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :first_name,         null: false, default: ""
      t.string :last_name,          null: false, default: ""
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :contact_number
      t.string :correspondence_address
      t.string :correspondence_city
      t.string :correspondence_state
      t.string :correspondence_pincode
      t.string :permanent_address
      t.string :permanent_city
      t.string :permanent_state
      t.string :permanent_pincode
      t.json :education
      t.json :experience
      t.json :certification
      t.string :current_ctc
      t.string :expected_ctc
      t.string :notice_period
      t.string :technical_skills
      t.string :skill_set
      t.string :responsibilities
      t.string :linkedin_url
      t.string :strengths
      t.string :weaknesses
      t.string :hobbies
      t.string :achievments
      t.string :professional_reference
      t.date :birthday
      t.boolean :gender
      t.integer :passport_ability
      t.string :passport_number
      t.string :language
      t.string :father_name
      t.string :mother_name
      t.string :blood_group

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
