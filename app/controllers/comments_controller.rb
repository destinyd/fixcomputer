class CommentsController < InheritedResources::Base
  respond_to :js, :only => :create
  actions :all,except: [:index,:show,:edit,:update,:new,:destroy]

  def create
    create! do |format|
      format.html{ redirect_to root_url}
      format.js
    end
  end
end
