import 'package:flutter/foundation.dart';
import '../models/room_type.dart';
import '../models/plant.dart';
import '../models/recommendation.dart';

class AppProvider extends ChangeNotifier {
  RoomType? _selectedRoomType;
  List<PlantRecommendation> _recommendations = [];
  bool _isLoading = false;
  Plant? _selectedPlant;

  // Getters
  RoomType? get selectedRoomType => _selectedRoomType;
  List<PlantRecommendation> get recommendations => _recommendations;
  bool get isLoading => _isLoading;
  Plant? get selectedPlant => _selectedPlant;
  
  List<RoomType> get allRoomTypes => RoomType.getAllRoomTypes();
  List<Plant> get allPlants => Plant.getAllPlants();

  // 选择房间类型
  void selectRoomType(RoomType roomType) {
    _selectedRoomType = roomType;
    _generateRecommendations();
    notifyListeners();
  }

  // 生成推荐
  void _generateRecommendations() {
    if (_selectedRoomType == null) return;
    
    _isLoading = true;
    notifyListeners();
    
    // 模拟异步操作
    Future.delayed(const Duration(milliseconds: 500), () {
      _recommendations = PlantRecommendation.getRecommendationsForRoom(_selectedRoomType!);
      _isLoading = false;
      notifyListeners();
    });
  }

  // 选择植物
  void selectPlant(Plant plant) {
    _selectedPlant = plant;
    notifyListeners();
  }

  // 清除选择
  void clearSelections() {
    _selectedRoomType = null;
    _selectedPlant = null;
    _recommendations = [];
    notifyListeners();
  }

  // 获取高优先级推荐
  List<PlantRecommendation> get highPriorityRecommendations {
    return _recommendations.where((rec) => rec.priority == 'high').toList();
  }

  // 获取推荐统计
  Map<String, int> get recommendationStats {
    final stats = <String, int>{
      'high': 0,
      'medium': 0,
      'low': 0,
    };
    
    for (final rec in _recommendations) {
      stats[rec.priority] = (stats[rec.priority] ?? 0) + 1;
    }
    
    return stats;
  }

  // 根据难度筛选推荐
  List<PlantRecommendation> getRecommendationsByDifficulty(String difficulty) {
    return _recommendations.where((rec) => rec.plant.difficultyLevel == difficulty).toList();
  }

  // 根据防火等级筛选推荐
  List<PlantRecommendation> getHighFireResistancePlants() {
    return _recommendations.where((rec) => rec.plant.fireResistance >= 4.0).toList();
  }
}
