import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxlearn/models/my_list_model.dart';
import 'package:getxlearn/services/accommodations_service.dart';
import 'dart:math' as math;

import 'package:getxlearn/services/dec_to_bin_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX List example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DecToBin(),
    );
  }
}


class DecToBin extends StatelessWidget {
     DecToBin({Key? key}):super(key : key);

    TextEditingController myController = TextEditingController();
     DecToBinController gC = Get.put(DecToBinController());
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(()=>Column(
        children: [
          TextField(controller: myController),
          TextButton(onPressed: (){
            gC.binTo(myController.text,3);
            log("@@ ${gC.binaryNo}");
          }, child: Text("Submit")),
          Text("${gC.binaryNo.value}")
        ],
      ),)
    );
  }
}


class ListOp extends StatelessWidget {
  ListOp({Key? key}) : super(key: key);

  ListOpService listOpService = Get.put(ListOpService());
  TextEditingController myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          Get.defaultDialog(
              textConfirm: 'Confirm',
              onConfirm: () {
                log("Button Printed");
                listOpService.addDataToList(MyListModel(
                    text: myController.text, controller: TextEditingController(), bgColor: Color((math.Random().nextDouble() * 0xFFFFFFFF).toInt())));
                // Get.back();
              },
              title: "Add Data",
              content: TextField(controller: myController));
        }),
        body: Column(
          children: [
            Obx(() => listOpService.listData.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                        itemCount: listOpService.listData.length,
                        itemBuilder: (c, i) {
                          MyListModel l = listOpService.listData[i];
                          print(l.bgColor);
                          return Container(
                            color: l.bgColor,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                              child: listOpService.selectedListIndex != i
                                  ? Row(
                                      children: [
                                        Expanded(
                                            child: Text(
                                          l.text.toString(),
                                          style: TextStyle(color: l.text.toString() == i.toString() ? Colors.red : Colors.black),
                                        )),
                                        const Spacer(),
                                        IconButton(
                                            onPressed: () {
                                              listOpService.updateListValue(
                                                MyListModel(text: l.text.toString(), controller: TextEditingController(text: l.text.toString())),
                                                i,
                                              );
                                              listOpService.changeSelectedIndex(i);
                                              log("${listOpService.selectedListIndex}");
                                            },
                                            icon: const Icon(Icons.edit)),
                                        IconButton(
                                            onPressed: () {
                                              listOpService.removeFromList(i);
                                            },
                                            icon: const Icon(Icons.delete)),
                                        const Spacer(),
                                      ],
                                    )
                                  : Row(children: [
                                      Expanded(child: TextField(controller: l.controller)),
                                      const Spacer(),
                                      IconButton(
                                          onPressed: () {
                                            listOpService.updateListValue(
                                              MyListModel(text: l.controller!.text, controller: TextEditingController()),
                                              i,
                                            );
                                            listOpService.changeSelectedIndex(-1);
                                          },
                                          icon: const Icon(Icons.check)),
                                      const Spacer(),
                                    ]),
                            ),
                          );
                        }),
                  )
                : const Text(":EEEEEEEEEEE"))
          ],
        ));
  }
}
