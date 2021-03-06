class ReviewsController < ApplicationController
  # before_action :set_review, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /reviews
  # GET /reviews.json
  def index
    if params[:movie_id]!= nil
      @movie = Movie.find(params[:movie_id])
      @reviews = @movie.reviews
    else
      @movie = nil
      @reviews = Review.all
    end  
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
    @movie = Movie.find(@review.movie_id)
    @user = User.find(@review.user_id)
  end

  # GET /reviews/new
  def new
    if (!params[:movie_id])
      redirect_to root_path, notice: "Access denied"
    else
    @movie = Movie.find(params[:movie_id])
    end
  end

  # GET /reviews/1/edit
  def edit
    @movie = Movie.find(@review.movie_id)
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.build review_params
    @review.user = current_user

  
    respond_to do |format|
      if @review.save
        format.html { redirect_to @review, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update

    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:content, :add_at, :score, :user_id, :movie_id)
    end
end
