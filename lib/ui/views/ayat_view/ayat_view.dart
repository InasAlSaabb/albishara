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
  @override
  void initState() {
    controllerr = Get.put(
        AyatController(trans: widget.trans, hid: widget.hid, ch: widget.ch));

    super.initState();
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
              : ListView(shrinkWrap: true, children: [
                  SizedBox(
                    height: screenHieght(20),
                  ),
                  ListView.builder(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: controllerr.ayatListtt.length,
                      itemBuilder: (BuildContext context, int index) {
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
                                      controllerr.ayatListtt[index].tid == null
                                          ? Text("")
                                          : Text(
                                              controllerr
                                                  .ayatListtt[index].tid!,
                                              style: TextStyle(
                                                  color:
                                                      AppColors.mainOrangeColor,
                                                  fontSize: screenWidth(13),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                      Row(
                                        children: [
                                          Text(
                                            controllerr
                                                .ayatListtt[index].vnumber
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: screenWidth(20),
                                                color: Color.fromRGBO(
                                                    75, 52, 43, 1),
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(":",
                                              style: TextStyle(
                                                  fontSize: screenWidth(20),
                                                  color: Color.fromRGBO(
                                                      75, 52, 43, 1),
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(
                                            width: screenWidth(40),
                                          ),
                                          // Text(controllerr
                                          //     .ayatListtt[index].chnr
                                          //     .toString()),
                                          Expanded(
                                            child: Text(
                                              controllerr
                                                  .ayatListtt[index].textch!,
                                              style: TextStyle(
                                                  fontSize: screenWidth(20),
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColors
                                                      .mainOrangeColor),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
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
