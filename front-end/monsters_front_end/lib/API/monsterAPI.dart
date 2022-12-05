// ignore_for_file: file_names

abstract class MonsterApiDataSource {
  Future<Map<String, dynamic>?> searchMonsterByAccount();

  Future<Map<String, dynamic>?> searchSkinByMonsterGroup(int monsterGroup);
}
