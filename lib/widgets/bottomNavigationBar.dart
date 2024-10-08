import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int selectedPage;
  final Function(int) onPageSelected;

  const BottomNavigationBarWidget({
    Key? key,
    required this.selectedPage,
    required this.onPageSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<IconData> icons = [
      Icons.home_outlined,
      Icons.favorite_outline_rounded,
      Icons.chat_outlined,
      Icons.person_outline_rounded,
    ];

    return Container(
      height: 60,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          icons.length,
          (index) => GestureDetector(
            onTap: () {
              onPageSelected(index);
            },
            child: Container(
              height: 60,
              width: 50,
              padding: const EdgeInsets.all(5),
              child: Stack(
                children: [
                  SizedBox(
                    height: 60,
                    width: 50,
                    child: Column(
                      children: [
                        Icon(
                          icons[index],
                          color: selectedPage == index
                              ? Colors.blue
                              : Colors.black.withOpacity(0.6),
                        ),
                        const SizedBox(height: 5),
                        selectedPage == index
                            ? Container(
                                height: 5,
                                width: 5,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle, color: Colors.blue),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                  index == 2
                      ? Positioned(
                          right: 0,
                          top: -5,
                          child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.blue),
                              child: const Text(
                                '6',
                                style: TextStyle(color: Colors.white),
                              )))
                      : Container(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
