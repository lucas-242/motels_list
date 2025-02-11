import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moteis/injector.dart';
import 'package:moteis/presenter/home/components/motel_list.dart';
import 'package:moteis/presenter/home/cubit/home_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cubit = Injector.get<HomeCubit>();

  @override
  void initState() {
    cubit.getMotels();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: Scaffold(
        body: SafeArea(
          child: MotelList(),
        ),
      ),
    );
  }
}
