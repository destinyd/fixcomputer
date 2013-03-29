class Admin::ProblemsController < InheritedResources::Base
  skip_before_filter :verify_authenticity_token
  respond_to :json
  def show
    @problem = Problem.find(params[:id])
    render :json => @problem.as_json(type: :api_show), :status => :ok
  end

  def update
    @problem = Problem.find(params[:id])
    if @problem.update_attributes params[:problem]
      render :json => @problem.as_json(type: :api_show), :status => :ok
    else
      render :json=> @problem.errors, :status=>422
    end
  end

  def create
    @problem = Problem.new(params[:problem])
    if @problem.save
      render :json => @problem.to_json, :status => :ok
    else
      render :json=> @problem.errors, :status=>422
    end
  end

  def status
    @problem = Problem.recent.first
    render json: {
      last_changed_at: @problem.try(:created_at),
      last: @problem,
    }.to_json
  end

  protected
  def collection
    @problems = collection ||= end_of_association_chain.recent.page(params[:page])
  end

end

