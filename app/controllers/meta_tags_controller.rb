class MetaTagsController < ApplicationController
  before_filter :check_authentication, :check_authorization

  def index
    @meta_tags = MetaTag.paginate_and_sort(params[:page], params[:sort])
    return render :partial => 'metatags' if request.xhr?
  end

  def new
    @meta_tag = MetaTag.new

    respond_to do |format|
      format.html { render :layout => false}
      format.xml  { render :xml => @meta_tag }
    end
  end

  def edit
    @meta_tag = MetaTag.find(params[:id])
    respond_to do |format|
      format.html { render :layout => false }
    end
  end


  def create
    @meta_tag = MetaTag.new(params[:meta_tag])

    respond_to do |format|
      if @meta_tag.save
        flash[:notice] = 'MetaTag was successfully created.'
        format.html { redirect_to :action => :index }
      else
        format.html { render :action => "new" }
      end
    end
  end


  def update
    @meta_tag = MetaTag.find(params[:meta_tag][:id])

    respond_to do |format|
      if @meta_tag.update_attributes(params[:meta_tag])
        flash[:notice] = 'MetaTag was successfully updated.'
        format.html { redirect_to :action => :index }
      else
        format.html { render :action => "edit" }
      end
    end
  end


  def destroy
    @meta_tag = MetaTag.find(params[:id])
    @meta_tag.destroy

    respond_to do |format|
      format.html { redirect_to :action => :index }
      format.xml  { head :ok }
    end
  end
end

