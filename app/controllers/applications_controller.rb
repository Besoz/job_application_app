class ApplicationsController < ApplicationController
  # GET /applications
  # GET /applications.json
  def index
    @applications = Application.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @applications }
    end
  end

  # GET /applications/1
  # GET /applications/1.json
  def show
    @application = Application.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @application }
    end
  end

  # GET /applications/new
  # GET /applications/new.json
  def new
    @application = Application.new
    puts params.to_json
    @job_id = params[:job_id]
    puts "ffffffffffffffffffffffffffffff"
    puts @job_id
    puts "ffffffffffffffffffffffffffffff"
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @application }
    end
  end

  # GET /applications/1/edit
  def edit
    @application = Application.find(params[:id])
  end

  # POST /applications
  # POST /applications.json
  def create
    #puts params.to_json
    #puts params["name_label"]
    applicant = Applicant.find_by_email(params["email_label"])
    #puts applicant.to_json
    if applicant == nil
      #applicant found add new appliccation to it
      applicant = Applicant.create(:name => params["name_label"], 
        :email => params["email_label"])
    end
    @application = Application.new(:cv =>params[:application][:cv], 
      :linkedin => params[:application][:linkedin], 
      :priority => params[:application][:priority], 
      :military_status => params[:application][:military_status], 
      :vacant_job_id => params[:application][:vacant_job_id], 
      :application_status => "1", 
      :applicant_id => applicant.id )

    respond_to do |format|
      if @application.save
        format.html { redirect_to @application, notice: 'Application was successfully created.' }
        format.json { render json: @application, status: :created, location: @application }
      else
        format.html { render action: "new" }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /applications/1
  # PUT /applications/1.json
  def update
    @application = Application.find(params[:id])

    respond_to do |format|
      if @application.update_attributes(params[:application])
        format.html { redirect_to @application, notice: 'Application was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applications/1
  # DELETE /applications/1.json
  def destroy
    @application = Application.find(params[:id])
    @application.destroy

    respond_to do |format|
      format.html { redirect_to applications_url }
      format.json { head :no_content }
    end
  end
end
