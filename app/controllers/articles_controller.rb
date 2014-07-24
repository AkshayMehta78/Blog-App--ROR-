class ArticlesController < ApplicationController
before_action :authenticate_user!, :only => [:new,:create,:edit,:destroy]
before_filter :require_permission, :only => [:edit,:destroy]
  def new 
	  @article = Article.new
    end

  def create
    @user = current_user.id
    @article = Article.new(article_params)
    @article.user_id=@user
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end
   
  
  def show
    @article = Article.find(params[:id])
  end
  
  def index 
    if params[:tag].present? 
      @articles = Article.tagged_with(params[:tag]).paginate(page: params[:page], per_page: 3)
    else 
      @articles =Article.paginate(page: params[:page], per_page: 3)
    end  
  end
  
  def edit
    @article = Article.find(params[:id])
  end

  def update
     @article = Article.find(params[:id])
     if @article.update(article_params)
        redirect_to @article
      else
        render 'edit'
      end
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  def require_permission
     @article = Article.find(params[:id])
      if current_user.id != @article.user_id
      flash[:notice] = "You cannot edit/delete this article"
      redirect_to articles_path 
      end
  end

  private
    def article_params
      params.require(:article).permit(:title, :text, :attachment,:tag_list)
    end
 
end
