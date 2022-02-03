
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/modules/menu/menu_controller.dart';
import 'package:vakinha_burger_mobile/app/modules/menu/widgets/product_tile.dart';


class MenuPage extends GetView<MenuController> {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return RefreshIndicator(
        onRefresh: controller.onRefreshPage,
        child: ListView.builder(
          itemCount: controller.menu.length,
          itemBuilder: (context, index) {
            final prod = controller.menu[index];
            return ProductTile(product: prod,);
          },
        ),
      );
    });
  }
}
