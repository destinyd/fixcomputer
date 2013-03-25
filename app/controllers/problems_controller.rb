class ProblemsController < InheritedResources::Base
skip_before_filter :verify_authenticity_token, :only => [:uuid,:uuid_show,:uuid_update]
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

  def uuid_show
    @problem = Problem.by_uuid(params[:uuid]).find(params[:id])
    render json: @problem.as_json(type: :api_show)
  end

  def uuid_update
    p params.inspect
    @problem = Problem.by_uuid(params[:uuid]).find(params[:id])
    if @problem.update_attributes params[:problem]
      render :json => @problem.as_json(type: :api_show), :status => :ok
    else
      render :json=> @problem.errors, :status=>422
    end
  end
end
