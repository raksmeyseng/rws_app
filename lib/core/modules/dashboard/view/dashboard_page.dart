import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rws_app/config/themes/app_color.dart';
import 'package:rws_app/core/modules/dashboard/bloc/dashboard_bloc.dart';
import 'package:rws_app/core/modules/dashboard/enum/main_menu_enum.dart';
import 'package:rws_app/core/modules/login/widgets/app_logo.dart';
import 'package:rws_app/core/modules/map/view/maps_page.dart';
import 'package:rws_app/core/modules/my_task/view/my_task_page.dart';
import 'package:rws_app/core/modules/water_supply/view/water_supply_page.dart';
import 'package:rws_app/core/widgets/flat_card.dart';
import 'package:rws_app/core/widgets/text_widget.dart';
import 'package:rws_app/translation/generated/l10n.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

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
          bottomNavigationBar: _bottomNavigatrionBar(),
          body: IndexedStack(
            index: _currentIndex,
            children: const <Widget>[
              MapsPage(),
              WaterSupplyPage(),
              // ReportPage(),
              MyTaskPage(),
            ],
          ),
        );
      }),
    );
  }

  Widget _bottomNavigatrionBar() {
    return BottomNavigationBar(
      selectedFontSize: 12,
      unselectedItemColor: Theme.of(context).dividerColor,
      currentIndex: _currentIndex,
      onTap: _onTabTapped,
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.map),
          label: S.of(context).location_on_map,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.water),
          label: S.of(context).water_supply,
        ),
        // BottomNavigationBarItem(
        //   icon: const Icon(Icons.assessment),
        //   label: S.of(context).report,
        // ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.task),
          label: S.of(context).my_task,
        ),
      ],
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
