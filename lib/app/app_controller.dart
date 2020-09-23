import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yshare/domain/entities/favourite_episode.dart';

part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  _AppControllerBase() {
    loadTheme();
    loadFavouriteFilms();
    loadSubscribedActors();
    loadFavouriteSeries();
    loadFavouriteEpisodes();
  }

  @observable
  ThemeData themeType;

  @observable
  List<int> subscribedActors = [];

  @observable
  List<int> favouriteFilms = [];

  @observable
  List<int> favouriteSeries = [];

  @observable
  List<FavouriteEpisode> favouriteEpisodes = [];

  @computed
  bool get isDark => themeType.brightness == Brightness.dark;

  @action
  void changeTheme() {
    if (isDark) {
      themeType = ThemeData.light();
    } else {
      themeType = ThemeData.dark();
    }
    saveThemePreferences();
  }

  void saveThemePreferences() {
    SharedPreferences.getInstance().then((instance) {
      instance.setBool('isDark', isDark);
    });
  }

  @action
  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('isDark') && prefs.getBool('isDark')) {
      themeType = ThemeData.dark();
    } else {
      themeType = ThemeData.light();
    }
  }

  List<String> listIntegerToString(List<int> array) {
    var stringArray = <String>[];
    array.map((e) {
      stringArray.add(e.toString());
    }).toList();
    return stringArray;
  }

  void saveFilmsInSharedPreferences() {
    SharedPreferences.getInstance().then((instance) {
      instance.setStringList(
          'favouriteFilms', listIntegerToString(favouriteFilms));
    });
  }

  @action
  Future<void> loadFavouriteFilms() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('favouriteFilms')) {
      var films = prefs.getStringList('favouriteFilms');
      films.map((e) {
        favouriteFilms.add(int.parse(e));
      }).toList();
    }
  }

  @action
  Future<void> loadSubscribedActors() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('subscribedActors')) {
      var actors = prefs.getStringList('subscribedActors');
      actors.map((e) {
        subscribedActors.add(int.parse(e));
      }).toList();
    }
  }

  @action
  Future<void> loadFavouriteSeries() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('favouriteSeries')) {
      var series = prefs.getStringList('favouriteSeries');
      series.map((e) {
        favouriteSeries.add(int.parse(e));
      }).toList();
    }
  }

  @action
  void addFilmIntoFavourites(int filmId) {
    if (!favouriteFilms.contains(filmId)) {
      favouriteFilms = List.from(favouriteFilms..add(filmId));
      saveFilmsInSharedPreferences();
    } else {
      favouriteFilms = List.from(favouriteFilms..remove(filmId));
      saveFilmsInSharedPreferences();
    }
  }

  void saveSubscribedActors() {
    SharedPreferences.getInstance().then((instance) {
      instance.setStringList(
          'subscribedActors', listIntegerToString(subscribedActors));
    });
  }

  void saveFavouriteSeries() {
    SharedPreferences.getInstance().then((instance) {
      instance.setStringList(
          'favouriteSeries', listIntegerToString(favouriteSeries));
    });
  }

  @action
  void addSerieInFavourite(int serieId) {
    if (!favouriteSeries.contains(serieId)) {
      favouriteSeries = List.from(favouriteSeries..add(serieId));
      saveFavouriteSeries();
    } else {
      favouriteSeries = List.from(favouriteSeries..remove(serieId));
      saveFavouriteSeries();
    }
  }

  @action
  void addActorInFavourites(int actorId) {
    if (!subscribedActors.contains(actorId)) {
      subscribedActors = List.from(subscribedActors..add(actorId));
      saveSubscribedActors();
    } else {
      subscribedActors = List.from(subscribedActors..remove(actorId));
      saveSubscribedActors();
    }
  }

  @action
  void addEpisodeIntoFavourites(FavouriteEpisode favouriteEpisode) {
    favouriteEpisodes.contains(favouriteEpisode)
        ? favouriteEpisodes =
            List.from(favouriteEpisodes..remove(favouriteEpisode))
        : favouriteEpisodes =
            List.from(favouriteEpisodes..add(favouriteEpisode));

    saveFavouriteEpisodes();
  }

  void saveFavouriteEpisodes() {
    var stringList = <String>[];
    favouriteEpisodes
        .map((e) => stringList.add(json.encode(e.toJson())))
        .toList();
    print(stringList);
    SharedPreferences.getInstance().then((instance) {
      instance.setStringList('favouriteEpisodes', stringList);
    });
  }

  @action
  Future<void> loadFavouriteEpisodes() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('favouriteEpisodes')) {
      var episodes = prefs.getStringList('favouriteEpisodes');
      episodes.map((e) {
        favouriteEpisodes..add(FavouriteEpisode.fromJson(json.decode(e)));
      }).toList();
    }
  }
}
