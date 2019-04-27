class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :authentication_keys => [:first_name, :given_name]
  has_many :orders
   # ログイン認証
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    login = conditions.delete(:login)
    if login
      #where(conditions).where(["lower(email) = lower(:email) AND group_id = :group_id", { :email => email, :group_id => group_id }]).first
      where(conditions).where(["first_name = :first_name AND given_name = :given_name", { :first_name => first_name, :given_name => given_name }]).first
    else
      where(conditions).first
    end
  end

    # 登録時に email を不要にする
  def email_required?
    false
  end
  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end
end
