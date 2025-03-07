import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class RetailerChatScreen extends StatefulWidget {
  const RetailerChatScreen({super.key});

  @override
  _RetailerChatScreenState createState() => _RetailerChatScreenState();
}

class _RetailerChatScreenState extends State<RetailerChatScreen> {
  final TextEditingController _searchController = TextEditingController();

  // Mock conversation data with more detailed information
  final List<Map<String, dynamic>> _conversations = [
    {
      'id': '1',
      'name': 'Rental Support',
      'avatar': 'https://randomuser.me/api/portraits/men/1.jpg',
      'lastMessage': 'Your booking is confirmed',
      'time': '9:45 AM',
      'unreadCount': 2,
      'status': 'Online',
      'category': 'Support',
    },
    {
      'id': '2',
      'name': 'Vehicle Owner - SUV Rental',
      'avatar': 'https://randomuser.me/api/portraits/women/2.jpg',
      'lastMessage': 'Can you provide more details about the rental?',
      'time': 'Yesterday',
      'unreadCount': 1,
      'status': 'Offline',
      'category': 'Rental',
    },
    {
      'id': '3',
      'name': 'Finance Team',
      'avatar': 'https://randomuser.me/api/portraits/lego/1.jpg',
      'lastMessage': 'Invoice attached for your recent booking',
      'time': 'Sunday',
      'unreadCount': 0,
      'status': 'Away',
      'category': 'Billing',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          // Adaptive App Bar
          SliverAppBar(
            floating: true,
            snap: true,
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text(
              'Messages',
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontSize: 24,
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.filter_list, color: Colors.black87),
                onPressed: () {
                  _showFilterBottomSheet();
                },
              ),
            ],
          ),

          // Search Bar
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search conversations...',
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Conversations List
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  var conversation = _conversations[index];
                  return _buildConversationTile(conversation);
                },
                childCount: _conversations.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Conversation Tile Widget
  Widget _buildConversationTile(Map<String, dynamic> conversation) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
        border: Border.all(
          color: conversation['unreadCount'] > 0 
            ? Colors.blue.shade50 
            : Colors.transparent,
          width: 1,
        ),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Stack(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(conversation['avatar']),
              radius: 30,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: _getStatusColor(conversation['status']),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
              ),
            ),
          ],
        ),
        title: Text(
          conversation['name'],
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Row(
          children: [
            Text(
              conversation['category'],
              style: GoogleFonts.roboto(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                conversation['lastMessage'],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.roboto(
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              conversation['time'],
              style: GoogleFonts.roboto(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            if (conversation['unreadCount'] > 0)
              Container(
                margin: EdgeInsets.only(top: 4),
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  conversation['unreadCount'].toString(),
                  style: TextStyle(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
        onTap: () {
          _openConversation(conversation);
        },
      ),
    );
  }

  // Open conversation details
  void _openConversation(Map<String, dynamic> conversation) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ConversationDetailScreen(
          conversation: conversation,
          messages: [], // Add the required messages argument
        ),
      ),
    );
  }

  // Show filter bottom sheet
  void _showFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Filter Conversations',
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildFilterChip('All'),
                  _buildFilterChip('Support'),
                  _buildFilterChip('Rental'),
                  _buildFilterChip('Billing'),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  // Build filter chip
  Widget _buildFilterChip(String label) {
    return ChoiceChip(
      label: Text(label),
      selected: false,
      onSelected: (bool selected) {
        // Implement filtering logic
      },
      selectedColor: Colors.blue.shade100,
      backgroundColor: Colors.grey.shade200,
    );
  }

  // Get status color based on online status
  Color _getStatusColor(String status) {
    switch (status) {
      case 'Online':
        return Colors.green;
      case 'Offline':
        return Colors.grey;
      case 'Away':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }
}
// Conversation Detail Screen
class ConversationDetailScreen extends StatefulWidget {
  final Map<String, dynamic> conversation;
  final List<Map<String, dynamic>> messages;

  const ConversationDetailScreen({
    super.key,
    required this.conversation,
    required this.messages,
  });

  @override
  _ConversationDetailScreenState createState() =>
      _ConversationDetailScreenState();
}

class _ConversationDetailScreenState extends State<ConversationDetailScreen> {
  final TextEditingController _messageController = TextEditingController();
  late List<Map<String, dynamic>> _messages;

  @override
  void initState() {
    super.initState();
    _messages = widget.messages;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(widget.conversation['avatar']),
              radius: 20,
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.conversation['name'],
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontSize: 16,
                  ),
                ),
                Text(
                  widget.conversation['status'],
                  style: GoogleFonts.roboto(
                    color: _getStatusColor(widget.conversation['status']),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.video_call, color: Colors.black87),
            onPressed: () {
              // Implement video call
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black87),
            onPressed: () {
              // Show more options
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Messages List
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                var message = _messages[_messages.length - 1 - index];
                return _buildMessageBubble(message);
              },
            ),
          ),

          // Message Input
          _buildMessageInput(),
        ],
      ),
    );
  }

  // Build message bubble
  Widget _buildMessageBubble(Map<String, dynamic> message) {
    bool isMe = message['isMe'] ?? false;
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isMe ? Colors.blue.shade100 : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment:
              isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              message['message'],
              style: GoogleFonts.roboto(),
            ),
            SizedBox(height: 4),
            Text(
              message['time'],
              style: GoogleFonts.roboto(
                color: Colors.grey,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Build message input
  Widget _buildMessageInput() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.attach_file),
            onPressed: () {
              // Attach file
            },
          ),
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: 'Type a message...',
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          SizedBox(width: 8),
          CircleAvatar(
            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
            child: IconButton(
              icon: Icon(Icons.send, color: Colors.white),
              onPressed: _sendMessage,
            ),
          ),
        ],
      ),
    );
  }

  // Send message functionality
  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        _messages.add({
          'id': DateTime.now().toString(),
          'sender': 'You',
          'message': _messageController.text,
          'time': DateFormat('h:mm a').format(DateTime.now()),
          'isMe': true,
        });
        _messageController.clear();
      });
    }
  }

  // Get status color based on online status
  Color _getStatusColor(String status) {
    switch (status) {
      case 'Online':
        return Colors.green;
      case 'Offline':
        return Colors.grey;
      case 'Away':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }
}