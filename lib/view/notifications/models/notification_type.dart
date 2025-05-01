enum NotificationType { order, delivery, promo, payment }

class NotificationItem {
  final String title;
  final String massage;
  final String time;
  final NotificationType type;
  final bool isRead;

  NotificationItem({
    required this.title,
    required this.massage,
    required this.time,
    required this.type,
    this.isRead = false,
  });
}
