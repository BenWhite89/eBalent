class TalentProfilesController < ApplicationController
  before_action :set_talent_profile, only: [:show, :edit, :update, :destroy]
  skip_before_action :authorized, only: [:index, :show]


  def index
    if params[:talent_profile]
      @talent_profiles = TalentProfile.paginate(page: params[:page], per_page: 6)
        .has_skill(skill)
        .where(talent_profile_params)
        
    else
      @talent_profiles = TalentProfile.paginate(page: params[:page], per_page: 6)
    end

  end

  def show
  end

  def new
    @talent_profile = TalentProfile.new
  end

  def edit
  end

  def create
    @talent_profile = TalentProfile.new(talent_profile_params)

    respond_to do |format|
      if @talent_profile.save
        format.html { redirect_to @talent_profile, notice: 'Talent profile was successfully created.' }
        format.json { render :show, status: :created, location: @talent_profile }
      else
        format.html { render :new }
        format.json { render json: @talent_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @talent_profile.update(talent_profile_params)
        format.html { redirect_to @talent_profile, notice: 'Talent profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @talent_profile }
      else
        format.html { render :edit }
        format.json { render json: @talent_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @talent_profile.destroy
    respond_to do |format|
      format.html { redirect_to talent_profiles_url, notice: 'Talent profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_talent_profile
      @talent_profile = TalentProfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def talent_profile_params
      params.require(:talent_profile).permit(:location)
    end

    def skill
      params.require(:talent_profile)[:skill]
    end
end
