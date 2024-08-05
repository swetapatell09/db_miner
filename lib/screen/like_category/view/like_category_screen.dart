import 'package:db_miner/utils/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/controller/home_controller.dart';

class LikeCategoryScreen extends StatefulWidget {
  const LikeCategoryScreen({super.key});

  @override
  State<LikeCategoryScreen> createState() => _LikeCategoryScreenState();
}

class _LikeCategoryScreenState extends State<LikeCategoryScreen> {
  HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    controller.quotesCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => ListView.builder(
          itemCount: controller.l1.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Get.toNamed('detail', arguments: controller.list[index]);
              },
              child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.primaries[index].shade200),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${controller.l1[index].name}",
                        style: const TextStyle(
                            fontSize: 20,
                            fontFamily: "f6",
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        onPressed: () {
                          Get.defaultDialog(title: "are you sure?", actions: [
                            ElevatedButton(
                              onPressed: () {
                                DBHelper.helper
                                    .deleteCategory(controller.l1[index].id!);
                                controller.quotesCategory();
                                Get.back();
                              },
                              child: const Text(
                                "Yes",
                                style: TextStyle(color: Colors.green),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: const Text(
                                "No",
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ]);
                        },
                        icon: const Icon(Icons.delete),
                        color: Colors.black,
                      ),
                    ],
                  )),
            );
          },
        ),
      ),
    );
  }
}
