import 'package:flutter/material.dart';
import 'package:application/application.dart';
import 'package:infrastructure/infrastructure.dart';
import 'home_router_impl.dart';

class HomeView extends StatefulWidget {

  const HomeView({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return HomeViewState();
  }
  
}

class HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final viewModel = HomeViewModel(HomeRouterImpl(), GameRepositoryImpl());
    viewModel.load();
    return const Center(
      child: Text("Hello"),
    );
  }
  
}
