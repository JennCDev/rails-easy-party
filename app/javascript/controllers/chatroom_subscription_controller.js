import { Controller } from "@hotwired/stimulus";
import { createConsumer } from "@rails/actioncable";

export default class extends Controller {
  static values = { chatroomId: Number, currentUserId: Number };
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

  #buildMessageElement(currentUserIsSender, message, avatarUrl) {
    // Si l'utilisateur actuel est le destinataire, ajoutez l'avatar
    let avatarImg = '';
    if (!currentUserIsSender && avatarUrl) {
      avatarImg = `<img src="${avatarUrl}" class="avatar">`;
    }

    // Combine l'avatar et le message dans une seule div
    const messageClass = this.userStyleClass(currentUserIsSender);
    const combinedContent = `${avatarImg}<p>${message}</p>`;
    const messageDiv = `<div class="${messageClass}">${combinedContent}</div>`;
    const messageRow = `  ${this.justifyClass(currentUserIsSender)}">${messageDiv}</div>`;

    return messageRow;
  }


  // Détermine la classe de justification en fonction de l'expéditeur
  justifyClass(currentUserIsSender) {
    return currentUserIsSender ? "justify-content-end" : "justify-content-start";
  }

  // Détermine la classe de style en fonction de l'expéditeur
  userStyleClass(currentUserIsSender) {
    return currentUserIsSender ? "sender-style" : "receiver-style";
  }

  insertMessageAndScrollDown(data) {
    const currentUserIsSender = this.currentUserIdValue === data.sender_id;
    const messageElement = this.#buildMessageElement(currentUserIsSender, data.message, data.avatar_url);
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
