class Admin::CommentsController < Admin::AdminController
  def destroy
    @comment = Comment.find_by(id: params[:id])
    @comment.destroy
    redirect_to admin_playlist_path(id: params[:playlist_id])
  end


end
