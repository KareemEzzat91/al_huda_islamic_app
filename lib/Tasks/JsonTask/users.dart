import 'package:al_huda_islamic_app/Tasks/JsonTask/TaskCubit/tasks_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'UsersDetails/UsersDetails.dart';
import 'UsersModel/Usersmodel.dart';

class Users extends StatelessWidget {
  const Users({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<TasksCubit>();
    return Scaffold(
      body: FutureBuilder<List<UsersModel>>(
        future: bloc.getUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No users found"));
          }

          final usersData = snapshot.data ??[];
          return ListView.builder(
            itemCount: usersData.length,
            itemBuilder: (context, index) {
              final user = usersData[index];
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder:(contex)=>Usersdetails(item: user,) ));
                },
                child: ListTile(
                  title: Text(user.username ?? "No Username"),
                  subtitle: Text(user.email ?? "No Email"),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
