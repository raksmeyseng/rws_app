import 'package:rws_app/config/themes/app_color.dart';
import 'package:rws_app/config/themes/app_theme.dart';
import 'package:rws_app/core/modules/app/bloc/app_bloc.dart';
import 'package:rws_app/core/modules/app/widgets/auto_theme_item.dart';
import 'package:rws_app/core/modules/app/widgets/theme_item.dart';
import 'package:rws_app/core/widgets/app_bar_title.dart';
import 'package:rws_app/core/widgets/wrapper.dart';
import 'package:rws_app/translation/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppearancePage extends StatelessWidget {
  const AppearancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(title: S.of(context).appearance),
      ),
      body: const _Content(),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          SizedBox(height: 12.0),
          _ThemeMode(),
          // SizedBox(height: 16.0),
          // _PrimaryColor(),
          // SizedBox(height: 16.0),
          // _FontFamily(),
        ],
      ),
    );
  }
}

class _ThemeMode extends StatelessWidget {
  const _ThemeMode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      buildWhen: (previous, current) => previous.theme != current.theme,
      builder: (context, state) {
        return Card(
          elevation: 0,
          margin: EdgeInsets.zero,
          shape: const RoundedRectangleBorder(),
          child: SafeArea(
            bottom: false,
            child: Wrapper(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    //   child: TextWidget(
                    //     S.of(context).colorTheme,
                    //     bold: true,
                    //     primary: true,
                    //   ),
                    // ),
                    // const SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AutoThemeItem(
                          title: S.of(context).system,
                          foregroundColor: AppColor.textLight,
                          backgroundColor: AppColor.cardDark,
                          value: AutoTheme.key,
                          groupValue: state.theme.getKey(),
                          onChanged: (v) => _onThemeChanged(context, v),
                        ),
                        ThemeItem(
                          title: S.of(context).light,
                          foregroundColor: AppColor.textLight,
                          backgroundColor: AppColor.card,
                          value: LightTheme.key,
                          groupValue: state.theme.getKey(),
                          onChanged: (v) => _onThemeChanged(context, v),
                        ),
                        ThemeItem(
                          title: S.of(context).dark,
                          foregroundColor: AppColor.white,
                          backgroundColor: AppColor.cardDark,
                          value: DarkTheme.key,
                          groupValue: state.theme.getKey(),
                          onChanged: (v) => _onThemeChanged(context, v),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _onThemeChanged(BuildContext context, String? key) {
    final options = context.read<AppBloc>().state.themeOptions;
    final theme = AppThemeFactory.buildTheme(key, themeOptions: options);
    context.read<AppBloc>().add(ThemeChanged(theme: theme));
  }
}

// class _PrimaryColor extends StatelessWidget {
//   const _PrimaryColor({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<AppBloc, AppState>(
//       buildWhen: (previous, current) =>
//           previous.themeOptions != current.themeOptions,
//       builder: (context, state) {
//         const colors = AppColor.primaryColors;
//         return Card(
//           elevation: 0,
//           margin: EdgeInsets.zero,
//           shape: const RoundedRectangleBorder(),
//           child: SafeArea(
//             bottom: false,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(vertical: 16.0),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                     child: TextWidget(
//                       S.of(context).primary_color,
//                       bold: true,
//                       primary: true,
//                     ),
//                   ),
//                   const SizedBox(height: 8.0),
//                   Row(
//                     children: List.generate(
//                       colors.length,
//                       (index) {
//                         return Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                           child: IconButton(
//                             onPressed: () {
//                               context
//                                   .read<AppBloc>()
//                                   .add(PrimaryColorChanged(colors[index]));
//                             },
//                             icon: Container(
//                               width: 35,
//                               height: 35,
//                               decoration: BoxDecoration(
//                                 color: colors[index],
//                                 shape: BoxShape.circle,
//                               ),
//                               // padding: const EdgeInsets.all(8),
//                               alignment: Alignment.center,
//                               child: colors[index]
//                                           .value
//                                           .toRadixString(16)
//                                           .toLowerCase() ==
//                                       state.themeOptions.primaryColorHex
//                                   ? const Icon(
//                                       Icons.check,
//                                       color: Colors.white,
//                                     )
//                                   : Container(),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// class _FontFamily extends StatelessWidget {
//   const _FontFamily({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     const fonts = AppConstants.primaryFonts;
//     return BlocBuilder<AppBloc, AppState>(
//       buildWhen: (previous, current) =>
//           previous.themeOptions != current.themeOptions,
//       builder: (context, state) {
//         return Card(
//           elevation: 0,
//           margin: EdgeInsets.zero,
//           shape: const RoundedRectangleBorder(),
//           child: SafeArea(
//             bottom: false,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(vertical: 16.0),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                     child: TextWidget(
//                       S.of(context).font_family,
//                       bold: true,
//                       primary: true,
//                     ),
//                   ),
//                   const SizedBox(height: 8.0),
//                   Padding(
//                     padding: const EdgeInsets.all(8),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: List.generate(
//                         fonts.length,
//                         (index) {
//                           return Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Container(
//                               width: double.infinity,
//                               decoration: BoxDecoration(
//                                 border: Border.all(
//                                   color: fonts[index] ==
//                                           state.themeOptions.fontFamily
//                                       ? Theme.of(context).primaryColor
//                                       : Theme.of(context).backgroundColor,
//                                   width: 2,
//                                 ),
//                                 borderRadius: BorderRadius.circular(16.0),
//                               ),
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(16),
//                                 child: Material(
//                                   color: Colors.transparent,
//                                   child: InkWell(
//                                     onTap: () {
//                                       context
//                                           .read<AppBloc>()
//                                           .add(FontFamilyChanged(fonts[index]));
//                                     },
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(16.0),
//                                       child: Column(
//                                         mainAxisSize: MainAxisSize.min,
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           TextWidget(fonts[index], bold: true),
//                                           const SizedBox(height: 16.0),
//                                           CaptionWidget(
//                                             S.of(context).font_sample_text,
//                                             font: fonts[index],
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// class _FontFamilyCard extends StatelessWidget {
//   const _FontFamilyCard({
//     Key? key,
//     required this.title,
//     required this.caption,
//     required this.selected,
//   }) : super(key: key);

//   final String title;
//   final String caption;
//   final bool selected;

//   @override
//   Widget build(BuildContext context) {
//     return RadioListTile(value: value, groupValue: groupValue, onChanged: onChanged)
//   }
// }
