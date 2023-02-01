import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project/generated/l10n.dart';
import 'package:project/src/ui/delivery_package/cubits/statistic/statistic_cubit.dart';
import 'package:project/src/ui/delivery_package/data/model/statistics/statistic_model.dart';

import '../../Shared/constant.dart';

class PerformanceScreen extends StatefulWidget {
  const PerformanceScreen({Key? key}) : super(key: key);

  @override
  State<PerformanceScreen> createState() => _PerformanceScreenState();
}

class _PerformanceScreenState extends State<PerformanceScreen> {
  late StatisticCubit _statisticCubit;
  StatisticModel? _model;

  @override
  void initState() {
    _statisticCubit = BlocProvider.of<StatisticCubit>(context);
    _statisticCubit.getStatistic();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<StatisticCubit, StatisticState>(
        listener: (BuildContext context, state) {
          if (state is StatisticSuccess) {
            print("StatisticSuccess : ${state.response}");
            _model = state.response.data;
            setState(() {});
          }
        },
        child: SingleChildScrollView(
            child: Column(children: [
          const SizedBox(height: 25),
          Row(children: [
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(S.current.performance_details,
                    style: const TextStyle(
                        color: textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400)))
          ]),
          GridView.count(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              primary: false,
              padding: const EdgeInsets.all(20),
              childAspectRatio:
                  (MediaQuery.of(context).orientation == Orientation.landscape)
                      ? 2
                      : 1,
              crossAxisSpacing: 16,
              mainAxisSpacing: 12,
              crossAxisCount: 2,
              children: List.generate(4, (index) {
                return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: performaceCardcolor)),
                    child: index == 0
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                Text(S.current.number_of_orders,
                                    style: const TextStyle(
                                        color: textColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)),
                                const SizedBox(height: 13),
                                Text(
                                    '${_model?.countOrder ?? 0} ${S.current.completed_order}',
                                    style: const TextStyle(
                                        color: textColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700))
                              ])
                        : index == 1
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                    Text(S.current.working_hours,
                                        style: const TextStyle(
                                            color: textColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400)),
                                    const SizedBox(height: 13),
                                    Text(_model?.hours.toString() ?? '0',
                                        style: const TextStyle(
                                            color: textColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700))
                                  ])
                            : index == 2
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                        Text(S.current.rating,
                                            style: const TextStyle(
                                                color: textColor,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400)),
                                        const SizedBox(height: 13),
                                        RatingBarIndicator(
                                            rating: _model?.rating ?? 0.0,
                                            unratedColor: Colors.grey,
                                            itemCount: 5,
                                            itemSize: 14,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return const Icon(Icons.star,
                                                  color: Colors.amber);
                                            }),
                                      ])
                                : index == 3
                                    ? Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                            Text(S.current.acceptance_rate,
                                                style: const TextStyle(
                                                    color: textColor,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                            const SizedBox(height: 13),
                                            Text('${_model?.acceptance ?? 0} %',
                                                style: const TextStyle(
                                                    color: textColor,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w700))
                                          ])
                                    : null);
              }))
        ])));
  }
}
