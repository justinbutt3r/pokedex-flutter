import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    Key? key,
    required this.title,
    this.widthRatio = 3.4,
    required this.isActive,
    required this.onClick,
    this.pageNumber = 0,
  }) : super(key: key);

  final String title;
  final double widthRatio;
  final bool isActive;
  final void Function(int pageNumber) onClick;
  final int pageNumber;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / widthRatio,
      child: OutlinedButton(
        onPressed: () {
          onClick(pageNumber);
        },
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: isActive
                ? Theme.of(context).toggleableActiveColor
                : Theme.of(context).primaryColorLight,
          ),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodySmall,
          // style: TextStyle(color: isActive ? Colors.white : Colors.white54),
        ),
      ),
    );
  }
}
