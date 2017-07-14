class CollaboratorsController < ApplicationController
  def create
    @wiki = Wiki.find(params[:wiki_id])
    user = User.where(email: params[:email]).first

    # Check that user exists
    if user.nil?

    # check that there isn't already a collaboarto object for this user and wiki
    # check user isn't current user
    # all is well, create collaborato object for user and wiki
    elsif Collaborator.create(wiki: wiki, user: user)
      #polulate flash with success msg and
    else #error

    end
  end

  def destroy
  end

  def create
    @wiki = Wiki.find(params[:id])
    collaborator = User.find_by(email: params[:collaborator_email])

    if current_user.premium? || current_user.admin?
      @wiki.add_collaborator(collaborator)
      redirect_to @wiki
    end
  end

  def destroy
    @wiki = Wiki.find(params[:user_id])
    collaborator = User.find(params[:user_id])
    if current_user.premium? || current_user.admin?
      if @wiki.check_collaborator(collaborator)
        @wiki.remove_collaborator(collaborator)
      else
        flash.now[:alert] = "The user is not a collaborator."
      end
    end
    redirect_to @wiki
  end

  private

  def add_collaborator(collaborator)
    collabolators.create(user: collaborator)
  end

  def remove_collaborator(collaborator)
    collaborators.find_by(user: collaborator).destroy
  end

  def check_collaborator(collaborator)
    collaborators.where(user: collaborator).exists?
  end
end
