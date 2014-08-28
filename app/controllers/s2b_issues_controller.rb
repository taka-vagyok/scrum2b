class S2bIssuesController < ProjectController

  #before_filter :check_before, :only => [:index]
  before_filter :get_members, :only => [:index]
  before_filter lambda { check_permission(:edit) }, :only => [:index]
  before_filter lambda { check_permission(:view) }, :only => [:index]
  
  
  def index
    
  end

  def get_data
    @versions =  opened_versions_list
    @issues = opened_versions_list.first.fixed_issues # <- not too useful
    logger.info "LIST version #{@versions}"
    render :json => {:versions => @versions, :issues => @issues}
  end
  
  def get_issues_version
    version = Version.find(params[:version_id])
    @issues = version.fixed_issues # <- not too useful
    logger.info "LIST ISSUES  #{@issues}"
    render :json => {:issues => @issues}
  end
end
