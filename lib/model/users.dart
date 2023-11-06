class User {
  final String timestamp;
  final String username;
  final String emailId;
  final String lastMessage;
  final bool verification;
  final String status;

  User({
    required this.timestamp,
    required this.username,
    required this.emailId,
    required this.lastMessage,
    required this.verification,
    required this.status,
  });
}
