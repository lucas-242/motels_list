import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moteis/presenter/home/components/motel_info.dart';
import 'package:moteis/presenter/home/components/suite_list.dart';
import 'package:moteis/presenter/home/cubit/home_cubit.dart';

class MotelList extends StatelessWidget {
  const MotelList({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: cubit.state.motels.length,
          itemBuilder: (context, index) {
            final motel = cubit.state.motels[index];
            return Column(
              children: [
                MotelInfo(motel: motel),
                SuiteList(suites: motel.suites),
              ],
            );
          },
        );
      },
    );
  }
}
