// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CardsTestStruct extends BaseStruct {
  CardsTestStruct({
    String? topic,
    List<CardStruct>? cards,
  })  : _topic = topic,
        _cards = cards;

  // "topic" field.
  String? _topic;
  String get topic => _topic ?? '';
  set topic(String? val) => _topic = val;
  bool hasTopic() => _topic != null;

  // "cards" field.
  List<CardStruct>? _cards;
  List<CardStruct> get cards => _cards ?? const [];
  set cards(List<CardStruct>? val) => _cards = val;
  void updateCards(Function(List<CardStruct>) updateFn) =>
      updateFn(_cards ??= []);
  bool hasCards() => _cards != null;

  static CardsTestStruct fromMap(Map<String, dynamic> data) => CardsTestStruct(
        topic: data['topic'] as String?,
        cards: getStructList(
          data['cards'],
          CardStruct.fromMap,
        ),
      );

  static CardsTestStruct? maybeFromMap(dynamic data) => data is Map
      ? CardsTestStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'topic': _topic,
        'cards': _cards?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'topic': serializeParam(
          _topic,
          ParamType.String,
        ),
        'cards': serializeParam(
          _cards,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static CardsTestStruct fromSerializableMap(Map<String, dynamic> data) =>
      CardsTestStruct(
        topic: deserializeParam(
          data['topic'],
          ParamType.String,
          false,
        ),
        cards: deserializeStructParam<CardStruct>(
          data['cards'],
          ParamType.DataStruct,
          true,
          structBuilder: CardStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'CardsTestStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CardsTestStruct &&
        topic == other.topic &&
        listEquality.equals(cards, other.cards);
  }

  @override
  int get hashCode => const ListEquality().hash([topic, cards]);
}

CardsTestStruct createCardsTestStruct({
  String? topic,
}) =>
    CardsTestStruct(
      topic: topic,
    );
