import 'package:flutter/material.dart';
import 'package:movieapp/shared/app_theme.dart';

class ErrorIndicator extends StatelessWidget {
  const ErrorIndicator({super.key, this.errorMessage});
  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage ?? 'Something went wrong',
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: AppTheme.white,
            ),
      ),
    );
  }
}
