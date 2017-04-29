class ArticlesController < ApplicationController
  
  
  def index
    @articles = Article.all
  end
  
  #Needed to make the page run
  #This creates a new instance of the class Article called article
  def new
    @article = Article.new
  end
  
  #This actually creates the article with data passed in your form fields
  #These form fields can be found in the new.html.erb file in the articles folder in views
  def create
    #render plain: params[:article].inspect #This line straight up shows the entry you submitted on the browser
    @article = Article.new(article_params) #This creates a new article with the parameters you passed thru the form
    #@article.save #This saves the new article to the database table
    #redirect_to article_path(@article) 
    
    if @article.save
      flash[:notice] = "Article was successfully created"
      redirect_to article_path(@article)
    #else is taken if the validations for article failed
    else
      render 'new'
    end
  end
  
  def show 
    @article = Article.find(params[:id])
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Article was sucessfully updated"
      redirect_to article_path(@article)
    
    #renders the edit template again if we failed
    else
      render 'edit'
    end
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "article was successfully deleted"
    redirect_to articles_path
  end
  
  private
  #This gets the article parameters from the form
    def article_params
      params.require(:article).permit(:title, :description)  
    end
end