import 'package:flutter/material.dart';
import 'package:ndpc_web/core/utils/data_constant.dart';

import '../../core/utils/navigator_service.dart';

class HomePage extends StatelessWidget {
  final services = AppConstantData().serviceNames;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(80, 0, 80, 0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, // 4 columns
            crossAxisSpacing: 100,
            mainAxisSpacing: 60,
            childAspectRatio: 2.0, // Aspect ratio of 1:1 for square tiles
          ),
          itemCount: services.length, // 4x3 grid
          itemBuilder: (context, index) {
            return _buildTile(index);
          },
        ),
      ),
    );
  }

  // Helper method to build each tile
  Widget _buildTile(
    int index,
  ) {
    return GestureDetector(
      onTap: () {
        final page_route = services.values.elementAt(index);
        NavigatorService.pushNamed(page_route);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.6),
              offset: const Offset(5, 5),
              blurRadius: 10,
            ),
          ],
        ),
        child: Center(
          child: Text(
            "${services.keys.elementAt(index)} ",
            style: const TextStyle(
              // color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
