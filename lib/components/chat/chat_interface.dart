import 'package:flutter/material.dart';
import 'package:rn_connected/components/chat/user_model.dart';

class ChatInterface extends StatefulWidget {
  final User user;

  ChatInterface({required this.user});

  @override
  _ChatInterfaceState createState() => _ChatInterfaceState();
}

class _ChatInterfaceState extends State<ChatInterface> {
  final TextEditingController _messageController = TextEditingController();
  List<ChatMessage> _messages = []; // List to store chat messages

  // Function to send a message
  void _sendMessage(String messageText) {
    setState(() {
      final message = ChatMessage(
        text: messageText,
        isUser: true, // Assuming the user is the sender
      );
      _messages.add(message);
      _messageController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user.name),
        actions: [
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: () {
              // Handle video call
            },
          ),
          IconButton(
            icon: Icon(Icons.phone),
            onPressed: () {
              // Handle audio call
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return ChatBubble(
                  message: message,
                );
              },
            ),
          ),
          _buildMessageInputField(),
        ],
      ),
    );
  }

  // Function to build the message input field
  Widget _buildMessageInputField() {
    return Container(
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: 'Type your message...',
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              final messageText = _messageController.text;
              if (messageText.isNotEmpty) {
                _sendMessage(messageText);
              }
            },
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final ChatMessage message;

  ChatBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    // You can customize the appearance of chat bubbles based on the sender (user or other user).
    return Align(
      alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: message.isUser ? Colors.blue : Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          message.text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class ChatMessage {
  final String text;
  final bool isUser;

  ChatMessage({
    required this.text,
    required this.isUser,
  });
}
