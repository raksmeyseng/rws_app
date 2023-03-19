import 'package:flutter/material.dart';
import 'package:rws_app/core/style/fonts/app_style.dart';

class CardListDetails extends StatelessWidget {
  CardListDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 5.0),
      child: Container(
        color: Colors.white,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: titleViews.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(flex: 2, child: Text(titleViews[index], style: h3StyleDetails)),
                  const Text(':'),
                  Expanded(flex: 1, child: Text(valueViews[index], style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 15.0), textAlign: TextAlign.end)),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  List<String> titleViews = ['ប្រភេទ','លេខកូដសំនង់','ខេត្ត/រាជធានី','ស្រុក/ក្រុង','ឃុំ/សង្កាត់','ភូមិ','ខ្នាតផែនទី','កូអរដោនេ UTMX','កូអរដោនេ UTMY','គ្រួសារសរុប','តំបន់ប្រឈមផ្នែកបរិស្ថាន','ប្រភពថវិកា','ប្រភេទនៃការគ្រប់គ្រង','អ្នកទទួលផលសរុប','អ្នកទទួលផលគ្រួសារសរុប','អ្នកទទួលផលគ្រួសារក្រ២','អ្នកទទួលផលគ្រួសារជនជាតិដើមភាគតិច','ប្រភេទអណ្ដូង','ជម្រៅតម្រង','នីរ៉ូស្តាទិច','គុណភាពទឹក','ស្ថានភាពអណ្ដូងទឹក','លេខកូដសំនង់','កាលបរិច្ឆេទសាងសង់','សាងសង់ដោយក្រុមហ៊ុន','មោះអ្នកគ្រប់គ្រង','អ្នកទទួលផលសរុបស្រី','អ្នកទទួលផលគ្រួសារក្រ១','អ្នកទទួលផលគ្រួសារជនងាយរងគ្រោះ','ជម្រៅអណ្ដូង','ធារទឹក','នីរ៉ូឌីណាមិច','ត្រួតពិនិត្យគុណភាពទឹក','(ហេតុអ្វី)'];
  List<String> valueViews = ['អណ្ដូង','8076','ពោធិ៍សាត់','ពោធិ៍សាត់','ផ្ទះព្រៃ','ចំការចេកជើង','UTM','338734.000000000000000','1503624.000000000000000','0','១.មិនប្រឈម','០.រដ្ឋ','០.សហគមន៍','0','0','0','0','1 - អណ្ដូងស្នប់អាហ្វ្រីដេហ្វ','100','0','ល្អ','ដំណើរការ','8076','2008-02-13','','','0','0','0','32','2','0','បាន',''];
}


