class ProblemsController < InheritedResources::Base
  skip_before_filter :verify_authenticity_token, :only => [:uuid,:uuid_show,:uuid_update]
  respond_to :json
  respond_to :js, :only => :create
  actions :all,except: [:index,:show,:edit,:update,:new,:destroy]

  def create
    @problem = Problem.new(params[:problem].merge(from: 'android'), as: :user)
    if @problem.save
      render :json => @problem.to_json, :status => :ok
    else
      render :json=> @problem.errors, :status=>422
    end
  end

  def uuid
    @problems = Problem.by_uuid(params[:uuid]).page params[:page]
    render json: @problems.to_json
  end

  def uuid_show
    @problem = Problem.by_uuid(params[:uuid]).find(params[:id])
    render json: @problem.as_json(type: :api_show)
  end

  def uuid_update
    @problem = Problem.by_uuid(params[:uuid]).find(params[:id])
    if @problem.update_attributes(params[:problem],as: :user)
      render :json => @problem.as_json(type: :api_show), :status => :ok
    else
      render :json=> @problem.errors, :status=>422
    end
  end

  def uuid_status
    @problem = Problem.uuid_status(params[:uuid]).first
    render json: {
      last_changed_at: @problem.try(:updated_at),
      last: @problem,
    }.to_json
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
