import 'package:flutter_templete/core/data/models/apis/list_asfar_model.dart';
import 'package:flutter_templete/core/data/reposotories/asfar_list_repository.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/core/enums/operation_type.dart';
import 'package:flutter_templete/core/enums/request_status.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:get/get.dart';

class Mcontroller extends BaseController {
  String? id;
  Mcontroller({
    this.id,
  });
  @override
  void onInit() {
    getAsfarList(id: id!);
    super.onInit();
  }

  bool get isLoading => requestStatus.value == RequestStatus.LOADING;

  RxList<asfarListModel> asfarListtt = <asfarListModel>[].obs;
  Future<void> getAsfarList({required String id}) async {
    runLoadingFutureFunction(
        operationType: OperationType.ASFAR,
        function: AsfarRepository().getAll(id: id).then((value) {
          value.fold((l) {
            CustomToast.showMessage(
                message: l, messageType: MessageType.REJECTED);
          }, (r) {
            CustomToast.showMessage(
                message: "succed", messageType: MessageType.SUCCESS);
            asfarListtt.value = r;
          });
        }));
  }
}
