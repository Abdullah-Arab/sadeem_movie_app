import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '/ui/widgets/stateless/app_bar.dart';
import 'actors_list_view_model.dart';

// ignore: must_be_immutable
class ActorsListView extends StatefulWidget {
  ActorsListView();

  @override
  _ActorsListViewState createState() => _ActorsListViewState();
}

class _ActorsListViewState extends State<ActorsListView>
    with SingleTickerProviderStateMixin {
  @override
  void didUpdateWidget(ActorsListView oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ActorsListViewModel>.reactive(
      viewModelBuilder: () => ActorsListViewModel(),
      onModelReady: (model) async {
        await model.init(context);
      },
      builder: (context, model, child) => Scaffold(
          // drawer: Drawer(child: CustomerDrawerMenu()),
          appBar: MyAppBar(),
          body: Container(
            child: Center(child: Text('ActorsListView')),
          )),
    );
  }
}
