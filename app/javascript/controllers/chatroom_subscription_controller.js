import { Controller } from "@hotwired/stimulus";
import { createConsumer } from "@rails/actioncable";

export default class extends Controller {
  static values = { chatroomId: Number, currentUserId: Number, initials: String };
  static targets = ["messages"];

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      {
        received: data => {
          this.insertMessageAndScrollDown(data);
        }
      }
    );
  }

  #buildMessageElement(currentUserIsSender, message, avatarUrl, userId) {
    const avatarImg = avatarUrl ? `<img src="${avatarUrl}" class="avatar-chatroom mt-2 me-2">` :
      `<div class="avatar avatar-placeholder mt-2 me-2">
        ${this.initialsValue}
      </div>`;
    const messageContent = currentUserIsSender ?
     `<div class="${this.userStyleClass(currentUserIsSender)} position-relative">${message}</div>`
    :  `${avatarImg}<div class="${this.userStyleClass(currentUserIsSender)} position-relative">${message}</div>`;

    return `
      <div class="message-row d-flex ${this.justifyClass(currentUserIsSender)} mb-4">
        ${messageContent}
      </div>
    `;
  }



  // Détermine la classe de justification en fonction de l'expéditeur
  justifyClass(currentUserIsSender) {
    return currentUserIsSender ? "justify-content-end" : "justify-content-start";
  }

  // Détermine la classe de style en fonction de l'expéditeur
  userStyleClass(currentUserIsSender) {
    return currentUserIsSender ? "sender-style" : "receiver-style";
  }

  // Insère le message dans le DOM et fait défiler jusqu'à lui
  insertMessageAndScrollDown(data) {
    const currentUserIsSender = this.currentUserIdValue === data.sender_id;
    const messageElement = this.#buildMessageElement(currentUserIsSender, data.message, data.avatar_url, data.sender_id);
    this.messagesTarget.insertAdjacentHTML("beforeend", messageElement);
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight);
  }


  resetForm(event) {
    event.target.reset();
  }

  disconnect() {
    this.channel.unsubscribe();
  }
}
