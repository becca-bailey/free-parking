class ReviewsController < ApplicationController

    def new
        @game = Game.find_by(id: params[:game_id])
        @review = Review.new
    end

    def create
        @game = Game.find_by(id: params[:game_id])
        @review = Review.new(review_params)
        @review.reviewer_id = current_user.id if current_user
        @review.game_id = @game.id if @game
        if @review.save
            redirect_to game_path(@game)
        else
            render 'new'
        end
    end

    def edit
        @game = Game.find_by(id: params[:game_id])
        @review = Review.find_by(id: params[:id])
    end

    def update
        @game = Game.find_by(id: params[:game_id])
        @review = Review.find_by(id: params[:id])
        @review.update(review_params)

        redirect_to game_path(@game)
    end

    def destroy
        @game = Game.find_by(id: params[:game_id])
        @review = Review.find_by(id: params[:id])
        @review.destroy

        redirect_to game_path(@game)
    end

    private

    def review_params
        params.require(:review).permit(:reviewer_id, :game_id, :content, :fun_rating, :difficulty_rating)
    end

end
