import 'dart:io';

import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';

enum SoundIds {
  DogButton,
  CatButton,
  ElephantButton,
  LeoButton,
  HorseButton,
  PiyoButton,
  BicycleButton,
  BikeButton,
  FuneButton,
  KyuKyuSyaButton,
  PatocarButton,
  SuperCarButton
}

class Sound {
  String os = Platform.operatingSystem;
  bool isIOS = Platform.isIOS;
  late Soundpool _soundPool;

  final Map<SoundIds, int> _seContainer = Map<SoundIds, int>();
  final Map<int, int> _streamContainer = Map<int, int>();

  Sound() {
    this._soundPool = Soundpool.fromOptions(
        options: SoundpoolOptions(
            streamType: StreamType.music, maxStreams: 5 // 5音同時発音に対応させる
            ));
    () async {
      var dogButton = await rootBundle
          .load("assets/sounds/dog.mp3")
          .then((value) => this._soundPool.load(value));
      var catButton = await rootBundle
          .load("assets/sounds/cat.mp3")
          .then((value) => this._soundPool.load(value));
      var elephantButton = await rootBundle
          .load("assets/sounds/elephant.mp3")
          .then((value) => this._soundPool.load(value));
      var leoButton = await rootBundle
          .load("assets/sounds/leo.mp3")
          .then((value) => this._soundPool.load(value));
      var horseButton = await rootBundle
          .load("assets/sounds/horse.mp3")
          .then((value) => this._soundPool.load(value));
      var piyoButton = await rootBundle
          .load("assets/sounds/piyo.mp3")
          .then((value) => this._soundPool.load(value));
      var bicycleButton = await rootBundle
          .load("assets/sounds/bicycle.mp3")
          .then((value) => this._soundPool.load(value));
      var bikeButton = await rootBundle
          .load("assets/sounds/bike.mp3")
          .then((value) => this._soundPool.load(value));
      var funeButton = await rootBundle
          .load("assets/sounds/fune.mp3")
          .then((value) => this._soundPool.load(value));
      var kyukyusyaButton = await rootBundle
          .load("assets/sounds/kyukyusya.mp3")
          .then((value) => this._soundPool.load(value));
      var patocarButton = await rootBundle
          .load("assets/sounds/patocar.mp3")
          .then((value) => this._soundPool.load(value));
      var superCarButton = await rootBundle
          .load("assets/sounds/super_car.mp3")
          .then((value) => this._soundPool.load(value));

      this._seContainer[SoundIds.DogButton] = dogButton;
      this._seContainer[SoundIds.CatButton] = catButton;
      this._seContainer[SoundIds.ElephantButton] = elephantButton;
      this._seContainer[SoundIds.LeoButton] = leoButton;
      this._seContainer[SoundIds.HorseButton] = horseButton;
      this._seContainer[SoundIds.PiyoButton] = piyoButton;
      this._seContainer[SoundIds.BicycleButton] = bicycleButton;
      this._seContainer[SoundIds.BikeButton] = bikeButton;
      this._seContainer[SoundIds.FuneButton] = funeButton;
      this._seContainer[SoundIds.KyuKyuSyaButton] = kyukyusyaButton;
      this._seContainer[SoundIds.PatocarButton] = patocarButton;
      this._seContainer[SoundIds.SuperCarButton] = superCarButton;

      this._streamContainer[dogButton] = 0;
      this._streamContainer[catButton] = 1;
      this._streamContainer[elephantButton] = 2;
      this._streamContainer[leoButton] = 3;
      this._streamContainer[horseButton] = 4;
      this._streamContainer[piyoButton] = 5;
      this._streamContainer[bicycleButton] = 6;
      this._streamContainer[bikeButton] = 7;
      this._streamContainer[funeButton] = 8;
      this._streamContainer[kyukyusyaButton] = 9;
      this._streamContainer[patocarButton] = 10;
      this._streamContainer[superCarButton] = 11;
    }();
  }

  void play(SoundIds ids) async {
    var seId = this._seContainer[ids];
    if (seId != null) {
      var streamId = this._streamContainer[seId] ?? 0;
      if (streamId > 0 && isIOS) {
        await _soundPool.stop(streamId);
      }
      this._streamContainer[seId] = await _soundPool.play(seId);
    } else {
      print("se resource not found! ids: $ids");
    }
  }

  Future<void> dispose() async {
    await _soundPool.release();
    _soundPool.dispose();
    return Future.value(0);
  }
}
