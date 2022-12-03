class CollectionPositionsController < ApplicationController
  def index
    matching_collection_positions = CollectionPosition.all

    @list_of_collection_positions = matching_collection_positions.order({ :created_at => :desc })

    render({ :template => "collection_positions/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_collection_positions = CollectionPosition.where({ :id => the_id })

    @the_collection_position = matching_collection_positions.at(0)

    render({ :template => "collection_positions/show.html.erb" })
  end

  def create
    the_collection_position = CollectionPosition.new
    the_collection_position.collection_id = params.fetch("query_collection_id")
    the_collection_position.position_id = params.fetch("query_position_id")

    if the_collection_position.valid?
      the_collection_position.save
      redirect_to("/collection_positions", { :notice => "Collection position created successfully." })
    else
      redirect_to("/collection_positions", { :alert => the_collection_position.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_collection_position = CollectionPosition.where({ :id => the_id }).at(0)

    the_collection_position.collection_id = params.fetch("query_collection_id")
    the_collection_position.position_id = params.fetch("query_position_id")

    if the_collection_position.valid?
      the_collection_position.save
      redirect_to("/collection_positions/#{the_collection_position.id}", { :notice => "Collection position updated successfully."} )
    else
      redirect_to("/collection_positions/#{the_collection_position.id}", { :alert => the_collection_position.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_collection_position = CollectionPosition.where({ :id => the_id }).at(0)

    the_collection_position.destroy

    redirect_to("/collection_positions", { :notice => "Collection position deleted successfully."} )
  end
end
