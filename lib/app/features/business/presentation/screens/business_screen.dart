import 'package:cached_network_image/cached_network_image.dart';
import 'package:doodle_blur_task/app/core/boot_up/injection_container.dart';
import 'package:doodle_blur_task/app/features/business/presentation/bloc/business_bloc.dart';
import 'package:doodle_blur_task/app/features/business/presentation/bloc/business_event.dart';
import 'package:doodle_blur_task/app/features/business/presentation/bloc/business_state.dart';
import 'package:doodle_blur_task/app/features/business/presentation/widget/business_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'business_details_screen.dart';

class BusinessScreen extends StatefulWidget {
  const BusinessScreen({super.key});

  @override
  _BusinessScreenState createState() => _BusinessScreenState();
}

class _BusinessScreenState extends State<BusinessScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BusinessBloc(businessUseCase: serviceLocator())
        ..add(GetBusinessesEvent()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade600,
          title: const Text("My Businesses",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),),
        ),
        body: BlocBuilder<BusinessBloc, BusinessState>(
            builder: (context, state)
            {
              if(state is LoadingState)
              {
                return const  Center(child: CircularProgressIndicator(),);
              }
              if(state is ErrorState)
              {
                return Text(state.msg);
              }

              if(state is LoadedState)
              {
                return ListView.builder(
                    itemCount: state.data.businesses.length,
                    itemBuilder: (context, index){
                      return BusinessItem(model: state.data.businesses[index]);
                    });
              }
              return const SizedBox();
            }
        ),
      ),
    );
  }
}
