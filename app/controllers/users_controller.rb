class UsersController < ApplicationController
  before_action :authenticate_user!
  layout 'application'
  def after_sign_in_path_for(user)
    playlists_path
  end

  def mypage
    @user = User.find_by(:id => current_user.id)
    @follower_amount = Relationship.where(follower_id: current_user.id).count
    @followed_amount = Relationship.where(followed_id: current_user.id).count
    @my_playlists_amount = Playlist.where(user_id: current_user.id).count
  end

  def show
    @user = User.find_by(id: params[:id])
    @playlists = Playlist.where(user_id: params[:id])
    @status = Relationship.where(follower_id: current_user.id, followed_id: params[:id]).present?
    @follower_amount = Relationship.where(follower_id: params[:id]).count
    p @followed_amount = Relationship.where(followed_id: params[:id]).count
  end

  def my_playlists
    @playlists = Playlist.where(:user_id => current_user.id)
  end

  def my_favorites
    favorites = Favorite.where(user_id: current_user.id).pluck(:playlist_id)
    @playlists = Playlist.where(id: favorites)
    @playlist_user_ids = @playlists.pluck(:user_id)
    @user_name_array = Array.new
    @playlist_user_ids.each do |user_id|
      user_name = User.find(user_id).name
      @user_name_array << user_name
    end
  end

  def make_follow
    relationship = Relationship.new(follower_id: params[:follower_id], followed_id: params[:followed_id])
    relationship.save
    redirect_to :back
  end

  def delete_follow
    relationship = Relationship.find_by(follower_id: params[:follower_id], followed_id: params[:followed_id])
    relationship.destroy
    redirect_to :back
  end

  def my_follow
    relationships = Relationship.where(follower_id: current_user.id).pluck(:followed_id)
    @users = User.where(id: relationships)
  end

  def my_follower
    relationships = Relationship.where(:followed_id => current_user.id).pluck(:follower_id)
    @users = User.where(id: relationships)
  end

  def follow
    relationships = Relationship.where(:follower_id => params[:id]).pluck(:followed_id)
    @users = User.where(id: relationships)
  end

  def follower
    relationships = Relationship.where(:followed_id => params[:id]).pluck(:follower_id)
    @users = User.where(id: relationships)
  end

end
