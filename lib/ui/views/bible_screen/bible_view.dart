import 'package:flutter/material.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_con.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/bible_screen/bible_controller.dart';
import 'package:flutter_templete/ui/views/m_view/m_view.dart';
import 'package:get/get.dart';

class BibleView extends StatefulWidget {
  const BibleView({super.key});

  @override
  State<BibleView> createState() => _BibleViewState();
}

class _BibleViewState extends State<BibleView> {
  BibleController controller = Get.put(BibleController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.mainBackColor,
        appBar: AppBar(
          backgroundColor: AppColors.mainOrangeColor,
          leadingWidth: screenWidth(1),
          leading: Center(
              child: Text(
            'البشارة',
            style: TextStyle(fontSize: screenWidth(10)),
          )),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth(6)),
          child: ListView(
            children: [
              SizedBox(
                height: screenHieght(40),
              ),
              Text(
                'اختر الترجمة',
                style: TextStyle(
                    fontSize: screenWidth(12),
                    color: AppColors.mainOrangeColor),
              ),
              SizedBox(
                height: screenHieght(50),
              ),
              InkWell(
                onTap: () {
                  Get.bottomSheet(
                      backgroundColor: AppColors.mainBackColor,
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'اختر العهد ',
                              style: TextStyle(
                                  fontSize: screenWidth(12),
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.mainblack),
                            ),
                            SizedBox(
                              height: screenHieght(30),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(MView(
                                  name: "الترجمة المشتركة دار الكتاب المقدس",
                                  id: "M",
                                  tp: 1,
                                ));
                              },
                              child: Container(
                                  height: screenHieght(15),
                                  width: screenWidth(2),
                                  color: AppColors.mainOrangeColor,
                                  child: Center(
                                      child: Text(
                                    "العهد القديم",
                                    style: TextStyle(
                                        fontSize: screenWidth(14),
                                        fontWeight: FontWeight.bold),
                                  ))),
                            ),
                            SizedBox(
                              height: screenHieght(30),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(MView(
                                  name: "الترجمة المشتركة دار الكتاب المقدس",
                                  id: "M",
                                  tp: 2,
                                ));
                              },
                              child: Container(
                                  height: screenHieght(15),
                                  width: screenWidth(2),
                                  color: AppColors.mainOrangeColor,
                                  child: Center(
                                      child: Text(
                                    "العهد الجديد",
                                    style: TextStyle(
                                        fontSize: screenWidth(14),
                                        fontWeight: FontWeight.bold),
                                  ))),
                            ),
                          ],
                        ),
                      ));
                },
                child: CustomCont(
                  text: controller.bishara.m!,
                ),
              ),
              SizedBox(
                height: screenHieght(40),
              ),
              InkWell(
                onTap: () {
                  Get.bottomSheet(
                      backgroundColor: AppColors.mainBackColor,
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'اختر العهد ',
                              style: TextStyle(
                                  fontSize: screenWidth(12),
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.mainblack),
                            ),
                            SizedBox(
                              height: screenHieght(30),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(MView(
                                  name: "ترجمة فاندايك",
                                  id: "V",
                                  tp: 1,
                                ));
                              },
                              child: Container(
                                  height: screenHieght(15),
                                  width: screenWidth(2),
                                  color: AppColors.mainOrangeColor,
                                  child: Center(
                                      child: Text(
                                    "العهد القديم",
                                    style: TextStyle(
                                        fontSize: screenWidth(14),
                                        fontWeight: FontWeight.bold),
                                  ))),
                            ),
                            SizedBox(
                              height: screenHieght(30),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(MView(
                                  name: "ترجمة فاندايك",
                                  id: "V",
                                  tp: 2,
                                ));
                              },
                              child: Container(
                                  height: screenHieght(15),
                                  width: screenWidth(2),
                                  color: AppColors.mainOrangeColor,
                                  child: Center(
                                      child: Text(
                                    "العهد الجديد",
                                    style: TextStyle(
                                        fontSize: screenWidth(14),
                                        fontWeight: FontWeight.bold),
                                  ))),
                            ),
                          ],
                        ),
                      ));
                },
                child: CustomCont(
                  text: controller.bishara.v!,
                ),
              ),
              SizedBox(
                height: screenHieght(40),
              ),
              InkWell(
                  onTap: () {
                    Get.bottomSheet(
                        backgroundColor: AppColors.mainBackColor,
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'اختر العهد ',
                                style: TextStyle(
                                    fontSize: screenWidth(12),
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.mainblack),
                              ),
                              SizedBox(
                                height: screenHieght(30),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(MView(
                                    name: "الترجمة الكاثوليكية",
                                    id: "K",
                                    tp: 1,
                                  ));
                                },
                                child: Container(
                                    height: screenHieght(15),
                                    width: screenWidth(2),
                                    color: AppColors.mainOrangeColor,
                                    child: Center(
                                        child: Text(
                                      "العهد القديم",
                                      style: TextStyle(
                                          fontSize: screenWidth(14),
                                          fontWeight: FontWeight.bold),
                                    ))),
                              ),
                              SizedBox(
                                height: screenHieght(30),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(MView(
                                    name: "الترجمة الكاثوليكية",
                                    id: "K",
                                    tp: 2,
                                  ));
                                },
                                child: Container(
                                    height: screenHieght(15),
                                    width: screenWidth(2),
                                    color: AppColors.mainOrangeColor,
                                    child: Center(
                                        child: Text(
                                      "العهد الجديد",
                                      style: TextStyle(
                                          fontSize: screenWidth(14),
                                          fontWeight: FontWeight.bold),
                                    ))),
                              ),
                            ],
                          ),
                        ));
                  },
                  child: CustomCont(text: controller.bishara.k!)),
              SizedBox(
                height: screenHieght(40),
              ),
              InkWell(
                  onTap: () {
                    Get.bottomSheet(
                        backgroundColor: AppColors.mainBackColor,
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'اختر العهد ',
                                style: TextStyle(
                                    fontSize: screenWidth(12),
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.mainblack),
                              ),
                              SizedBox(
                                height: screenHieght(30),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(MView(
                                    name: "الترجمة البولسية",
                                    id: "P",
                                    tp: 1,
                                  ));
                                },
                                child: Container(
                                    height: screenHieght(15),
                                    width: screenWidth(2),
                                    color: AppColors.mainOrangeColor,
                                    child: Center(
                                        child: Text(
                                      "العهد القديم",
                                      style: TextStyle(
                                          fontSize: screenWidth(14),
                                          fontWeight: FontWeight.bold),
                                    ))),
                              ),
                              SizedBox(
                                height: screenHieght(30),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(MView(
                                    name: "الترجمة البولسية",
                                    id: "P",
                                    tp: 2,
                                  ));
                                },
                                child: Container(
                                    height: screenHieght(15),
                                    width: screenWidth(2),
                                    color: AppColors.mainOrangeColor,
                                    child: Center(
                                        child: Text(
                                      "العهد الجديد",
                                      style: TextStyle(
                                          fontSize: screenWidth(14),
                                          fontWeight: FontWeight.bold),
                                    ))),
                              ),
                            ],
                          ),
                        ));
                  },
                  child: CustomCont(text: controller.bishara.p!)),
              SizedBox(
                height: screenHieght(40),
              ),
              InkWell(
                  onTap: () {
                    Get.bottomSheet(
                        backgroundColor: AppColors.mainBackColor,
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'اختر العهد ',
                                style: TextStyle(
                                    fontSize: screenWidth(12),
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.mainblack),
                              ),
                              SizedBox(
                                height: screenHieght(30),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(MView(
                                    name: "ترجمة كتاب الحياة",
                                    id: "H",
                                    tp: 1,
                                  ));
                                },
                                child: Container(
                                    height: screenHieght(15),
                                    width: screenWidth(2),
                                    color: AppColors.mainOrangeColor,
                                    child: Center(
                                        child: Text(
                                      "العهد القديم",
                                      style: TextStyle(
                                          fontSize: screenWidth(14),
                                          fontWeight: FontWeight.bold),
                                    ))),
                              ),
                              SizedBox(
                                height: screenHieght(30),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(MView(
                                    name: "ترجمة كتاب الحياة",
                                    id: "H",
                                    tp: 2,
                                  ));
                                },
                                child: Container(
                                    height: screenHieght(15),
                                    width: screenWidth(2),
                                    color: AppColors.mainOrangeColor,
                                    child: Center(
                                        child: Text(
                                      "العهد الجديد",
                                      style: TextStyle(
                                          fontSize: screenWidth(14),
                                          fontWeight: FontWeight.bold),
                                    ))),
                              ),
                            ],
                          ),
                        ));
                  },
                  child: CustomCont(text: controller.bishara.h!)),
              SizedBox(
                height: screenHieght(40),
              ),
              InkWell(
                  onTap: () {
                    Get.bottomSheet(
                        backgroundColor: AppColors.mainBackColor,
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'اختر العهد ',
                                style: TextStyle(
                                    fontSize: screenWidth(12),
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.mainblack),
                              ),
                              SizedBox(
                                height: screenHieght(30),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(MView(
                                    name: "النص السرياني",
                                    id: "SY",
                                    tp: 1,
                                  ));
                                },
                                child: Container(
                                    height: screenHieght(15),
                                    width: screenWidth(2),
                                    color: AppColors.mainOrangeColor,
                                    child: Center(
                                        child: Text(
                                      "العهد القديم",
                                      style: TextStyle(
                                          fontSize: screenWidth(14),
                                          fontWeight: FontWeight.bold),
                                    ))),
                              ),
                              SizedBox(
                                height: screenHieght(30),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(MView(
                                    name: "النص السرياني",
                                    id: "SY",
                                    tp: 2,
                                  ));
                                },
                                child: Container(
                                    height: screenHieght(15),
                                    width: screenWidth(2),
                                    color: AppColors.mainOrangeColor,
                                    child: Center(
                                        child: Text(
                                      "العهد الجديد",
                                      style: TextStyle(
                                          fontSize: screenWidth(14),
                                          fontWeight: FontWeight.bold),
                                    ))),
                              ),
                            ],
                          ),
                        ));
                  },
                  child: CustomCont(text: controller.bishara.sY!)),
              SizedBox(
                height: screenHieght(40),
              ),
              InkWell(
                  onTap: () {
                    Get.bottomSheet(
                        backgroundColor: AppColors.mainBackColor,
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'اختر العهد ',
                                style: TextStyle(
                                    fontSize: screenWidth(12),
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.mainblack),
                              ),
                              SizedBox(
                                height: screenHieght(30),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(MView(
                                    name: "النص اليوناني",
                                    id: "GR",
                                    tp: 1,
                                  ));
                                },
                                child: Container(
                                    height: screenHieght(15),
                                    width: screenWidth(2),
                                    color: AppColors.mainOrangeColor,
                                    child: Center(
                                        child: Text(
                                      "العهد القديم",
                                      style: TextStyle(
                                          fontSize: screenWidth(14),
                                          fontWeight: FontWeight.bold),
                                    ))),
                              ),
                              SizedBox(
                                height: screenHieght(30),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(MView(
                                    name: "النص اليوناني",
                                    id: "GR",
                                    tp: 2,
                                  ));
                                },
                                child: Container(
                                    height: screenHieght(15),
                                    width: screenWidth(2),
                                    color: AppColors.mainOrangeColor,
                                    child: Center(
                                        child: Text(
                                      "العهد الجديد",
                                      style: TextStyle(
                                          fontSize: screenWidth(14),
                                          fontWeight: FontWeight.bold),
                                    ))),
                              ),
                            ],
                          ),
                        ));
                  },
                  child: CustomCont(text: controller.bishara.gR!)),
              SizedBox(
                height: screenHieght(40),
              ),
              InkWell(
                  onTap: () {
                    Get.bottomSheet(
                        backgroundColor: AppColors.mainBackColor,
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'اختر العهد ',
                                style: TextStyle(
                                    fontSize: screenWidth(12),
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.mainblack),
                              ),
                              SizedBox(
                                height: screenHieght(30),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(MView(
                                    name: "النص العبري",
                                    id: "HE",
                                    tp: 1,
                                  ));
                                },
                                child: Container(
                                    height: screenHieght(15),
                                    width: screenWidth(2),
                                    color: AppColors.mainOrangeColor,
                                    child: Center(
                                        child: Text(
                                      "العهد القديم",
                                      style: TextStyle(
                                          fontSize: screenWidth(14),
                                          fontWeight: FontWeight.bold),
                                    ))),
                              ),
                              SizedBox(
                                height: screenHieght(30),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(MView(
                                    name: "النص العبري",
                                    id: "HE",
                                    tp: 2,
                                  ));
                                },
                                child: Container(
                                    height: screenHieght(15),
                                    width: screenWidth(2),
                                    color: AppColors.mainOrangeColor,
                                    child: Center(
                                        child: Text(
                                      "العهد الجديد",
                                      style: TextStyle(
                                          fontSize: screenWidth(14),
                                          fontWeight: FontWeight.bold),
                                    ))),
                              ),
                            ],
                          ),
                        ));
                  },
                  child: CustomCont(text: controller.bishara.hE!)),
              SizedBox(
                height: screenHieght(40),
              ),
              InkWell(
                  onTap: () {
                    Get.bottomSheet(
                        backgroundColor: AppColors.mainBackColor,
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'اختر العهد ',
                                style: TextStyle(
                                    fontSize: screenWidth(12),
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.mainblack),
                              ),
                              SizedBox(
                                height: screenHieght(30),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(MView(
                                    name: "النص الإنكليزي",
                                    id: "EN",
                                    tp: 1,
                                  ));
                                },
                                child: Container(
                                    height: screenHieght(15),
                                    width: screenWidth(2),
                                    color: AppColors.mainOrangeColor,
                                    child: Center(
                                        child: Text(
                                      "العهد القديم",
                                      style: TextStyle(
                                          fontSize: screenWidth(14),
                                          fontWeight: FontWeight.bold),
                                    ))),
                              ),
                              SizedBox(
                                height: screenHieght(30),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(MView(
                                    name: "النص الإنكليزي",
                                    id: "EN",
                                    tp: 2,
                                  ));
                                },
                                child: Container(
                                    height: screenHieght(15),
                                    width: screenWidth(2),
                                    color: AppColors.mainOrangeColor,
                                    child: Center(
                                        child: Text(
                                      "العهد الجديد",
                                      style: TextStyle(
                                          fontSize: screenWidth(14),
                                          fontWeight: FontWeight.bold),
                                    ))),
                              ),
                            ],
                          ),
                        ));
                  },
                  child: CustomCont(text: controller.bishara.eN!)),
              SizedBox(
                height: screenHieght(40),
              ),
              InkWell(
                  onTap: () {
                    Get.bottomSheet(
                        backgroundColor: AppColors.mainBackColor,
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'اختر العهد ',
                                style: TextStyle(
                                    fontSize: screenWidth(12),
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.mainblack),
                              ),
                              SizedBox(
                                height: screenHieght(30),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(MView(
                                    name: "النص الفرنسي",
                                    id: "FR",
                                    tp: 1,
                                  ));
                                },
                                child: Container(
                                    height: screenHieght(15),
                                    width: screenWidth(2),
                                    color: AppColors.mainOrangeColor,
                                    child: Center(
                                        child: Text(
                                      "العهد القديم",
                                      style: TextStyle(
                                          fontSize: screenWidth(14),
                                          fontWeight: FontWeight.bold),
                                    ))),
                              ),
                              SizedBox(
                                height: screenHieght(30),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(MView(
                                    name: "النص الفرنسي",
                                    id: "FR",
                                    tp: 2,
                                  ));
                                },
                                child: Container(
                                    height: screenHieght(15),
                                    width: screenWidth(2),
                                    color: AppColors.mainOrangeColor,
                                    child: Center(
                                        child: Text(
                                      "العهد الجديد",
                                      style: TextStyle(
                                          fontSize: screenWidth(14),
                                          fontWeight: FontWeight.bold),
                                    ))),
                              ),
                            ],
                          ),
                        ));
                  },
                  child: CustomCont(text: controller.bishara.fR!)),
            ],
          ),
        ),
      ),
    );
  }
}
