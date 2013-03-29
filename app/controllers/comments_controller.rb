class CommentsController < InheritedResources::Base
  respond_to :js, :only => :create
  actions :all,except: [:index,:show,:edit,:update,:new,:destroy]
end
