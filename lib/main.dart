import 'package:dhakaniya_gam/app/navigators/navigators.dart';
import 'package:dhakaniya_gam/app/theme/colors_value.dart';
import 'package:dhakaniya_gam/app/utils/utils.dart';
import 'package:dhakaniya_gam/data/data.dart';
import 'package:dhakaniya_gam/device/repositories/device_repositories.dart';
import 'package:dhakaniya_gam/domain/domain.dart';
import 'package:dhakaniya_gam/firebase_options.dart';
import 'package:dhakaniya_gam/models/child_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  // await Firebase.initializeApp();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseMessaging.instance.setAutoInitEnabled(true);
  FirebaseApi.initilizeNotification();
  Hive.registerAdapter(ChildsModelAdapter());
  // Hive.registerAdapter(EarningMemberModelAdapter());

  runApp(
    const MyApp(),
  );
}

Future<void> initServices() async {
  await Hive.initFlutter();

  // Hive.registerAdapter(DownloadTaskModelAdapter());

  // await Hive.openBox<DownloadTaskModel>('download_task_model');

  Get.put(
    Repository(
      Get.put(
        DeviceRepository(),
        permanent: true,
      ),
      Get.put(
          DataRepository(
            Get.put(
              ConnectHelper(),
              permanent: true,
            ),
          ),
          permanent: true),
    ),
  );

  /// Services
  await Get.putAsync(() => CommonService().init());
  await Get.putAsync(() => DbService().init());
}

class DbService extends GetxService {
  Future<DbService> init() async {
    await Get.find<DeviceRepository>().init();
    return this;
  }
}

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarColor: ColorsValue.white,
      ),
    );
    return ScreenUtilInit(
      minTextAdapt: true,
      builder: (_, child) {
        return GetMaterialApp(
          translations: TranslationsFile(),
          locale: const Locale('gu', 'IN'),
          debugShowCheckedModeBanner: false,
          title: StringConstants.appName,
          getPages: AppPages.pages,
          initialRoute: Routes.splashScreen,
          navigatorKey: Get.key,
          enableLog: true,
        );
      },
    );
  }
}
