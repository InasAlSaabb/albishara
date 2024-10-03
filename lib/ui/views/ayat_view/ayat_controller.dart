// // import 'package:flutter_templete/core/data/models/apis/ayat_model.dart';
// // import 'package:flutter_templete/core/data/reposotories/ayat_repository.dart';
// // import 'package:flutter_templete/core/enums/message_type.dart';
// // import 'package:flutter_templete/core/enums/operation_type.dart';
// // import 'package:flutter_templete/core/enums/request_status.dart';
// // import 'package:flutter_templete/core/services/base_controller.dart';
// // import 'package:flutter_templete/core/services/sql_services.dart';
// // import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
// // import 'package:get/get.dart';

// // class AyatController extends BaseController {
// //   String? trans;
// //   int? hid;
// //   int? ch;
// //   AyatController({this.trans, this.hid, this.ch});
// //   @override
// //   void onInit() {
// //     getAyatList(trans: trans!, hid: hid!, ch: ch!);

// //     super.onInit();
// //   }

// //   Future<List<Map<String, dynamic>>> readData() async {
// //     List<Map<String, dynamic>> response = await sql.readData(
// //       'SELECT * FROM ayat WHERE "hid" = ? AND "chnr" = ? AND "trans" = ?',
// //       ['hid', 'ch', 'trans'],
// //     );
// //     return response;
// //   }

// //   void fetchData() async {
// //     int hidValue = hid!; // قيمة hid التي تريدها
// //     int chnrValue = ch!; // قيمة chnr التي تريدها
// //     String transValue = trans!; // قيمة trans التي تريدها

// //     var results = await sql.readmod(
// //       'ayat',
// //       columns: ['hid', 'chnr', 'trans'],
// //       where: '"hid" = ? AND "chnr" = ? AND "trans" = ?',
// //       whereArgs: [hidValue, chnrValue, transValue], // القيم الصحيحة
// //     );

// //     if (results.isNotEmpty) {
// //       // طباعة البيانات المسترجعة
// //       print("Results: $results");
// //     } else {
// //       print(
// //           "No data found for hid = $hidValue, chnr = $chnrValue, and trans = $transValue.");
// //     }
// //   }

// //   bool get isLoading => requestStatus.value == RequestStatus.LOADING;
// //   SqlDb sql = SqlDb();
// //   // Future<List<AyatModel>> ayat(
// //   //     {required int hid, required int ch, required String trans}) async {
// //   //   final List<Map<String, dynamic>> maps = await sql.readData(
// //   //       'SELECT DISTINCT * FROM ayat WHERE hid = ? AND chnr = ? AND trans = ?',
// //   //       [hid, ch, trans]);
// //   //   ayatListtt.assignAll(maps);
// //   // }

// //   // Future<void> readData(
// //   //     {required int hid, required int ch, required String trans}) async {
// //   //   var result = await sql.readData(
// //   //       'SELECT DISTINCT * FROM ayat WHERE hid = ? AND chnr = ? AND trans = ?',
// //   //       [hid, ch, trans]);
// //   //   RxList<AyatModel> res = RxList<AyatModel>.from(
// //   //       result.map((item) => AyatModel.fromJson(item)).toList());
// //   //   ayatListtt.assignAll(res);
// //   // }

// //   // Future<void> readData({
// //   //   required int hid,
// //   //   required int ch,
// //   //   required String trans,
// //   // }) async {
// //   //   // Fetch data from the database
// //   //   // var result = await sql.read("ayat"
// //   //   //     // 'SELECT * FROM ayat WHERE hid = ? AND chnr = ? AND trans = ?',
// //   //   //     // [hid, ch, trans],
// //   //   //     );
// //   //   // مثال على استدعاء الدالة مع شرط
// //   //   var result = await sql.readmod('ayat',
// //   //       columns: ['hid', 'chnr', 'trans'],
// //   //       where: '"hid" = ? AND "chnr"=? AND "trans=?"',
// //   //       whereArgs: ['hid', 'chnr', 'trans']);

// //   //   // Convert the result to a reactive list of AyatModel
// //   //   RxList<AyatModel> res = RxList<AyatModel>.from(
// //   //     result.map((item) => AyatModel.fromJson(item)).toList(),
// //   //   );

// //   //   // Assign the result to your observable list
// //   //   ayatListtt.assignAll(res.toSet());
// //   // }

// //   // // Future<void> readData(
// //   // //     {required int hid, required int ch, required String trans}) async {
// //   // //   var result = await sql.readData(
// //   // //     'SELECT DISTINCT * FROM ayat WHERE hid = ? AND chnr = ? AND trans = ?',
// //   // //   );
// //   // //   print(
// //   // //       'SELECT DISTINCT * FROM ayat WHERE hid = $hid AND chnr = $ch AND trans = $trans');

// //   //   RxList<AyatModel> res = RxList<AyatModel>.from(
// //   //       result.map((item) => AyatModel.fromJson(item)).toList());
// //   //   ayatListtt.assignAll(res);
// //   // }

// //   RxList<AyatModel> ayatListtt = <AyatModel>[].obs;
// //   Future<void> getAyatList({
// //     required String trans,
// //     required int hid,
// //     required int ch,
// //   }) async {
// //     runLoadingFutureFunction(
// //         operationType: OperationType.AYAYT,
// //         function: AyatRepository()
// //             .getAll(trans: trans, hid: hid, ch: ch)
// //             .then((value) {
// //           value.fold((l) {
// //             CustomToast.showMessage(
// //                 message: l, messageType: MessageType.REJECTED);
// //           }, (r) {
// //             CustomToast.showMessage(
// //                 message: "succed", messageType: MessageType.SUCCESS);
// //             ayatListtt.value = r;
// //           });
// //         }));
// //   }
// // }
// import 'package:flutter_templete/core/data/models/apis/ayat_model.dart';
// import 'package:flutter_templete/core/data/reposotories/ayat_repository.dart';
// import 'package:flutter_templete/core/enums/message_type.dart';
// import 'package:flutter_templete/core/enums/operation_type.dart';
// import 'package:flutter_templete/core/enums/request_status.dart';
// import 'package:flutter_templete/core/services/base_controller.dart';
// import 'package:flutter_templete/core/services/sql_services.dart';
// import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
// import 'package:get/get.dart';
// import 'package:connectivity_plus/connectivity_plus.dart'; // استيراد مكتبة الاتصال

// class AyatController extends BaseController {
//   String? trans;
//   int? hid;
//   int? ch;

//   AyatController({this.trans, this.hid, this.ch});
//   SqlDb sql = SqlDb();

//   @override
//   void onInit() {
//     super.onInit();
//     fetchData();
//   }

//   Future<void> fetchData() async {
//     var connectivityResult = await (Connectivity().checkConnectivity());

//     if (connectivityResult == ConnectivityResult.none) {
//       // إذا لم يكن هناك اتصال بالإنترنت، جلب البيانات من قاعدة البيانات
//       await getAyatFromDatabase();
//     } else {
//       // إذا كان هناك اتصال، جلب البيانات من API
//       await getAyatList(trans: trans!, hid: hid!, ch: ch!);
//     }
//   }

//   Future<void> getAyatFromDatabase() async {
//     int hidValue = hid!;
//     int chnrValue = ch!;
//     String transValue = trans!;

//     var results = await sql.readmod(
//       'ayat',
//       columns: ['hid', 'chnr', 'trans'],
//       where: '"hid" = ? AND "chnr" = ? AND "trans" = ?',
//       whereArgs: [hidValue, chnrValue, transValue],
//     );

//     if (results.isNotEmpty) {
//       // تحويل النتائج إلى نموذج AyatModel
//       ayatListtt.value =
//           results.map((item) => AyatModel.fromJson(item)).toList();
//       CustomToast.showMessage(
//           message: "Data loaded from local storage",
//           messageType: MessageType.SUCCESS);
//     } else {
//       CustomToast.showMessage(
//           message: "No data found in local storage.",
//           messageType: MessageType.REJECTED);
//     }
//   }

//   bool get isLoading => requestStatus.value == RequestStatus.LOADING;

//   RxList<AyatModel> ayatListtt = <AyatModel>[].obs;

//   Future<void> getAyatList(
//       {required String trans, required int hid, required int ch}) async {
//     runLoadingFutureFunction(
//         operationType: OperationType.AYAYT,
//         function: AyatRepository()
//             .getAll(trans: trans, hid: hid, ch: ch)
//             .then((value) {
//           value.fold((l) {
//             CustomToast.showMessage(
//                 message: l, messageType: MessageType.REJECTED);
//           }, (r) {
//             CustomToast.showMessage(
//                 message: "succeeded", messageType: MessageType.SUCCESS);
//             ayatListtt.value = r;
//           });
//         }));
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_templete/core/data/models/apis/ayat_model.dart';
import 'package:flutter_templete/core/data/reposotories/ayat_repository.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/core/enums/operation_type.dart';
import 'package:flutter_templete/core/enums/request_status.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/core/services/sql_services.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class AyatController extends BaseController {
  String? trans;
  int? hid;
  int? ch;

  AyatController({this.trans, this.hid, this.ch});
  final SqlDb sql = SqlDb();
  RxList<AyatModel> ayatListtt = <AyatModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    final connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) {
      await getAyatFromDatabase();
    } else {
      await getAyatList(trans: trans ?? '', hid: hid ?? 1, ch: ch ?? 1);
    }
  }

  Future<void> getAyatFromDatabase() async {
    if (hid == null || ch == null || trans == null) {
      CustomToast.showMessage(
          message: "Invalid parameters for database query.",
          messageType: MessageType.REJECTED);
      return;
    }

    final results = await sql.readmod(
      'ayat',
      // columns: ['sfrnr', 'chnr', 'trans'],
      where: '"sfrnr" = ? AND "chnr" = ? AND "trans" = ?',
      whereArgs: [hid!, ch!, trans!], // استخدم ! للتأكد من أن القيم غير فارغة
    );
    // final results = await sql.read(
    //   'ayat',
    // );

    if (results.isNotEmpty) {
      RxList<AyatModel> res = RxList<AyatModel>.from(
          results.map((item) => AyatModel.fromJson(item)).toList());
      ayatListtt.assignAll(res);
      CustomToast.showMessage(
          message: "Data loaded from local storage",
          messageType: MessageType.SUCCESS);
    } else {
      CustomToast.showMessage(
          message: "No data found in local storage.",
          messageType: MessageType.REJECTED);
    }
  }

  bool get isLoading => requestStatus.value == RequestStatus.LOADING;

  Future<void> getAyatList({
    required String trans,
    required int hid,
    required int ch,
  }) async {
    runLoadingFutureFunction(
      operationType: OperationType.AYAYT,
      function:
          AyatRepository().getAll(trans: trans, hid: hid, ch: ch).then((value) {
        value.fold((errorMessage) {
          CustomToast.showMessage(
              message: 'Check your connection',
              messageType: MessageType.REJECTED);
        }, (result) {
          CustomToast.showMessage(
              message: "Succeeded", messageType: MessageType.SUCCESS);
          ayatListtt.value = result;
        });
      }),
    );
  }
}
