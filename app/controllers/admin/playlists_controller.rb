class Admin::PlaylistsController < Admin::AdminController
  def index
    @playlists = Playlist.all.order("updated_at DESC")
    @playlist_user_ids = @playlists.pluck(:user_id)
    @user_name_array = Array.new
    @playlist_user_ids.each do |user_id|
      user_name = User.find(user_id).name
      @user_name_array << user_name
    end
  end

  def show
    @playlist = Playlist.find(params[:id])
    @user = User.find(@playlist.user_id)
    @comments = Comment.where(playlist_id: params[:id])
    @comment_user_ids = @comments.pluck(:user_id)
    ## @user_ids をわかりやすい命名に
    ### 変数多い
    #viewで使わない変数は＠をつけない
    @user_name_array = Array.new
    @comment_user_ids.each do |user_id|
      user_name = User.find(user_id).name
      @user_name_array << user_name
    end
    #インスタンスメソッドとレシーバを意識して、ここのメソッドを修正
    @musics = Music.where(playlist_id: params[:id])
    music = Music.new(playlist_id: params[:id])
    @http = music.http
  end

  def destroy
    @playlist = Playlist.find_by(id: params[:id])
    @playlist.destroy
    redirect_to admin_playlists_path
  end



end
