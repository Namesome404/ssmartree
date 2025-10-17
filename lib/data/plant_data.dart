import '../models/plant.dart';

class PlantDataService {
  static List<Plant> _plants = [];
  
  static Future<void> initialize() async {
    // 模拟从服务器或本地数据库加载数据
    await Future.delayed(const Duration(milliseconds: 100));
    _plants = Plant.getAllPlants();
  }
  
  static List<Plant> getAllPlants() {
    return _plants;
  }
  
  static Plant? getPlantById(String id) {
    try {
      return _plants.firstWhere((plant) => plant.id == id);
    } catch (e) {
      return null;
    }
  }
  
  static List<Plant> getPlantsByFireResistance(double minResistance) {
    return _plants.where((plant) => plant.fireResistance >= minResistance).toList();
  }
  
  static List<Plant> getPlantsByDifficulty(String difficulty) {
    return _plants.where((plant) => plant.difficultyLevel == difficulty).toList();
  }
  
  static List<Plant> searchPlants(String query) {
    final lowercaseQuery = query.toLowerCase();
    return _plants.where((plant) {
      return plant.name.toLowerCase().contains(lowercaseQuery) ||
             plant.scientificName.toLowerCase().contains(lowercaseQuery) ||
             plant.description.toLowerCase().contains(lowercaseQuery) ||
             plant.benefits.any((benefit) => benefit.toLowerCase().contains(lowercaseQuery));
    }).toList();
  }
  
  // 获取防火等级最高的植物
  static List<Plant> getTopFireResistantPlants({int limit = 5}) {
    final sortedPlants = List<Plant>.from(_plants);
    sortedPlants.sort((a, b) => b.fireResistance.compareTo(a.fireResistance));
    return sortedPlants.take(limit).toList();
  }
  
  // 获取空气净化能力最强的植物
  static List<Plant> getTopAirPurifyingPlants({int limit = 5}) {
    final sortedPlants = List<Plant>.from(_plants);
    sortedPlants.sort((a, b) => b.airPurification.compareTo(a.airPurification));
    return sortedPlants.take(limit).toList();
  }
  
  // 获取最容易养护的植物
  static List<Plant> getEasyCarePlants() {
    return _plants.where((plant) => plant.difficultyLevel == 'easy').toList();
  }
  
  // 根据房间特征推荐植物
  static List<Plant> getRecommendationsForRoomCharacteristics({
    required double lightLevel, // 1.0-5.0
    required double moistureLevel, // 1.0-5.0
    required double fireRiskLevel, // 1.0-5.0
  }) {
    return _plants.where((plant) {
      // 光照匹配度
      final lightMatch = (plant.lightRequirement - lightLevel).abs() <= 1.5;
      // 湿度匹配度
      final moistureMatch = (plant.moistureLevel - moistureLevel).abs() <= 1.5;
      // 防火需求（火险高的房间需要防火能力强的植物）
      final fireMatch = fireRiskLevel >= 3.0 ? plant.fireResistance >= 3.0 : true;
      
      return lightMatch && moistureMatch && fireMatch;
    }).toList();
  }
}
