// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlayerStruct extends BaseStruct {
  PlayerStruct({
    String? profileName,
    bool? hasTopRank,
    int? highScore,
    LeaderboardRanks? rank,
    bool? isCurrentUser,
    String? profileImage,
  })  : _profileName = profileName,
        _hasTopRank = hasTopRank,
        _highScore = highScore,
        _rank = rank,
        _isCurrentUser = isCurrentUser,
        _profileImage = profileImage;

  // "profileName" field.
  String? _profileName;
  String get profileName => _profileName ?? '';
  set profileName(String? val) => _profileName = val;

  bool hasProfileName() => _profileName != null;

  // "hasTopRank" field.
  bool? _hasTopRank;
  bool get hasTopRank => _hasTopRank ?? false;
  set hasTopRank(bool? val) => _hasTopRank = val;

  bool hasHasTopRank() => _hasTopRank != null;

  // "highScore" field.
  int? _highScore;
  int get highScore => _highScore ?? 0;
  set highScore(int? val) => _highScore = val;

  void incrementHighScore(int amount) => highScore = highScore + amount;

  bool hasHighScore() => _highScore != null;

  // "rank" field.
  LeaderboardRanks? _rank;
  LeaderboardRanks? get rank => _rank;
  set rank(LeaderboardRanks? val) => _rank = val;

  bool hasRank() => _rank != null;

  // "isCurrentUser" field.
  bool? _isCurrentUser;
  bool get isCurrentUser => _isCurrentUser ?? false;
  set isCurrentUser(bool? val) => _isCurrentUser = val;

  bool hasIsCurrentUser() => _isCurrentUser != null;

  // "profileImage" field.
  String? _profileImage;
  String get profileImage => _profileImage ?? '';
  set profileImage(String? val) => _profileImage = val;

  bool hasProfileImage() => _profileImage != null;

  static PlayerStruct fromMap(Map<String, dynamic> data) => PlayerStruct(
        profileName: data['profileName'] as String?,
        hasTopRank: data['hasTopRank'] as bool?,
        highScore: castToType<int>(data['highScore']),
        rank: deserializeEnum<LeaderboardRanks>(data['rank']),
        isCurrentUser: data['isCurrentUser'] as bool?,
        profileImage: data['profileImage'] as String?,
      );

  static PlayerStruct? maybeFromMap(dynamic data) =>
      data is Map ? PlayerStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'profileName': _profileName,
        'hasTopRank': _hasTopRank,
        'highScore': _highScore,
        'rank': _rank?.serialize(),
        'isCurrentUser': _isCurrentUser,
        'profileImage': _profileImage,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'profileName': serializeParam(
          _profileName,
          ParamType.String,
        ),
        'hasTopRank': serializeParam(
          _hasTopRank,
          ParamType.bool,
        ),
        'highScore': serializeParam(
          _highScore,
          ParamType.int,
        ),
        'rank': serializeParam(
          _rank,
          ParamType.Enum,
        ),
        'isCurrentUser': serializeParam(
          _isCurrentUser,
          ParamType.bool,
        ),
        'profileImage': serializeParam(
          _profileImage,
          ParamType.String,
        ),
      }.withoutNulls;

  static PlayerStruct fromSerializableMap(Map<String, dynamic> data) =>
      PlayerStruct(
        profileName: deserializeParam(
          data['profileName'],
          ParamType.String,
          false,
        ),
        hasTopRank: deserializeParam(
          data['hasTopRank'],
          ParamType.bool,
          false,
        ),
        highScore: deserializeParam(
          data['highScore'],
          ParamType.int,
          false,
        ),
        rank: deserializeParam<LeaderboardRanks>(
          data['rank'],
          ParamType.Enum,
          false,
        ),
        isCurrentUser: deserializeParam(
          data['isCurrentUser'],
          ParamType.bool,
          false,
        ),
        profileImage: deserializeParam(
          data['profileImage'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PlayerStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PlayerStruct &&
        profileName == other.profileName &&
        hasTopRank == other.hasTopRank &&
        highScore == other.highScore &&
        rank == other.rank &&
        isCurrentUser == other.isCurrentUser &&
        profileImage == other.profileImage;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [profileName, hasTopRank, highScore, rank, isCurrentUser, profileImage]);
}

PlayerStruct createPlayerStruct({
  String? profileName,
  bool? hasTopRank,
  int? highScore,
  LeaderboardRanks? rank,
  bool? isCurrentUser,
  String? profileImage,
}) =>
    PlayerStruct(
      profileName: profileName,
      hasTopRank: hasTopRank,
      highScore: highScore,
      rank: rank,
      isCurrentUser: isCurrentUser,
      profileImage: profileImage,
    );
