import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rws_app/config/themes/app_color.dart';
import 'package:rws_app/core/modules/dashboard/bloc/dashboard_bloc.dart';
import 'package:rws_app/core/modules/dashboard/enum/main_menu_enum.dart';
import 'package:rws_app/core/modules/dashboard/view/dashboard_view.dart';
import 'package:rws_app/core/modules/login/widgets/app_logo.dart';
import 'package:rws_app/core/widgets/flat_card.dart';
import 'package:rws_app/core/widgets/text_widget.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return BlocProvider(
      create: (context) => DashboardBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            title: const _TitleWidget(),
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(
                Icons.menu,
                color: AppColor.white,
              ),
              onPressed: () {
                if (scaffoldKey.currentState!.isDrawerOpen) {
                  scaffoldKey.currentState!.closeDrawer();
                } else {
                  scaffoldKey.currentState!.openDrawer();
                }
              },
            ),
          ),
          drawer: const _DrawerMenu(),
          body: const DashboardView(),
        );
      }),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const AppLogo(size: 30),
        const SizedBox(width: 16.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            TextWidget(
              'ក្រសួងអភិវឌ្ឃន៍ជនបទ',
              bold: true,
              size: 14,
              color: AppColor.white,
            ),
            TextWidget(
              'Ministry of Rural Development',
              bold: true,
              size: 10,
              color: AppColor.white,
            ),
          ],
        ),
      ],
    );
  }
}

class _DrawerMenu extends StatelessWidget {
  const _DrawerMenu();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      buildWhen: (previous, current) =>
          previous.selectedMenu != current.selectedMenu,
      builder: (context, state) {
        return Drawer(
          child: FlatCard(
            padding: EdgeInsets.zero,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const _AppLogo(),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.only(top: 16.0),
                    itemBuilder: (context, index) => _MenuItem(
                      MainMenuEnum.values[index],
                      selected:
                          MainMenuEnum.values[index] == state.selectedMenu,
                      onSelected: (menu) {
                        Navigator.of(context).pop();
                        context.goNamed(menu.getRouteName());
                      },
                    ),
                    itemCount: MainMenuEnum.values.length,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _MenuItem extends StatelessWidget {
  const _MenuItem(
    this.menu, {
    Key? key,
    required this.selected,
    required this.onSelected,
  }) : super(key: key);

  final MainMenuEnum menu;
  final bool selected;
  final void Function(MainMenuEnum menu) onSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.horizontal(right: Radius.circular(30)),
        child: FlatCard(
          onTap: () => onSelected(menu),
          color:
              selected ? Theme.of(context).primaryColor.withOpacity(.1) : null,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                menu.getIconData(),
                color: selected
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).iconTheme.color,
              ),
              const SizedBox(width: 16.0),
              TextWidget(
                menu.getTitle(context),
                color: selected ? Theme.of(context).primaryColor : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AppLogo extends StatelessWidget {
  const _AppLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const AppLogo(size: 40),
          const SizedBox(width: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              TextWidget(
                'ក្រសួងអភិវឌ្ឃន៍ជនបទ',
                bold: true,
                size: 14,
                primary: true,
              ),
              TextWidget(
                'Ministry of Rural Development',
                bold: true,
                size: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
