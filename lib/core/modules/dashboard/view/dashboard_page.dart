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

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DashboardBloc(index: index)..add(const DashboardStarted()),
      child: BlocBuilder<DashboardBloc, DashboardState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).primaryColor,
              title: const _TitleWidget(),
              centerTitle: true,
              iconTheme: const IconThemeData(color: AppColor.white),
            ),
            drawer: const _DrawerMenu(),
            bottomNavigationBar: const _BottomNavigationBar(),
            body: const _ContentView(),
          );
        },
      ),
    );
  }
}

class _ContentView extends StatelessWidget {
  const _ContentView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      buildWhen: (previous, current) =>
          previous.currentIndex != current.currentIndex,
      builder: (context, state) {
        return IndexedStack(
          index: state.currentIndex,
          children: const <Widget>[
            MapsPage(),
            WaterSupplyPage(),
            // ReportPage(),
            MyTaskPage(),
          ],
        );
      },
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      buildWhen: (previous, current) =>
          previous.currentIndex != current.currentIndex,
      builder: (context, state) {
        return BottomNavigationBar(
          selectedFontSize: 12,
          unselectedItemColor: Theme.of(context).dividerColor,
          currentIndex: state.currentIndex,
          onTap: (index) {
            context.read<DashboardBloc>().add(TabTapped(index));
          },
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
      },
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppLogo(size: 30),
        SizedBox(width: 16.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
    return Drawer(
      child: FlatCard(
        padding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const _AppLogo(),
            const Divider(),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => _MenuItem(
                  MainMenuEnum.values[index],
                  onSelected: (menu) {
                    Navigator.of(context).pop();
                    if (!menu.getRouteName().contains('home')) {
                      context.goNamed(menu.getRouteName());
                    }
                  },
                ),
                itemCount: MainMenuEnum.values.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  const _MenuItem(
    this.menu, {
    Key? key,
    required this.onSelected,
  }) : super(key: key);

  final MainMenuEnum menu;
  final void Function(MainMenuEnum menu) onSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.horizontal(right: Radius.circular(30)),
        child: FlatCard(
          onTap: () => onSelected(menu),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                menu.getIconData(),
                color: Theme.of(context).iconTheme.color,
              ),
              const SizedBox(width: 16.0),
              TextWidget(
                menu.getTitle(context),
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
    return const Padding(
      padding: EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppLogo(size: 40),
          SizedBox(width: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
