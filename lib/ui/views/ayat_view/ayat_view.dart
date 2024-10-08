import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/ayat_view/ayat_controller.dart';
import 'package:get/get.dart';

class AyatView extends StatefulWidget {
  const AyatView({super.key, this.trans, this.hid, this.ch});
  final String? trans;
  final int? hid;
  final int? ch;

  @override
  State<AyatView> createState() => _AyatViewState();
}

class _AyatViewState extends State<AyatView> {
  late AyatController controllerr;

  Future<bool> checkAndInsert(int id, Map<String, dynamic> data) async {
    if (!await controllerr.sql.recordExists('ayat', id)) {
      await controllerr.sql.insert('ayat', data);
      return true;
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
    controllerr = Get.put(
        AyatController(trans: widget.trans, hid: widget.hid, ch: widget.ch));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.mainBackColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth(40)),
          child: Obx(() {
            return controllerr.isLoading
                ? SpinKitCircle(
                    color: AppColors.mainOrangeColor,
                  )
                : ListView(
                    shrinkWrap: true,
                    children: [
                      SizedBox(height: screenHieght(20)),
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controllerr.ayatListtt.length,
                          itemBuilder: (BuildContext context, int index) {
                            final ayat = controllerr.ayatListtt[index];

                            // تحقق من أن id غير null قبل استخدامه
                            if (ayat.id != null) {
                              checkAndInsert(ayat.id!, {
                                "id": ayat.id,
                                "sfrnr": ayat.sfrnr,
                                "hid": ayat.hid,
                                "chnr": ayat.chnr,
                                "vnumber": ayat.vnumber,
                                "textch": ayat.textch,
                                "tid": ayat.tid,
                                "trans": controllerr.trans ??
                                    "", // استخدم قيمة افتراضية
                              });
                            }

                            return Visibility(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.mainBackColor,
                                ),
                                child: Center(
                                  child: InkWell(
                                    onTap: () {},
                                    child: Column(
                                      children: [
                                        if (controllerr.ayatListtt[index].tid !=
                                            null)
                                          Text(
                                            controllerr.ayatListtt[index].tid!,
                                            style: TextStyle(
                                              color: AppColors.mainOrangeColor,
                                              fontSize: screenWidth(13),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        Row(
                                          children: [
                                            Text(
                                              ayat.vnumber?.toString() ??
                                                  "", // استخدم قيمة افتراضية
                                              style: TextStyle(
                                                fontSize: screenWidth(20),
                                                color: const Color.fromRGBO(
                                                    75, 52, 43, 1),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const Text(":",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Color.fromRGBO(
                                                        75, 52, 43, 1),
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            SizedBox(width: screenWidth(40)),
                                            Expanded(
                                              child: Text(
                                                controllerr.ayatListtt[index]
                                                        .textch ??
                                                    "", // استخدم قيمة افتراضية
                                                style: TextStyle(
                                                  fontSize: screenWidth(20),
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      AppColors.mainOrangeColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ],
                  );
          }),
        ),
      ),
    );
  }
}
