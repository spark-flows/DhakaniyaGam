import 'package:dhakaniya_gam/domain/domain.dart';
import 'package:dhakaniya_gam/domain/models/get_one_notification_model.dart';

class NotificationUsecases {
  NotificationUsecases(this.repository);

  final Repository repository;

  Future<GetAllMessageModel?> getAllNotification({
    required int page,
    required int limit,
    required String search,
    bool isLoading = false,
  }) async =>
      await repository.getAllNotification(
        page: page,
        limit: limit,
        search: search,
        isLoading: isLoading,
      );

  Future<GetOneNotificationModel?> postGetOneNotification({
    required String messageId,
    bool isLoading = false,
  }) async =>
      await repository.postGetOneNotification(
        messageId: messageId,
        isLoading: isLoading,
      );
}
