import 'package:dhakaniya_gam/domain/models/get_one_notification_model.dart';
import 'package:dhakaniya_gam/domain/models/models.dart';
import 'package:dhakaniya_gam/domain/usecases/usecases.dart';

class NotificationPresenter {
  NotificationPresenter(this.notificationUsecases, this.commonUsecases);

  final NotificationUsecases notificationUsecases;
  final CommonUsecases commonUsecases;

  Future<GetAllMessageModel?> getAllNotification({
    required int page,
    required int limit,
    required String search,
    bool isLoading = false,
  }) async =>
      await notificationUsecases.getAllNotification(
        page: page,
        limit: limit,
        search: search,
        isLoading: isLoading,
      );

  Future<GetOneNotificationModel?> postGetOneNotification({
    required String messageId,
    bool isLoading = false,
  }) async =>
      await notificationUsecases.postGetOneNotification(
        messageId: messageId,
        isLoading: isLoading,
      );

  Future<GetProfileModel?> getProfileApi({
    bool isLoading = false,
  }) async =>
      await commonUsecases.getProfileApi(
        isLoading: isLoading,
      );
}
