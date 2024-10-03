import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_templete/core/data/models/apis/list_asfar_model.dart';
import 'package:flutter_templete/core/data/reposotories/asfar_list_repository.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/core/enums/operation_type.dart';
import 'package:flutter_templete/core/enums/request_status.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/core/services/sql_services.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:get/get.dart';

class Mcontroller extends BaseController {
  String? id;
  final String? name;
  final int? tp;
  Mcontroller({
    this.name,
    this.tp,
    this.id,
  });
  @override
  void onInit() async {
    // getAsfarList(id: id!);

    fetchData();
    super.onInit();
  }

  bool isloading = true;
  // Future<void> readData(String id) async {
  //   var result = await sql.read(id);
  //   RxList<asfarListModel> res = RxList<asfarListModel>.from(
  //       result.map((item) => asfarListModel.fromJson(item)).toList());
  //   asfarListtt.assignAll(res);
  // }

  Future<void> fetchData() async {
    List<String> ids = await storage.getNum();

    final connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none && ids.contains(id)) {
      await getAsfarFromDatabase();
    } else {
      await getAsfarList(id: id!);
    }
  }

  Future<void> getAsfarFromDatabase() async {
    if (id == null) {
      CustomToast.showMessage(
          message: "Invalid parameters for database query.",
          messageType: MessageType.REJECTED);
      return;
    }
    final result = await sql.readmod(
      'asfar',
      where: '"trans" = ?',
      whereArgs: [id!],
    );
    // var result = await sql.read(id!);
    // var result = await sql.read("asfar");
    if (result.isNotEmpty) {
      RxList<asfarListModel> res = RxList<asfarListModel>.from(
          result.map((item) => asfarListModel.fromJson(item)).toList());
      asfarListtt.assignAll(res);
      CustomToast.showMessage(
          message: "Data loaded from local storage",
          messageType: MessageType.SUCCESS);
    } else {
      CustomToast.showMessage(
          message: "No data found in local storage.",
          messageType: MessageType.REJECTED);
    }

    // final results = await sql.read(
    //   'ayat',
    // );
  }

  bool get isLoading => requestStatus.value == RequestStatus.LOADING;
  SqlDb sql = SqlDb();
  RxList<asfarListModel> asfarListtt = <asfarListModel>[].obs;
  Future<void> getAsfarList({required String id}) async {
    runLoadingFutureFunction(
        operationType: OperationType.ASFAR,
        function: AsfarRepository().getAll(id: id).then((value) {
          value.fold((l) {
            CustomToast.showMessage(
                message: l, messageType: MessageType.REJECTED);
          }, (r) async {
            CustomToast.showMessage(
                message: "succed", messageType: MessageType.SUCCESS);
            asfarListtt.value = r;
            await _checkAndInsertRecords();
          });
        }));
  }

  Future<void> _checkAndInsertRecords() async {
    for (var item in asfarListtt) {
      storage.setNum(id!);
      List<Map<String, dynamic>> existingRecords = await sql.readData(
        "SELECT * FROM asfar WHERE basl = ?",
        [item.basl!],
      );

      if (existingRecords.isEmpty) {
        // إذا لم يكن السجل موجودًا، قم بالإضافة
        await sql.insert("asfar", {
          "id": item.id,
          "trans": id,
          "chrcnt": item.chrcnt,
          "kaComp": item.kaComp,
          "name": item.name,
          "basl": item.basl,
          "tp": item.tp,
        });
      }
    }
  }
}
