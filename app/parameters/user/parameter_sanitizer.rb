class User::ParameterSanitizer < Devise::ParameterSanitizer	  
	def initialize(*)
		super
        # 新規登録時のパラメーター
		permit(:sign_up, keys: [:company_name, :first_name_kanji, :given_name_kanji, :first_name, :given_name, :phone_number_first, :phone_number_second , :phone_number_last])   
        # ユーザー情報アップデート時のパラメーター
        #permit(:sign_in, keys: [:first_name, :given_name, :phone_number_first, :phone_number_second , :phone_number_last])  
        permit(:sign_up, keys: [:company_name, :first_name_kanji, :given_name_kanji, :first_name, :given_name, :phone_number_first, :phone_number_second , :phone_number_last])  
	end
end