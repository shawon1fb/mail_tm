import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mail_tm/presentation/login/controllers/login.controller.dart';
import 'package:mail_tm/presentation/sign_up/controllers/doman.controller.dart';

import 'infrastructure/navigation/bindings/controllers/login.controller.binding.dart';
import 'infrastructure/navigation/bindings/domains/account.repository.bindings.dart';
import 'infrastructure/navigation/bindings/domains/app.data.repository.bindings.dart';
import 'infrastructure/navigation/bindings/domains/domains.repository.bindings.dart';
import 'infrastructure/navigation/navigation.dart';
import 'infrastructure/navigation/routes.dart';
import 'infrastructure/theme/thems.dart';
import 'initializer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Initializer.init();
  var initialRoute = await Routes.initialRoute;

  runApp(Main(initialRoute));
}

class Main extends StatelessWidget {
  final String initialRoute;

  const Main(this.initialRoute, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (context, widget) => Directionality(
        textDirection: TextDirection.ltr,
        child: GetMaterialApp(
          textDirection: TextDirection.ltr,
          theme: LoginDesign5Theme.lightThemeData,
          fallbackLocale: const Locale('en', 'US'),
          debugShowCheckedModeBanner: false,
          initialRoute: initialRoute,
          getPages: Nav.routes,
          enableLog: true,
          defaultTransition: Transition.fadeIn,
          initialBinding: InitialBindings(),
          builder: (context, Widget? widget) {
            // ScreenUtil.setContext(context);

            return widget ?? const SizedBox();
          },
        ),
      ),
    );
  }
}

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<InitialController>(InitialController());
    LoginControllerBinding().dependencies();
    // Get.put<DomainController>(
    //   DomainController(domainRepository: DomainRepositoryBindings().repository),
    // );
  }
}

class InitialController extends GetxController {}
