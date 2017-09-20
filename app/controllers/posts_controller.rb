class PostsController < ApplicationController
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_url, notice: 'Posted successfully'
    else
      redirect_to root_url, alert: 'Failed to post'
    end
  end

  def advanced_search
    @form = AdvancedSearchForm.new(permitted_params)
    @posts = @form.search
  end

  private
    def post_params
      params.require(:post).permit(:content)
    end

    def permitted_params
      params.permit(posts: AdvancedSearchForm::FORM_FIELDS)
    end
end
