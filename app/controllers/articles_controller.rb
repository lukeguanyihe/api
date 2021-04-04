class ArticlesController < ApplicationController
  skip_before_action :authorize!, only: [:index, :show]

  include Paginable

  def index
    paginated = paginate(Article.recent)
    render_collection(paginated)
  end

  def show
    article = Article.find(params[:id])
    render json: serializer.new(article)
  end
  
  # def create
  #   article = current_user.articles.build(article_params)
  #   article.save!
  #   render json: article, status: :created
  # rescue
  #   render json: article, adapter: :json_api,
  #     serializer: ErrorSerializer,
  #     status: :unprocessable_entity
  # end

  def serializer 
    ArticleSerializer 
  end

  private

  def article_params
    params.require(:data).require(:attributes).
      permit(:title, :content, :slug) ||
    ActionController::Parameters.new
  end

end
