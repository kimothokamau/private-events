class EventtsController < ApplicationController
  before_action :set_eventt, only: %i[ show edit update destroy ]

  # GET /eventts or /eventts.json
  def index
    @eventts = Eventt.all
  end

  # GET /eventts/1 or /eventts/1.json
  def show
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
    @eventt = Eventt.new(eventt_params)

    respond_to do |format|
      if @eventt.save
        format.html { redirect_to @eventt, notice: "Eventt was successfully created." }
        format.json { render :show, status: :created, location: @eventt }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @eventt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /eventts/1 or /eventts/1.json
  def update
    respond_to do |format|
      if @eventt.update(eventt_params)
        format.html { redirect_to @eventt, notice: "Eventt was successfully updated." }
        format.json { render :show, status: :ok, location: @eventt }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @eventt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eventts/1 or /eventts/1.json
  def destroy
    @eventt.destroy
    respond_to do |format|
      format.html { redirect_to eventts_url, notice: "Eventt was successfully destroyed." }
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
