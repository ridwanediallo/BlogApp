class LikesController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        @like = current_user.likes.new(author_id: current_user.id, post_id: @post.id)
        if @like.save
            flash[:success] = "Like saved successfully"
            redirect_to "/users/#{@post.author_id}/posts/#{@post.id}"
        else
            flash.now[:error] = "Error: Like could not be saved"
            redirect_to "/users/#{@post.author_id}/posts/#{@post.id}"
        end
    end
end
