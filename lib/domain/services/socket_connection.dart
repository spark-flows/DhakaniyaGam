import 'package:dhakaniya_gam/app/app.dart';
import 'package:dhakaniya_gam/data/data.dart';
import 'package:dhakaniya_gam/domain/domain.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

abstract class SocketConnection {
  static IO.Socket? socket;

  static socketDisconnect() {
    socket?.disconnect();
  }

  static initSocket() {
    socket = IO.io(ApiWrapper.baseUrl, <String, dynamic>{
      'autoConnect': false,
      'transports': ['websocket'],
    });
    socket!.connect();
    socket!.onConnect((_) {
      print("Conttecty SuseesFully...");
      print(Get.find<Repository>().getStringValue(LocalKeys.channelId));
      socket!.emit('init', {
        'channelID': Get.find<Repository>().getStringValue(LocalKeys.channelId),
      });
    });

    socket!.on(Get.find<Repository>().getStringValue(LocalKeys.channelId),
        (data) async {
      print(data);
      if (data['event'] == 'ads') {
        Get.find<DashboardController>().getAds();
        Get.forceAppUpdate();
      } else if (data['event'] == 'actionUser') {
        Get.forceAppUpdate();
      } else if (data['event'] == 'actionResult') {
        Get.forceAppUpdate();
      } else if (data['event'] == 'actionScolarship') {
        Get.forceAppUpdate();
      } else if (data['event'] == 'actionWidow') {
        Get.forceAppUpdate();
      } else if (data['event'] == 'actionLoan') {
        Get.forceAppUpdate();
      }
    });
    socket!.onDisconnect((_) => print('Connection Disconnection'));
    socket!.onConnectError((err) => print(err));
    socket!.onError((err) => print(err));
  }
}
