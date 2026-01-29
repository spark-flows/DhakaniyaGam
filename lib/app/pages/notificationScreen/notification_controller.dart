import 'package:dhakaniya_gam/app/app.dart';
import 'package:dhakaniya_gam/domain/models/models.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class NotificationController extends GetxController {
  NotificationController(this.notificationPresenter);

  final NotificationPresenter notificationPresenter;

  PagingController<int, GetAllMessageDoc> pagingCommitteeController =
      PagingController(firstPageKey: 1);

  List<GetAllMessageDoc> notificationList = [];

  int selectPage = 0;
  int selectNotificationPage = 0;

  Future<void> getAllNotification(pageKey) async {
    var response = await notificationPresenter.getAllNotification(
      page: pageKey,
      limit: 10,
      search: "",
      isLoading: false,
    );
    if (response?.data != null) {
      if (pageKey == 1) {
        notificationList.clear();
      }
      notificationList = response?.data?.docs ?? [];

      final isLastPage = notificationList.length < 10;
      if (isLastPage) {
        pagingCommitteeController.appendLastPage(notificationList);
      } else {
        var nextPageKey = pageKey + 1;
        pagingCommitteeController.appendPage(notificationList, nextPageKey);
      }
      update();
    }
  }

  GetAllMessageDoc? getAllMessageDoc = GetAllMessageDoc();

  Future<void> postGetOneNotification(String galleryId) async {
    var response = await notificationPresenter.postGetOneNotification(
      messageId: galleryId,
      isLoading: false,
    );
    getAllMessageDoc = null;
    if (response?.data != null) {
      getAllMessageDoc = response?.data;
      update();
    }
  }
}
