import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamo_mobile/core/core.dart';
import 'package:shamo_mobile/features/cart/cart.dart';
import 'package:shamo_mobile/features/chat/chat.dart';
import 'package:shamo_mobile/features/favorite/favorite.dart';
import 'package:shamo_mobile/features/home/home.dart';
import 'package:shamo_mobile/features/product/product.dart';
import 'package:shamo_mobile/features/settings/settings.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  static const String routeName = '/main';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavBloc(),
      child: const MainView(),
    );
  }
}

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final List<Widget> _pages = [
    const HomePage(),
    const ChatPage(),
    const FavoritePage(),
    const AccountPage(),
  ];

  @override
  void initState() {
    context.read<UserBloc>().add(GetUserDetailEvent());
    context.read<CategoryBloc>().add(GetCategoriesEvent());
    context.read<PopularBloc>().add(GetPopularProductEvent());
    context.read<ProductBloc>().add(
          const GetListProductEvent(page: 2, categoryId: ''),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBloc, int>(
      builder: (context, index) {
        return Scaffold(
          body: _pages[index],
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, CartPage.routeName);
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimens.dp100),
            ),
            child: const Icon(Icons.shopping_bag),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: bottomNavBar(index, context),
        );
      },
    );
  }

  ClipRRect bottomNavBar(int index, BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(Dimens.dp20),
      ),
      child: BottomAppBar(
        notchMargin: 6,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          currentIndex: index,
          onTap: (v) {
            context.read<BottomNavBloc>().add(BottomNavChanged(v));
          },
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home_rounded),
            ),
            BottomNavigationBarItem(
              label: 'Chat',
              icon: Icon(CupertinoIcons.chat_bubble_2_fill),
            ),
            BottomNavigationBarItem(
              label: 'Favorite',
              icon: Icon(Icons.favorite_rounded),
            ),
            BottomNavigationBarItem(
              label: 'Account',
              icon: Icon(CupertinoIcons.person_solid),
            ),
          ],
        ),
      ),
    );
  }
}
