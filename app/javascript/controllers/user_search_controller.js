// app/javascript/controllers/user_search_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["searchInput", "link", "hidden", "crown"];

  connect() {
    console.log(this.linkTarget.href);
  }

  search() {
    const query = this.searchInputTarget.value;

    if (query.length === 0) {
      document.getElementById('search-results').innerHTML = '';
      return;
    }

    const url = `${this.linkTarget.href}/?q=${query}`
    console.log(url)
    fetch(url, {
      headers: { "Accept": "application/json" }
    })
      .then(response => response.json())
      .then(users => {
        this.displaySearchResults(users);
      })
      .catch(error => {
        console.error('Error during search:', error);
      });
  }

  fill() {
    console.log("Hello");
    this.searchInputTarget.value = event.currentTarget.innerText
    this.hiddenTarget.value = event.currentTarget.dataset.id
  }

  displaySearchResults(users) {
    const searchResultsContainer = document.getElementById('search-results');

    searchResultsContainer.innerHTML = '';

    users.forEach(user => {
      console.log(user)
      const userElement = document.createElement('div');
      userElement.dataset.id = user.id
      userElement.dataset.action = "click->user-search#fill"
      userElement.textContent = `${user.first_name} ${user.last_name}`;
      searchResultsContainer.appendChild(userElement);

    });
  }

  planner() {
    console.log(event.currentTarget)
    this.crownTarget.toggle
  }

}
