class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy, :start]
  before_action :has_players?, only: :start

  def start
    moder = (20/(4+@game.difficulty))
    werewolf_num = (@players.count/moder).ceil

    werewolfs = @players.shuffle[0..werewolf_num-1]
    villagers = @players - werewolfs
    werewolfs.each {|w| w.update(role: 'werewolf')}
    villagers.each {|w| w.update(role: 'villager')}
  end

  # GET /games
  # GET /games.json
  def index
    @games = Game.all
  end

  # GET /games/1
  # GET /games/1.json
  def show
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params)

    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:difficulty)
    end

    def has_players?
      @players = @game.players
      if @players.count < 5
        err = "You have #{@players.count}, You Need #{@players.count - 5} more."
        redirect_to new_game_player_path, :flash => { :error => err }
      end
    end
end
