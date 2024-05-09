import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/my_controller.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});

  final MyController myController = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Interview Question"),
        centerTitle: true,
      ),
      body: Obx(() {
        var item = myController.dataList.value.data?.list;
       return myController.isLoading.isTrue ? Center(child: CircularProgressIndicator(),) : Container(
            height: double.infinity,
            width: double.infinity,



            child:Center(
              child: DataTable(
                columns: const <DataColumn>[
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Name',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'UID',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Doc Type',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Image',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                ],
                rows:[
                  DataRow(
                    cells: [
                      DataCell(Text("JAVA")),
                      DataCell(Text(item![0].uid.toString())),
                      DataCell(Text(getValue(item[0].docType))),
                      DataCell(Container(height: 70,width: 70,
                        decoration: BoxDecoration(
                            image: DecorationImage(image: NetworkImage(item[0].url))
                        ),)),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('PYTHON')),
                      DataCell(Text(item[1].uid.toString())),
                      DataCell(Text(getValue(item[1].docType))),
                      DataCell(Container(height: 70,width: 70,
                        decoration: BoxDecoration(
                            image: DecorationImage(image: NetworkImage(item[1].url))
                        ),)),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('KOTLIN')),
                      DataCell(Text(item[2].uid.toString())),
                      DataCell(Text(getValue(item[2].docType))),
                      DataCell(Container(height: 70,width: 70,
                        decoration: BoxDecoration(
                            image: DecorationImage(image: NetworkImage(item[2].url))
                        ),)),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('NODEJS')),
                      DataCell(Text(item[3].uid.toString())),
                      DataCell(Text(getValue(item[3].docType))),
                      DataCell(Container(height: 70,width: 70,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: NetworkImage(item[3].url))
                          ),)),
                    ],
                  ),
                ],
              ),
            )
        //     ListView.builder(
        //   itemCount: myController.dataList.value.data?.list.length,
        //   itemBuilder: (context, index) {
        //     var item = myController.dataList.value.data?.list;
        //     return ListTile(
        //       title: Text(item![index].name),
        //       subtitle: Text(item![index].url),
        //     );
        //   },
        // )
       );
      }),
    );
  }
   getValue(int num){
     if(num == 0){
       return "image";
     }
     else if(num == 1){
       return "video";
     }else if(num == 2){
       return "pdf";
     }else if(num == 3){
       return "audio";
     }else if(num == 4){
       return "document";
     }
   }
}
