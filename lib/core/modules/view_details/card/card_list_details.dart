import 'package:flutter/material.dart';
import 'package:rws_app/core/widgets/caption_widget.dart';
import 'package:rws_app/core/widgets/flat_card.dart';
import 'package:rws_app/core/widgets/text_widget.dart';

class CardListDetails extends StatefulWidget {
  const CardListDetails({Key? key}) : super(key: key);

  @override
  State<CardListDetails> createState() => _CardListDetailsState();
}

class _CardListDetailsState extends State<CardListDetails> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: titleViews.length,
        itemBuilder: (BuildContext context, int index) {
          return FlatCard(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 16,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: CaptionWidget(
                    '${titleViews[index]} : ',
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: TextWidget(
                    valueViews[index],
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  List<String> titleViews = [
    'ប្រភេទ',
    'លេខកូដសំនង់',
    'ខេត្ត/រាជធានី',
    'ស្រុក/ក្រុង',
    'ឃុំ/សង្កាត់',
    'ភូមិ',
    'ខ្នាតផែនទី',
    'កូអរដោនេ UTMX',
    'កូអរដោនេ UTMY',
    'គ្រួសារសរុប',
    'តំបន់ប្រឈមផ្នែកបរិស្ថាន',
    'ប្រភពថវិកា',
    'ប្រភេទនៃការគ្រប់គ្រង',
    'អ្នកទទួលផលសរុប',
    'អ្នកទទួលផលគ្រួសារសរុប',
    'អ្នកទទួលផលគ្រួសារក្រ២',
    'អ្នកទទួលផលគ្រួសារជនជាតិដើមភាគតិច'
  ];

  List<String> valueViews = [
    'អណ្ដូង',
    '8076',
    'ពោធិ៍សាត់',
    'ពោធិ៍សាត់',
    'ផ្ទះព្រៃ',
    'ចំការចេកជើង',
    'UTM',
    '338734.000000000000000',
    '1503624.000000000000000',
    '0',
    '១.មិនប្រឈម',
    '០.រដ្ឋ',
    '០.សហគមន៍',
    '0',
    '0',
    '0',
    '0'
  ];
}
