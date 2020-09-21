import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ytsbloc/bloc/user_bloc.dart';
import 'package:ytsbloc/newmodel/user.dart';
import 'package:ytsbloc/newmodel/userresponse.dart';


class UserWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _UserWidgetState();
  }
}

class _UserWidgetState extends State<UserWidget> {

@override
  void initState() {
    super.initState();
    userBloc.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserResponse>(
      stream: userBloc.subject.stream,
      builder: (context, AsyncSnapshot<UserResponse> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.error != null && snapshot.data.error.length > 0){
            return _buildErrorWidget(snapshot.data.error);
          }
          return _buildUserWidget(snapshot.data);

        } else if (snapshot.hasError) {
          return _buildErrorWidget(snapshot.error);
        } else {
          return _buildLoadingWidget();
        }
      },
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text("Loading data from API..."), CircularProgressIndicator()],
    ));
  }

  Widget _buildErrorWidget(String error) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Error occured: $error"),
      ],
    ));
  }

  Widget _buildUserWidget(UserResponse data) {
  User user = data.results[0];
  return Center(
      child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      CircleAvatar(
        radius: 70,
        backgroundImage: NetworkImage(user.picture.large),
      ),
      Text(
        "${(user.name.first).toLowerCase()} ${(user.name.last).toUpperCase()}",
        style: Theme.of(context).textTheme.title,
      ),
      Text(user.email, style: Theme.of(context).textTheme.subtitle),
      Padding(
        padding: EdgeInsets.only(top: 5),
      ),
      Text(user.location.street, style: Theme.of(context).textTheme.body1),
      Padding(
        padding: EdgeInsets.only(top: 5),
      ),
      Text(user.location.city, style: Theme.of(context).textTheme.body1),
      Padding(
        padding: EdgeInsets.only(top: 5),
      ),
      Text(user.location.state, style: Theme.of(context).textTheme.body1),
    ],
  ));
}
}