class EventtsController < ApplicationController
  include EventtsHelper

  before_action :set_eventt, only: %i[ show edit update destroy ]
  before_action :signed_in_only!, only: [:index]

  # GET /eventts or /eventts.json
  def index
    @upcoming_eventts = Eventt.upcoming
    @prev_eventts = Eventt.previous
  end

  # GET /eventts/1 or /eventts/1.json
  def show
    @eventt = Eventt.find(params[:id])
    @attendees = @eventt.attendees
  end

  # GET /eventts/new
  def new
    @eventt = Eventt.new
  end

  # GET /eventts/1/edit
  def edit
  end

  # POST /eventts or /eventts.json
  def create
    @eventt = current_user.eventts.build(eventt_params)
    respond_to do |format|
      if @eventt.save && !current_user.nil?
        format.html { redirect_to root_path, notice: 'Eventt was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @eventt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /eventts/1 or /eventts/1.json
  def update
    respond_to do |format|
      if @eventt.update(eventt_params) && !current_user.nil?
        format.html { redirect_to @event, notice: 'Eventt was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @eventt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eventts/1 or /eventts/1.json
  def destroy
    @eventt.destroy
    respond_to do |format|
      format.html { redirect_to user_path(current_user), notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_eventt
      @eventt = Eventt.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def eventt_params
      params.require(:eventt).permit(:description, :title, :creator_id)
    end
end
