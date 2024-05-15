import 'package:cached_network_image/cached_network_image.dart';
import 'package:doodle_blur_task/view/bloc/business_bloc.dart';
import 'package:doodle_blur_task/view/bloc/business_event.dart';
import 'package:doodle_blur_task/view/bloc/business_state.dart';
import 'package:doodle_blur_task/view/screens/business_details_sccreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BusinessScreen extends StatefulWidget {
  const BusinessScreen({super.key});

  @override
  _BusinessScreenState createState() => _BusinessScreenState();
}

class _BusinessScreenState extends State<BusinessScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BusinessBloc()
        ..add(GetBusinessesEvent()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Businesses"),
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
                    itemCount: state.data.length,
                    itemBuilder: (context, index){
                      return ListTile(
                        onTap: ()
                        {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => BusinessDetails(model: state.data[index])));
                        },
                        leading: SizedBox(width: 100,height: 100,child: CachedNetworkImage(imageUrl: state.data[index].image)),
                        title: Text(state.data[index].title),
                        subtitle: Text(state.data[index].description),
                      );
                    });
              }
              return const SizedBox();
            }
        ),
      ),
    );
  }
}
