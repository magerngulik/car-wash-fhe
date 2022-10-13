import 'package:flutter/material.dart';
import '../controller/select_date_controller.dart';

import 'package:get/get.dart';

class SelectDateView extends StatelessWidget {
  const SelectDateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SelectDateController>(
      init: SelectDateController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("SelectDate"),
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