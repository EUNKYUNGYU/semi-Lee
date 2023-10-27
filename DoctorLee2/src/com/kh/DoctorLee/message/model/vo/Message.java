package com.kh.DoctorLee.message.model.vo;

public class Message {
	
	private int messageNo;
	private String sender;
	private String receiver;
	private String sendDate;
	private String messageContent;
	private String messageTitle;
	private String readStatus;
	private String status;
	private int senderNo;
	private int receiverNo;
	
	public Message() {
		super();
	}




	
	public Message(int messageNo, String sender, String receiver, String sendDate, String messageContent,
			String messageTitle, String readStatus, String status, int senderNo, int receiverNo) {
		super();
		this.messageNo = messageNo;
		this.sender = sender;
		this.receiver = receiver;
		this.sendDate = sendDate;
		this.messageContent = messageContent;
		this.messageTitle = messageTitle;
		this.readStatus = readStatus;
		this.status = status;
		this.senderNo = senderNo;
		this.receiverNo = receiverNo;
	}


	


	public int getSenderNo() {
		return senderNo;
	}





	public void setSenderNo(int senderNo) {
		this.senderNo = senderNo;
	}





	public int getReceiverNo() {
		return receiverNo;
	}


	public void setReceiverNo(int receiverNo) {
		this.receiverNo = receiverNo;
	}



	public String getMessageTitle() {
		return messageTitle;
	}

	public void setMessageTitle(String messageTitle) {
		this.messageTitle = messageTitle;
	}

	public int getMessageNo() {
		return messageNo;
	}

	public void setMessageNo(int messageNo) {
		this.messageNo = messageNo;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getSendDate() {
		return sendDate;
	}

	public void setSendDate(String sendDate) {
		this.sendDate = sendDate;
	}

	public String getMessageContent() {
		return messageContent;
	}

	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}

	public String getReadStatus() {
		return readStatus;
	}

	public void setReadStatus(String readStatus) {
		this.readStatus = readStatus;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}





	@Override
	public String toString() {
		return "Message [messageNo=" + messageNo + ", sender=" + sender + ", receiver=" + receiver + ", sendDate="
				+ sendDate + ", messageContent=" + messageContent + ", messageTitle=" + messageTitle + ", readStatus="
				+ readStatus + ", status=" + status + ", senderNo=" + senderNo + ", receiverNo=" + receiverNo + "]";
	}



	

	

}
