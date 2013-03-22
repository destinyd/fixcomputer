class PricesController < InheritedResources::Base
  actions :all,except: [:destroy,:new,:create,:show,:edit,:update]
  respond_to :json

  def collection
    @prices ||= end_of_association_chain.index
  end
end
