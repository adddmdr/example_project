import 'package:example_project/application/home_screen/home_screen_cubit.dart';
import 'package:example_project/core/di/di.dart';
import 'package:example_project/presentation/home_screen/widgets/home_screen_content_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenPage extends StatelessWidget {
  const HomeScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt.get<HomeScreenCubit>()..getEpisodes(),
        child: HomeScreenContentView(),
      ),
    );
  }
}
