import { Controller } from "@hotwired/stimulus";
import { createConsumer } from "@rails/actioncable";

export default class extends Controller {
  static values = { chatroomId: Number };
  static targets = ["messages"];

  connect() {
    const currentUserId = this.messagesTarget.dataset.currentUserId;
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      {
        received: data => {
          this.insertMessageAndScrollDown(data, currentUserId);
        }
      }
    );
    console.log(`Subscribed to the chatroom with the id ${this.chatroomIdValue}.`);
  }

  insertMessageAndScrollDown(data, currentUserId) {
    const message = document.createElement('div')

    message.innerHTML = data
    this.messagesTarget.insertAdjacentElement('beforeend', message);

    console.log(message.firstChild.nextElementSibling.dataset.senderid === currentUserId)
    console.log(currentUserId)

    if (message.firstChild.nextElementSibling.dataset.senderid === currentUserId) {
      message.firstChild.nextElementSibling.classList.add('right-message');
      this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
    } else {
      message.firstChild.nextElementSibling.classList.remove('right-message');
      message.firstChild.nextElementSibling.classList.add('left-message');
      message.firstChild.nextElementSibling.classList.add('avatar');
      this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)

    }

  }


  resetForm(event) {
    event.target.reset()
  }

  disconnect() {
    console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
  }
}
