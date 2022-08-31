import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../core/services/navigation/navigation_service.dart';
import '../../../locator.dart';
import '../../router.gr.dart';

class MoviesListViewModel extends BaseViewModel {
  BuildContext? context;

  Future<void> init(BuildContext context) async {
    this.context = context;

    setBusy(true);

    setBusy(false);
  }

  Future<void> moveToMovieViewRoute() async {
    await locator<NavigationService>().pushNamed(MovieViewRoute(), context!);
  }
}
