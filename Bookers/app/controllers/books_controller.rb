class BooksController < ApplicationController

  def top
  end

  def index
    @book = Book.new
    # 新規投稿アクション(投稿したものはBookモデルになる)
    @books = Book.all
    # Bookモデルにあるデータを全て参照する
  end

  def new
    # @book = Book.new
    # 今回の課題では一覧表示内に新規投稿画面を併設しているので不要
  end

  def edit
    @book = Book.find(params[:id])
    # Bookモデルの":id"番のものを探す

  end

  def show
    @book = Book.find(params[:id])
    # Bookモデルの":id"番のものを探す(:idに割り振られた番号をもとに探してくる)

  end

  def create
    # 作成した記事を保存する役割
    book = Book.new(book_params)
    # この場合はbook_paramsによるチェックをクリアしたものに限る
    book.save
    # データベースに保存、:idが自動的に番号を与えられる
    redirect_to book_path(book.id)
    # 作成した記事の詳細画面に遷移する
      flash[:notice] = "Book was successfully created."
  end

  def update
    book = Book.find(params[:id])
    # Bookモデルの":id"番のものを探す
    book.update(book_params)
    # データベースに更新
    redirect_to book_path(book.id), notice: "Book was successfully updated."
    # 更新した記事の詳細画面に遷移する
  end

  def destroy
    book = Book.find(params[:id])
    # Bookモデルの":id"番のものを探す
    book.destroy
    # データベースから削除
    redirect_to books_path
    # 記事一覧に遷移する
    if book.destroy
      flash[:notice] = "Book was successfully destroyed."
    end


  end

  private
  # 最後の"end"に一番近いところに記述すること

  def book_params
    # 送られてきたデータが正しい形になっているか確認する役割
    params.require(:book).permit(:title, :body)
    # Bookモデルかどうか判断
    # カラムは上記2つを受け取る

  end

end
