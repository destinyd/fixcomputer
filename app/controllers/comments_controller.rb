class CommentsController < InheritedResources::Base
  actions :all,except: [:index,:show,:edit,:update,:new,:destroy]
end
