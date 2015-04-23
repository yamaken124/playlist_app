class Admin::UsersController < Admin::AdminController
  def index
    @users = User.all
    user_ids = @users.pluck(:id)
    id_amount = user_ids.count
    id_amount
    @follower_amount_array = Array.new
    @followed_amount_array = Array.new
    for i in 1..id_amount do
      @follower_amount_array << Relationship.where(follower_id: user_ids[i]).count
      @followed_amount_array << Relationship.where(followed_id: user_ids[i]).count
      i += 1
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    @playlists = Playlist.where(user_id: params[:id])
    @follower_amount = Relationship.where(follower_id: params[:id]).count
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    redirect_to admin_users_path
  end
end
