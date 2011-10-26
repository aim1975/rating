#encoding: utf-8

class FirmsController < ApplicationController
  # GET /firms
  # GET /firms.json
  def index
    @firms = Firm.all
    @firm = Firm.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @firms }
    end
  end

  # GET /firms/1
  # GET /firms/1.json
  def show
    @firm = Firm.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @firm }
    end
  end

  # GET /firms/new
  # GET /firms/new.json
  def new
    @firm = Firm.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @firms }
    end

  end

  # GET /firms/1/edit
  def edit
    @firm = Firm.find(params[:id])
  end

  # POST /firms
  # POST /firms.json
  def create
    @firm = Firm.new(params[:firm])

    respond_to do |format|
      if @firm.save
        #format.html { redirect_to @firm, notice: 'Хуясе, новую фирму добавили в натуре' }
        #format.json { render json: @firm, status: :created, location: @firm }
        format.html { redirect_to firms_url }
        format.js
        #format.json { head :ok }
      else
        format.html { render action: "new" }
        format.json { render json: @firm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /firms/1
  # PUT /firms/1.json
  def update
    @firm = Firm.find(params[:id])

    respond_to do |format|
      if @firm.update_attributes(params[:firm])
        @recommend = Recommendation.new()
        @recommend.rating = params[:rating]
        @firm.Recommendations << @recommend
        if @recommend.save
          format.html { redirect_to @firm, notice: '' }
          format.json { head :ok }
        end
      else
        format.html { render action: "edit" }
        format.json { render json: @firm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /firms/1
  # DELETE /firms/1.json
  def destroy
    @firm = Firm.find(params[:id])
    @nametodel = @firm.name
    @firm.destroy

    respond_to do |format|
      format.html { redirect_to firms_url }
      format.js
    end

  end
end
