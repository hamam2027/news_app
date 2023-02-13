import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/componants/componants.dart';
import 'package:news_app/cubit/appcubit.dart';
import 'package:news_app/cubit/appstate.dart';

class Business extends StatelessWidget {
  const Business({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, Appstate>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          AppCubit cubit = AppCubit.get(context);
          if (cubit.business.isEmpty) {
            cubit.getbussiness();
          }

          var list = cubit.business;

          return ConditionalBuilder(
              condition: list.isNotEmpty,
              fallback: (context) => const Center(
                    child: CircularProgressIndicator(),
                  ),
              builder: (context) => ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: ((context, index) =>
                        BuldArticalItem(list[index], context)),
                    itemCount: list.length,
                    separatorBuilder: ((context, index) {
                      return Container(
                        color: Colors.black,
                        height: 1,
                        width: double.infinity,
                      );
                    }),
                  ));
        });
  }
}
