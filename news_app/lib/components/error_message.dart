import 'package:flutter/material.dart';
import 'package:news_app/viewmodels/news_view_model.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({super.key, required this.viewModel});

  final NewsViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(viewModel.errorMessage ?? 'Something went wrong.'),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: viewModel.loadNews,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              foregroundColor: Colors.black,
            ),
            child: const Text('Retry Loading'),
          ),
        ],
      ),
    );
  }
}
