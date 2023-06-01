part of '../page.dart';

class _HeaderSection extends StatefulWidget {
  const _HeaderSection();

  @override
  State<_HeaderSection> createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<_HeaderSection> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: context.theme.scaffoldBackgroundColor,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, CartPage.routeName);
                },
                icon: Icon(
                  Icons.shopping_bag,
                  color: context.theme.scaffoldBackgroundColor,
                ),
              ),
            ],
          ),
          CarouselSlider(
            items: [1, 2, 3, 4, 5]
                .map(
                  (e) => const SmartNetworkImage(
                    'https://asset.kompas.com/crops/0goP7FKwWF1qhOgFdSg5Q9QEOXg=/14x0:547x355/750x500/data/photo/2020/02/03/5e37dfdc0013d.png',
                    width: double.infinity,
                    height: Dimens.dp250,
                    fit: BoxFit.cover,
                    radius: BorderRadius.zero,
                  ),
                )
                .toList(),
            carouselController: _controller,
            options: CarouselOptions(
              autoPlay: true,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [1, 2, 3, 4, 5].asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: _current == entry.key ? Dimens.dp16 : Dimens.dp6,
                  height: Dimens.dp6,
                  margin: const EdgeInsets.symmetric(
                    vertical: Dimens.dp8,
                    horizontal: Dimens.dp4,
                  ),
                  decoration: BoxDecoration(
                    color: _current == entry.key
                        ? context.theme.primaryColor
                        : context.theme.disabledColor.withOpacity(.5),
                    borderRadius: BorderRadius.circular(Dimens.dp6),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
