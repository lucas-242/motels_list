import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moteis/presenter/home/components/motel_info.dart';
import 'package:moteis/presenter/home/components/suite_list.dart';
import 'package:moteis/presenter/home/cubits/home_cubit.dart';
import 'package:moteis/presenter/home/pages/loading_page.dart';

class MotelList extends StatelessWidget {
  const MotelList({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();

    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(child: LoadingPage());
        }

        return RefreshIndicator(
          onRefresh: cubit.getMotels,
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final motel = cubit.state.motels[index];
                    return Column(
                      key: ValueKey('motel-$index'),
                      children: [
                        MotelInfo(motel: motel),
                        SuiteList(suites: motel.suites),
                      ],
                    );
                  },
                  childCount: cubit.state.motels.length,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
