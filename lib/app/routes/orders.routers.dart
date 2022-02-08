
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:vakinha_burger_mobile/app/modules/finished/finished_page.dart';
import 'package:vakinha_burger_mobile/app/modules/pix/pix_page.dart';

class OrdersRouters {
   OrdersRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: '/orders/finished',
      page: () => FinishedPage(),
    ),
    GetPage(
      name: '/orders/pix',
      page: () => PixPage(),
    )
  ];
}