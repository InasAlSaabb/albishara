import 'package:flutter_templete/core/data/models/apis/bishara_model.dart';
import 'package:flutter_templete/core/services/base_controller.dart';

class BibleController extends BaseController {
  bisharaModel bishara = bisharaModel(
      m: "الترجمة المشتركة دار الكتاب المقدس",
      v: "ترجمة فاندايك",
      k: "الترجمة الكاثوليكية",
      p: "الترجمة البولسية",
      h: "ترجمة كتاب الحياة",
      sY: "النص السرياني",
      gR: "النص اليوناني",
      hE: "النص العبري",
      eN: "النص الإنكليزي",
      fR: "النص الفرنسي");
}
