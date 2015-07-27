require 'spec_helper'

describe PlaylistsController do
  before(:all) do
    @playlist = create(:playlist)
  end

=begin
  let(:playlist) do
    create(:playlist)
  end
=end

  before do
    @current_user = User.first
    allow(controller)
    .to receive(:current_user)
    .and_return(@current_user)
  end

  describe 'GET #top_page' do
  end

  describe 'GET #index' do
    # playistを配列で返す
    it "populates array of playlists" do
      get :index
      expect(assigns(:playlists)).to eq [@playlist]
    end
    # :indexテンプレートを表示すること
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    # params[:id]がある場合
    context 'with params[:id]' do
      # @contactに要求された連作先を割り当てること
      it 'assigns the requested contact to @contact' do
        get :show, id: @playlist
        expect(assigns(:playlist)).to eq @playlist
      end
      # :showテンプレートを表示すること
      it "renders the :show template" do
        get :show, id: @playlist
        expect(response).to render_template :show
      end
    end
=begin
    # params[:id]がない場合
    context 'without params[:id]' do
      it "doesn't make details of a playlist" do
        get :show, id: nil
        expect(assigns(:playlist)).to_not eq @playlist
      end
    end
=end
  end

  describe 'GET #new' do
    # @playlistに新しいプレイリストを割り当てる
    it "assigns a new Playlist to @playlist" do
      get :new
      expect(assigns(:playlist)).to be_a_new(Playlist)
    end
    # :newテンプレートを表示する
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    # 有効な属性の場合
    context "with valid attributes" do
      # データベースに新しいplaylistを保存すること
      it "saves the new playlist in the database" do
        expect{
          post :create, playlist: attributes_for(:playlist)
        }.to change(Playlist, :count).by(1)
      end
      # playlist#indexにリダイレクトすること
      it "redirects to playlist#index" do
        post :create, playlist: attributes_for(:playlist)
        expect(response).to redirect_to(playlists_path)
      end
    end

    # 無効な属性の場合
    context "with invalid attributes" do
      # データベースに新しいplaylistを保存しないこと
      it "does not save the new playlist in the database" do
        expect{
          post :create, playlist: attributes_for(:invalid_playlist)
        }.to_not change(Playlist, :count).by(1)
      end
      # :newテンプレートを再表示すること
      it "re-renders the :new template" do
        post :create, playlist: attributes_for(:invalid_playlist)
        expect(response).to render_template :new
      end
    end
  end

  describe 'GET #edit' do
  end

  describe 'PATCH #update' do
=begin
    before :each do
      @playlist = create(:playlist, title: "jazz", user_id: 1, comment: "jajaja", genre: 2, count_fav: 5)
    end
=end
    # 有効な属性の場合
    context "with valid attributes" do
      # データベースのplaylistを更新すること
      it "updates the playlist in the database" do
        patch :update, id: @playlist, playlist: attributes_for(:playlist)
        expect(assigns(:playlist)).to eq @playlist
      end
      # playlist#showテンプレートを表示すること
      it "renders the :show template" do
        patch :update, id: @playlist, playlist: attributes_for(:playlist)
        expect(response).to redirect_to @playlist
      end
    end

    # 無効な属性の場合
    context "with invalid attributes" do
      # playlistを更新しないこと
      it "does not update the playlist" do
        patch :update, id: @playlist, playlist: attributes_for(:invalid_playlist)
        expect(assigns(:playlist)).to_not eq [@playlist]
      end
      # :editテンプレートを再表示すること
      it "re-renders the :edit template" do
        patch :update, id: @playlist, playlist: attributes_for(:invalid_playlist)
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    # データベースからplaylistを削除すること
    it "deletes the playlist from the database" do
      expect{
        delete :destroy, id: @playlist
      }.to change(Playlist, :count).by(-1)
    end
    # playlist#indexにリダイレクトすること
    it "redirects to playlist#index" do
      delete :destroy, id: @playlist
      expect(response).to redirect_to playlists_path
    end
  end

  describe 'GET #timeline' do
    before :each do
      @user = create(:user, id: 3)
      @playlist = create(:playlist, user_id: 3)
      @relationship = create(:relationship, follower_id: @current_user.id, followed_id: 3)
    end

    # playlistを配列で返す
    it "populates array of playlists" do
      get :timeline
      expect(assigns(:playlists)).to eq [@playlist]
    end
    # :timelineテンプレートを表示すること
    it "renders the :timeline template" do
      get :timeline
      expect(response).to render_template :timeline
    end
  end

  describe 'GET #genre' do
  end

  describe 'GET #each_genre' do
  end

  describe 'GET #ranking' do
  end

  describe 'private' do
  end
end
