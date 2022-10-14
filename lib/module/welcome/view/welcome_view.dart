import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../controller/welcome_controller.dart';

import 'package:get/get.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelcomeController>(
      init: WelcomeController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Welcome"),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  // ElevatedButton.icon(
                  //   icon: const Icon(Icons.g_mobiledata),
                  //   label: const Text("Login with google"),
                  //   style: ElevatedButton.styleFrom(
                  //     backgroundColor: Colors.blueGrey,
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(12), // <-- Radius
                  //     ),
                  //   ),
                  //   onPressed: () {
                  //     controller.doLogin();
                  //   },
                  // ),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.g_mobiledata),
                    label: const Text("Coba tambah data"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // <-- Radius
                      ),
                    ),
                    onPressed: () {
                      controller.addDataSample();
                    },
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection("products")
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) return const Text("Error");
                        if (snapshot.data == null) return Container();
                        if (snapshot.data!.docs.isEmpty) {
                          return const Text("No Data");
                        }
                        final data = snapshot.data!;
                        return ListView.builder(
                          itemCount: data.docs.length,
                          itemBuilder: (context, index) {
                            Map<String, dynamic> item = (data.docs[index].data()
                                as Map<String, dynamic>);
                            item["id"] = data.docs[index].id;
                            var dataProduct = item['data'] as List;
                            return ListView.builder(
                              itemCount: dataProduct.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                var item1 = dataProduct[index];
                                return Card(
                                  child: ListTile(
                                    title: Text(item1),
                                    subtitle: const Text("Programmer"),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
