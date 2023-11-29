

class UsersController < ApplicationController
  # ...

  def search
    query = params[:query]
    # Effectuez ici votre logique de recherche en fonction de la valeur de 'query'
    # Par exemple, recherchez des utilisateurs dont le prénom correspond à la requête

    users = User.where("first_name LIKE ?", "%#{query}%")

    # Renvoyez les résultats au format JSON
    render json: users
  end

  # ...
end
