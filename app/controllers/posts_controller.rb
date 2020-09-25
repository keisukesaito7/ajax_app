class PostsController < ApplicationController

  def index
    @posts = Post.all.order(id: "DESC")
  end

  def create
    Post.create(content: params[:content])
    redirect_to action: :index
  end

  def checked
    post = Post.find(params[:id])
    # 既読▶︎未読、未読▶︎既読
    if post.checked
      post.update(checked: false)
    else
      post.update(checked: true)
    end
    # 更新されたデータを取得▶︎checked.jsへ送信
    item = Post.find(params[:id])
    render json: { post: item }
  end

end
