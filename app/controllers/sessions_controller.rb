class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			#ユーザーをサインインさせ、showにリダイレクト
			sign_in user
			redirect_to user
		else
			#エラーメッセージを表示して、サインインを再表示
			flash.now[:error] = 'Invalid email/pasword combination'
			render 'new'
		end

	end

	def destroy
		sign_out
		redirect_to root_url
	end
end
