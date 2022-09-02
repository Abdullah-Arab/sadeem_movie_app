import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movieapp/core/models/movie/movie.dart';
import 'package:stacked/stacked.dart';

import '../../../core/models/actor/actor.dart';

class ActorViewModel extends BaseViewModel {
  BuildContext? context;
  Actor? actor;

  Future<void> init(BuildContext context, Actor Actor) async {
    this.context = context;

    setBusy(true);

    this.actor = Actor;

    setBusy(false);
  }
}
