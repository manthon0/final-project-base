class PositionsController < ApplicationController
  def index
    matching_positions = Position.all

    @list_of_positions = matching_positions.order({ :created_at => :desc })

    render({ :template => "positions/index.html.erb" })
  end
#get positions in a given collection to display on collection show page
#def collection_index
 # the_id = params.fetch("path_id")
 # matching_positions = Position.where({:collection_id => the_id})
 # @list_of_positions = matching_positions.order({ :created_at => :desc })
#end

  def show
    the_id = params.fetch("path_id")

    matching_positions = Position.where({ :id => the_id })

    @the_position = matching_positions.at(0)

    render({ :template => "positions/show.html.erb" })
  end

  def create
    the_position = Position.new
    the_position.board_state = params.fetch("query_board_state")
    the_position.best_move = params.fetch("query_best_move")
    the_position.evaluation = params.fetch("query_evaluation")
    the_position.whose_turn = params.fetch("query_whose_turn", false)
    the_position.notes = params.fetch("query_notes")
    the_position.stage = "https://fen2png.com/api/?fen=" + params.fetch("query_board_state").gsub(" ","%20") + "&raw=true"
    if the_position.valid?
      the_position.save
      redirect_to("/positions", { :notice => "Position created successfully." })
    else
      redirect_to("/positions", { :alert => the_position.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_position = Position.where({ :id => the_id }).at(0)

    the_position.board_state = params.fetch("query_board_state")
    the_position.best_move = params.fetch("query_best_move")
    the_position.evaluation = params.fetch("query_evaluation")
    the_position.whose_turn = params.fetch("query_whose_turn", false)
    the_position.notes = params.fetch("query_notes")

    if the_position.valid?
      the_position.save
      redirect_to("/positions/#{the_position.id}", { :notice => "Position updated successfully."} )
    else
      redirect_to("/positions/#{the_position.id}", { :alert => the_position.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_position = Position.where({ :id => the_id }).at(0)

    the_position.destroy

    redirect_to("/positions", { :notice => "Position deleted successfully."} )
  end
end
