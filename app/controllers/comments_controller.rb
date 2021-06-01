class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_comment, only: [:edit, :update, :show, :destroy]
    before_action :set_trip

    def new
        @comment = Comment.new
    end

    def create
        @comment = @trip.comments.create(params[:comment].permit(:reply, :trip_id))
        @comment.user_id = current_user.id

        respond_to do |format|
            if @comment.save
                format.html { redirect_to trip_path(@trip) }
                format.js #render create.js.erb
            else
                format.html { redirect_to trip_path(@trip), notice: "Your comment did not save. Try again" }
                format.js
            end
        end
    end

    def destroy
        @comment = @trip.comments.find(params[:id])
        @comment.destroy
        redirect_to trip_path(@trip)
    end

    private

    def set_trip
        @trip = Trip.friendly.find(params[:trip_id])
    end

    def set_comment
        @comment = Comment.find(params[:id])
    end

    def comment_params
        params.require(:comment).permit(:reply)
    end

end
