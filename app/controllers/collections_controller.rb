class CollectionsController < ApplicationController
  def index
    matching_collections = Collection.all

    @list_of_collections = matching_collections.order({ :created_at => :desc })

    render({ :template => "collections/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_collections = Collection.where({ :id => the_id })

    @the_collection = matching_collections.at(0)

    render({ :template => "collections/show.html.erb" })
  end

  def create
    the_collection = Collection.new
    the_collection.name = params.fetch("query_name")
    the_collection.user_id = params.fetch("query_user_id")

    if the_collection.valid?
      the_collection.save
      redirect_to("/collections", { :notice => "Collection created successfully." })
    else
      redirect_to("/collections", { :alert => the_collection.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_collection = Collection.where({ :id => the_id }).at(0)

    the_collection.name = params.fetch("query_name")
    the_collection.user_id = params.fetch("query_user_id")

    if the_collection.valid?
      the_collection.save
      redirect_to("/collections/#{the_collection.id}", { :notice => "Collection updated successfully."} )
    else
      redirect_to("/collections/#{the_collection.id}", { :alert => the_collection.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_collection = Collection.where({ :id => the_id }).at(0)

    the_collection.destroy

    redirect_to("/collections", { :notice => "Collection deleted successfully."} )
  end
end
