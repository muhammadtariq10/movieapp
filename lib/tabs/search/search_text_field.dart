import 'package:flutter/material.dart';
import 'package:movieapp/app_theme.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key, this.controller, this.onChanged});
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppTheme.darkGrey,
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          )),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: AppTheme.white,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: AppTheme.white,
              fontSize: 18,
            ),
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: AppTheme.white.withOpacity(.4),
              ),
          border: InputBorder.none,
          prefixIcon: const Icon(
            Icons.search,
            color: AppTheme.white,
          ),
        ),
      ),
    );
  }
}
