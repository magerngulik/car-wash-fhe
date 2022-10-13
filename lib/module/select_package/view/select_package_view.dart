import 'package:flutter/material.dart';
import '../controller/select_package_controller.dart';

import 'package:get/get.dart';

class SelectPackageView extends StatelessWidget {
  const SelectPackageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SelectPackageController>(
      init: SelectPackageController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("SelectPackage"),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: const [
                  //body
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}