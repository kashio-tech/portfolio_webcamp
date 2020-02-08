class ApplicationController < ActionController::Base
		before_action 	:configure_permitted_parameters, if: :devise_controller?
		before_action	:search

	def after_sign_up_path_for(resource)
		case resource
		when Admin
		"/admin"#サインアップ後に移動するpath
		when User
		"/photos"#サインアップ後に移動するpath
		end
	end

	def after_sign_in_path_for(resource)
		case resource
		when Admin
		"/admin"#ログイン後に移動するpath
		when User
		"/photos"#ログイン後に移動するpath
		end
	end
	def after_sign_out_path_for(resource_or_scope)
		if resource_or_scope == :admin
      		new_admin_session_path	#ログアウト後に移動するpath
    	else
      		new_user_session_path
  		end
	end

	def search
		@search = Photo.ransack(params[:q])
		@photos = @search.result(distinct: true).order(id: "desc")
		if params[:q] != nil		#マイページ等のリンククリック時にindexへの移動を防止　ex)リンククリック時、params[:q] == nil
 			if params[:q][:title_or_caption_cont] != "" #検索ワード記入無し時に検索クリックでindexへの移動を防止　ex)空ワード検索時、params[:q][:title_or_caption_cont] == ""
 				render '/photos/index'
			end
		end
	end

	protected
	def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :display_name, :email])
  end
end
