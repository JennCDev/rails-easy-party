// app/javascript/controllers/user_search_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["searchInput", "link"];

  connect() {
    console.log(this.linkTarget.href);
  }

  search() {
    const query = this.searchInputTarget.value;

    fetch(this.linkTarget.href, {
      headers: { "Accept": "application/json" }
    })
      .then(response => response.json())
      .then(users => {
        console.log(users)
        // this.displaySearchResults(users);
      })
      .catch(error => {
        console.error('Error during search:', error);
      });
  }

  displaySearchResults(users) {
    const searchResultsContainer = document.getElementById('search-results');

    searchResultsContainer.innerHTML = '';

    users.forEach(user => {
      const userElement = document.createElement('div');
      userElement.textContent = user.name;
      searchResultsContainer.appendChild(userElement);
    });
  }
}
