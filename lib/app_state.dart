import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _cards = prefs
              .getStringList('ff_cards')
              ?.map((x) {
                try {
                  return CardStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _cards;
    });
    _safeInit(() {
      _cardsTests = prefs
              .getStringList('ff_cardsTests')
              ?.map((x) {
                try {
                  return CardsTestStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _cardsTests;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<CardStruct> _cards = [];
  List<CardStruct> get cards => _cards;
  set cards(List<CardStruct> value) {
    _cards = value;
    prefs.setStringList('ff_cards', value.map((x) => x.serialize()).toList());
  }

  void addToCards(CardStruct value) {
    _cards.add(value);
    prefs.setStringList('ff_cards', _cards.map((x) => x.serialize()).toList());
  }

  void removeFromCards(CardStruct value) {
    _cards.remove(value);
    prefs.setStringList('ff_cards', _cards.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromCards(int index) {
    _cards.removeAt(index);
    prefs.setStringList('ff_cards', _cards.map((x) => x.serialize()).toList());
  }

  void updateCardsAtIndex(
    int index,
    CardStruct Function(CardStruct) updateFn,
  ) {
    _cards[index] = updateFn(_cards[index]);
    prefs.setStringList('ff_cards', _cards.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInCards(int index, CardStruct value) {
    _cards.insert(index, value);
    prefs.setStringList('ff_cards', _cards.map((x) => x.serialize()).toList());
  }

  List<CardsTestStruct> _cardsTests = [];
  List<CardsTestStruct> get cardsTests => _cardsTests;
  set cardsTests(List<CardsTestStruct> value) {
    _cardsTests = value;
    prefs.setStringList(
        'ff_cardsTests', value.map((x) => x.serialize()).toList());
  }

  void addToCardsTests(CardsTestStruct value) {
    _cardsTests.add(value);
    prefs.setStringList(
        'ff_cardsTests', _cardsTests.map((x) => x.serialize()).toList());
  }

  void removeFromCardsTests(CardsTestStruct value) {
    _cardsTests.remove(value);
    prefs.setStringList(
        'ff_cardsTests', _cardsTests.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromCardsTests(int index) {
    _cardsTests.removeAt(index);
    prefs.setStringList(
        'ff_cardsTests', _cardsTests.map((x) => x.serialize()).toList());
  }

  void updateCardsTestsAtIndex(
    int index,
    CardsTestStruct Function(CardsTestStruct) updateFn,
  ) {
    _cardsTests[index] = updateFn(_cardsTests[index]);
    prefs.setStringList(
        'ff_cardsTests', _cardsTests.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInCardsTests(int index, CardsTestStruct value) {
    _cardsTests.insert(index, value);
    prefs.setStringList(
        'ff_cardsTests', _cardsTests.map((x) => x.serialize()).toList());
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
