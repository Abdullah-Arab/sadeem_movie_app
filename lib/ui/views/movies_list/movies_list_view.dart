import 'package:flutter/material.dart';
import 'package:movieapp/ui/shared/ui_helper.dart';
import 'package:stacked/stacked.dart';

import '/ui/widgets/stateless/app_bar.dart';
import 'movies_list_view_model.dart';

// ignore: must_be_immutable
class MoviesListView extends StatefulWidget {
  MoviesListView();

  @override
  _MoviesListViewState createState() => _MoviesListViewState();
}

class _MoviesListViewState extends State<MoviesListView>
    with SingleTickerProviderStateMixin {
  @override
  void didUpdateWidget(MoviesListView oldWidget) {
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
    return ViewModelBuilder<MoviesListViewModel>.reactive(
      viewModelBuilder: () => MoviesListViewModel(),
      onModelReady: (model) async {
        await model.init(context);
      },
      builder: (context, model, child) => Scaffold(
          backgroundColor: Colors.white,
          //drawer: Drawer(child: CustomerDrawerMenu()),
          appBar: MyAppBar(),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: TextFormField(
                            decoration: InputDecoration(
                                suffixIcon: Icon(Icons.search),
                                hintStyle: TextStyle(fontSize: 14),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                hintText: 'Search'),
                            onChanged: (value) {},
                          ),
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        child: Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: SizedBox(
                              height: 58,
                              child: DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(fontSize: 14),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                ),
                                value: 'Two',
                                iconEnabledColor: Colors.grey,
                                onChanged: (String? value) {},
                                items: <String>[
                                  'One',
                                  'Two',
                                  'Three',
                                  'Four'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            )),
                        flex: 1,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    child: ListView(
                      children: Iterable<int>.generate(20)
                          .map((e) => InkWell(
                                onTap: () async {

                                  model.moveToMovieViewRoute();

                                },
                                child: Card(
                                  elevation: 2,
                                  margin: EdgeInsets.all(8),
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.height / 7,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            //color: Colors.r,
                                            child: Image.network(
                                              'https://picsum.photos/250?image=9',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                            flex: 3,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 25, right: 25),
                                              child: Column(
                                                children: [
                                                  UIHelper.verticalSpaceLarge(),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        'The Godfather',
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      UIHelper
                                                          .horizontalSpaceSmall(),
                                                      Text('(2022)'),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        'Thriler',
                                                        style: TextStyle(),
                                                      ),
                                                      UIHelper
                                                          .horizontalSpaceSmall(),
                                                    ],
                                                  ),
                                                  UIHelper
                                                      .horizontalSpaceLarge(),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Expanded(
                                                          child: Text(
                                                        'The aging patriarch of an organized crime dynasty in postwar New York City transfers control of his clandestine empire to his reluctant youngest son.',
                                                        maxLines: 3,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(),
                                                      )),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                              )) // TODO move this section to staeLess widgets
                          .toList(),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
