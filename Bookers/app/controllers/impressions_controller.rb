class ImpressionsController < ApplicationController
  def top
  end

  def index
    @post = Post.new
    # 新規投稿アクション(投稿したものはPostモデルになる)
    @posts = Post.all
    # Postモデルにあるデータを全て参照する
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
    # Postモデルの":id"番のものを探す

  end

  def show
    @post = Post.find(params[:id])
    # Postモデルの":id"番のものを探す(:idは記事ごとに自動取得)

  end

  def create
    # 作成した記事を保存する役割
    post = Post.new(post_params)
    # この場合はpost_paramsによるチェックをクリアしたものに限る
    post.save
    # データベースに保存、:idが自動的に番号を与えられる
    redirect_to post_path(post.id)
    # 作成した記事の詳細画面に遷移する
  end

  def update
    post = Post.find(params[:id])
    # Postモデルの":id"番のものを探す
    post.update(post_params)
    # データベースに更新
    redirect_to post_path(post.id)
    # 更新した記事の詳細画面に遷移する
  end

  def destroy
    post = Post.find(params[:id])
    # Postモデルの":id"番のものを探す
    post.destroy
    # データベースから削除
    redirect_to posts_path
    # 記事一覧に遷移する

  end

  private

  def post_params
    # 送られてきたデータが正しい形になっているか確認する役割
    params.require(:post).permit(:title, :body)
    # Postモデルかどうか判断
    # カラムは上記2つを受け取る

  end

end
