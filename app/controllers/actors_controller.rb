class ActorsController < ApplicationController
  def index
    @q = Actor.ransack(params[:q])
    @actors = @q.result(:distinct => true).page(params[:page]).per(10)

    render("actors/index.html.erb")
  end

  def show
    @actor = Actor.find(params[:id])

    render("actors/show.html.erb")
  end

  def new
    @actor = Actor.new

    render("actors/new.html.erb")
  end

  def create
    @actor = Actor.new

    @actor.bio = params[:bio]
    @actor.trivia = params[:trivia]

    save_status = @actor.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/actors/new", "/create_actor"
        redirect_to("/actors")
      else
        redirect_back(:fallback_location => "/", :notice => "Actor created successfully.")
      end
    else
      render("actors/new.html.erb")
    end
  end

  def edit
    @actor = Actor.find(params[:id])

    render("actors/edit.html.erb")
  end

  def update
    @actor = Actor.find(params[:id])

    @actor.bio = params[:bio]
    @actor.trivia = params[:trivia]

    save_status = @actor.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/actors/#{@actor.id}/edit", "/update_actor"
        redirect_to("/actors/#{@actor.id}", :notice => "Actor updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Actor updated successfully.")
      end
    else
      render("actors/edit.html.erb")
    end
  end

  def destroy
    @actor = Actor.find(params[:id])

    @actor.destroy

    if URI(request.referer).path == "/actors/#{@actor.id}"
      redirect_to("/", :notice => "Actor deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Actor deleted.")
    end
  end
end
