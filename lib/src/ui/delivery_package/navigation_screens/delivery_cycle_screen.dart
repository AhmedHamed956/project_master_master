import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/src/ui/delivery_package/cubits/delivery/delivery_cubit.dart';
import 'package:project/src/ui/delivery_package/cubits/statistic/statistic_cubit.dart';
import 'package:project/src/ui/delivery_package/cubits/tracking/tracking_cubit.dart';
import 'package:project/src/ui/delivery_package/navigation_screens/nav_screen.dart';

class DeliveryCycleScreen extends StatefulWidget {
  @override
  State<DeliveryCycleScreen> createState() => _DeliveryCycleScreenState();
}

class _DeliveryCycleScreenState extends State<DeliveryCycleScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => DeliveryCubit()),
      BlocProvider(create: (context) => TrackingCubit()),
      BlocProvider(create: (context) => StatisticCubit()),
    ], child: const DeliveryHomeScreen());
  }
}
