import 'package:flutter_proj/view/notifications/models/notification_type.dart';

class NotificationRepositories {
  List<NotificationItem> getnotifications() {
    return [
      NotificationItem(
        title: 'Order Confirmed',
        massage:
            'Your order #123456 has been confirmed and is begin processed ',
        time: '2 minutes ago ',
        type: NotificationType.promo,
      ),
      NotificationItem(
        title: 'Special Offer!',
        massage: 'Get 20% off on all shoes this weekend!',
        time: '1 hour ago ',
        type: NotificationType.promo,
      ),
      NotificationItem(
        title: 'Out for Delivery ',
        massage: 'Your order #123456 is out for delivery  ',
        time: '3 hours ago ',
        type: NotificationType.delivery,
      ),
      NotificationItem(
        title: 'Payment Successful',
        massage: 'Payment for order #43232 was successful',
        time: '2 minutes ago ',
        type: NotificationType.payment,
      ),
    ];
  }
}
