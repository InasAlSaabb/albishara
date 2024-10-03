import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:flutter_templete/main.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/chnr_view/chnr_view.dart';
import 'package:flutter_templete/ui/views/m_view/m_controller.dart';
import 'package:get/get.dart';

class MView extends StatefulWidget {
  const MView({super.key, this.id, this.tp, this.name});
  final String? id;
  final String? name;

  final int? tp;
  @override
  State<MView> createState() => _MViewState();
}

class _MViewState extends State<MView> {
  late Mcontroller controllerr;
  @override
  void initState() {
    controllerr =
        Get.put(Mcontroller(id: widget.id, name: widget.name, tp: widget.tp));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isInserted = false;

    if (!isInserted) {
      for (var item in controllerr.asfarListtt) {
        controllerr.sql.insert(controllerr.id!, {
          "id": item.id,
          "chrcnt": item.chrcnt,
          "kaComp": item.kaComp,
          "name": item.name,
          "basl": item.basl,
          "tp": item.tp
        });
      }
      isInserted = true;
    }

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainOrangeColor,
        leadingWidth: screenWidth(1),
        leading: Center(
            child: Text(
          widget.name!,
          style: TextStyle(fontSize: screenWidth(16)),
        )),
      ),
      backgroundColor: AppColors.mainBackColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth(40)),
        child: Obx(() {
          return controllerr.isLoading
              ? SpinKitCircle(
                  color: AppColors.mainOrangeColor,
                )
              : ListView(shrinkWrap: true, children: [
                  screenHieght(15).ph,
                  Text(widget.tp == 1 ? "العهد القديم" : "العهد الجديد",
                      style: TextStyle(
                          fontSize: screenWidth(14),
                          fontWeight: FontWeight.bold,
                          color: AppColors.mainOrangeColor)),
                  screenHieght(40).ph,
                  ListView.builder(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: controllerr.asfarListtt.length,
                      itemBuilder: (BuildContext context, int index) {
                        controllerr.sql.insert(controllerr.id!, {
                          "id": controllerr.asfarListtt[index].id,
                          "chrcnt": controllerr.asfarListtt[index].chrcnt,
                          "kaComp": controllerr.asfarListtt[index].kaComp,
                          "name": controllerr.asfarListtt[index].name,
                          "basl": controllerr.asfarListtt[index].basl,
                          "tp": controllerr.asfarListtt[index].tp
                        });
                        storage.setNum(widget.id!);
                        return Visibility(
                          visible:
                              widget.tp == controllerr.asfarListtt[index].tp,
                          child: Container(
                              decoration: BoxDecoration(
                                  color: AppColors.mainBackColor,
                                  border: Border(
                                      bottom: BorderSide(
                                          style: BorderStyle.solid,
                                          width: 2,
                                          color: Colors.brown))),
                              child: Center(
                                child: InkWell(
                                  onTap: () {
                                    Get.to(ChnrView(
                                      trans: widget.id,
                                      hid: controllerr.asfarListtt[index].id,
                                      ch: controllerr.asfarListtt[index].chrcnt,
                                    ));
                                  },
                                  child: Text(
                                    controllerr.asfarListtt[index].name!,
                                    style: TextStyle(
                                        fontSize: screenWidth(14),
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.mainOrangeColor),
                                  ),
                                ),
                              )),
                        );
                      }),
                ]);
        }),
      ),
    ));
  }
}
