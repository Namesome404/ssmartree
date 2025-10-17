import 'package:flutter/material.dart';
import 'plant.dart';
import 'room_type.dart';

class PlantRecommendation {
  final Plant plant;
  final double matchScore; // 0.0-1.0，匹配度评分
  final List<String> reasons; // 推荐理由
  final List<String> tips; // 养护建议
  final String priority; // 'high', 'medium', 'low'

  const PlantRecommendation({
    required this.plant,
    required this.matchScore,
    required this.reasons,
    required this.tips,
    required this.priority,
  });

  static List<PlantRecommendation> getRecommendationsForRoom(RoomType roomType) {
    final allPlants = Plant.getAllPlants();
    final recommendations = <PlantRecommendation>[];

    for (final plant in allPlants) {
      if (plant.suitableRoomTypes.contains(roomType.id)) {
        final recommendation = _calculateRecommendation(plant, roomType);
        recommendations.add(recommendation);
      }
    }

    // 按匹配度排序
    recommendations.sort((a, b) => b.matchScore.compareTo(a.matchScore));
    return recommendations;
  }

  static PlantRecommendation _calculateRecommendation(Plant plant, RoomType roomType) {
    double score = 0.0;
    final reasons = <String>[];
    final tips = <String>[];

    // 防火能力评分（权重40%）
    final fireScore = (plant.fireResistance / 5.0) * (roomType.fireRiskLevel / 5.0);
    score += fireScore * 0.4;
    
    if (plant.fireResistance >= 4.0) {
      reasons.add('具有优秀的防火阻燃特性');
    } else if (plant.fireResistance >= 3.0) {
      reasons.add('具有良好的防火保护能力');
    }

    // 空气净化能力评分（权重30%）
    final airScore = plant.airPurification / 5.0;
    score += airScore * 0.3;
    
    if (plant.airPurification >= 4.0) {
      reasons.add('空气净化能力强，改善室内环境');
    }

    // 房间适应性评分（权重20%）
    if (plant.suitableRoomTypes.contains(roomType.id)) {
      score += 0.2;
      reasons.add('非常适合${roomType.name}环境');
    }

    // 养护难度评分（权重10%）
    switch (plant.difficultyLevel) {
      case 'easy':
        score += 0.1;
        reasons.add('容易养护，适合新手');
        break;
      case 'medium':
        score += 0.05;
        tips.add('需要适当的养护经验');
        break;
      case 'hard':
        tips.add('需要丰富的养护经验');
        break;
    }

    // 根据房间特点添加特殊建议
    _addRoomSpecificTips(roomType, plant, tips);

    // 确定优先级
    String priority;
    if (score >= 0.8) {
      priority = 'high';
    } else if (score >= 0.6) {
      priority = 'medium';
    } else {
      priority = 'low';
    }

    return PlantRecommendation(
      plant: plant,
      matchScore: score,
      reasons: reasons,
      tips: tips,
      priority: priority,
    );
  }

  static void _addRoomSpecificTips(RoomType roomType, Plant plant, List<String> tips) {
    switch (roomType.id) {
      case 'kitchen':
        tips.add('远离炉灶和热源');
        tips.add('注意油烟对植物的影响');
        if (plant.moistureLevel >= 3.0) {
          tips.add('厨房湿度有利于植物生长');
        }
        break;
      case 'bathroom':
        tips.add('利用浴室的高湿度环境');
        if (plant.lightRequirement >= 3.0) {
          tips.add('可能需要补充光照');
        }
        break;
      case 'bedroom':
        if (plant.id == 'snake_plant') {
          tips.add('夜间释放氧气，改善睡眠质量');
        }
        tips.add('避免过于浓烈的香味');
        break;
      case 'balcony':
        tips.add('注意防风和温度变化');
        if (plant.lightRequirement <= 2.0) {
          tips.add('可能需要适当遮阴');
        }
        break;
      case 'study':
        tips.add('有助于提高工作效率');
        tips.add('减少电子设备产生的静电');
        break;
    }

    // 添加通用养护提示
    if (plant.warnings.isNotEmpty) {
      tips.addAll(plant.warnings);
    }
  }

  String get priorityText {
    switch (priority) {
      case 'high':
        return '强烈推荐';
      case 'medium':
        return '推荐';
      case 'low':
        return '可选择';
      default:
        return '未知';
    }
  }

  Color get priorityColor {
    switch (priority) {
      case 'high':
        return const Color(0xFF4CAF50);
      case 'medium':
        return const Color(0xFFFF9800);
      case 'low':
        return const Color(0xFF9E9E9E);
      default:
        return const Color(0xFF9E9E9E);
    }
  }
}
