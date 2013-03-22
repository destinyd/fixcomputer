class ProblemsController < InheritedResources::Base
  respond_to :json
  def create
    @problem = Problem.new(params[:problem])
    if @problem.save
      render :json => @problem.to_json, :status => :ok
    else
      render :json=> @problem.errors, :status=>422
    end
  end

  def uuid
    @problems = Problem.by_uuid params[:uuid]
    render json: @problems.to_json
  end
end
