class PlayersController < ApplicationController
  before_action :set_game
  before_action :set_player, only: [:show, :edit, :update, :destroy]

  # GET /players
  # GET /players.json
  def start_game
    difficulity_level = params[:difficulity_level]
    werewolf_num = (@game.players.count/difficulity_level).ceil
    binding.pry
  end

  def index
    @players = @game.players
  end

  def kill_player
    @players = @game.players
  end

  def select_player
    @players = @game.players
  end

  # GET /players/1
  # GET /players/1.json
  def show
  end

  # GET /players/new
  def new
    @player = Player.new(game: @game)
    @roles = @player.roles
  end

  # GET /players/1/edit
  def edit
    @roles = @player.roles
  end

  # POST /players
  # POST /players.json
  def create
    @player = Player.new(player_params)
    @player.game = @game

    respond_to do |format|
      if @player.save
        format.html { redirect_to game_player_path(id: @player.id), notice: 'Player was successfully created.' }
        format.json { render :show, status: :created, location: @player }
      else
        format.html { render :new }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /players/1
  # PATCH/PUT /players/1.json
  def update
    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to game_player_path(id: @player.id), notice: 'Player was successfully updated.' }
        format.json { render :show, status: :ok, location: @player }
      else
        format.html { render :edit }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1
  # DELETE /players/1.json
  def destroy
    @player.destroy
    respond_to do |format|
      format.html { redirect_to game_players_path, notice: 'Player was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
      if @player.game != @game
        redirect_to game_players_path, alert: "Player #{params[:id]} does not belong to Game #{@game.id}."
      end
    end

    def set_game
      @game = Game.find(params[:game_id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "Game #{params[:game_id]} does not exist"
      redirect_to games_path
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_params
      params.require(:player).permit(:game_id, :firstname, :lastname, :position)
    end
end
