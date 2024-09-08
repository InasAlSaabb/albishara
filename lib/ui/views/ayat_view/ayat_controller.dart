import 'package:flutter_templete/core/data/models/apis/ayat_model.dart';
import 'package:flutter_templete/core/data/reposotories/ayat_repository.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/core/enums/operation_type.dart';
import 'package:flutter_templete/core/enums/request_status.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:get/get.dart';

class AyatController extends BaseController {
  String? trans;
  int? hid;
  int? ch;
  AyatController({this.trans, this.hid, this.ch});
  @override
  void onInit() {
    getAyatList(trans: trans!, hid: hid!, ch: ch!);
    super.onInit();
  }

  bool get isLoading => requestStatus.value == RequestStatus.LOADING;

  RxList<AyatModel> ayatListtt = <AyatModel>[].obs;
  Future<void> getAyatList({
    required String trans,
    required int hid,
    required int ch,
  }) async {
    runLoadingFutureFunction(
        operationType: OperationType.AYAYT,
        function: AyatRepository()
            .getAll(trans: trans, hid: hid, ch: ch)
            .then((value) {
          value.fold((l) {
            CustomToast.showMessage(
                message: l, messageType: MessageType.REJECTED);
          }, (r) {
            CustomToast.showMessage(
                message: "succed", messageType: MessageType.SUCCESS);
            ayatListtt.value = r;
          });
        }));
  }
}
