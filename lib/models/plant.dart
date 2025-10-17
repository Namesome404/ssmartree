import 'package:flutter/material.dart';

class Plant {
  final String id;
  final String name;
  final String scientificName;
  final String description;
  final String imagePath;
  final List<String> benefits;
  final List<String> careInstructions;
  final double fireResistance; // 1.0-5.0，数值越高防火能力越强
  final double airPurification; // 1.0-5.0，数值越高空气净化能力越强
  final double moistureLevel; // 1.0-5.0，植物所需湿度水平
  final double lightRequirement; // 1.0-5.0，植物所需光照强度
  final List<String> suitableRoomTypes;
  final String difficultyLevel; // 'easy', 'medium', 'hard'
  final List<String> warnings; // 安全警告

  const Plant({
    required this.id,
    required this.name,
    required this.scientificName,
    required this.description,
    required this.imagePath,
    required this.benefits,
    required this.careInstructions,
    required this.fireResistance,
    required this.airPurification,
    required this.moistureLevel,
    required this.lightRequirement,
    required this.suitableRoomTypes,
    required this.difficultyLevel,
    this.warnings = const [],
  });

  static List<Plant> getAllPlants() {
    return [
      const Plant(
        id: 'aloe_vera',
        name: '芦荟',
        scientificName: 'Aloe vera',
        description: '多肉植物，具有优秀的防火特性，叶片含水量高，能有效阻止火势蔓延',
        imagePath: 'assets/images/aloe_vera.jpg',
        benefits: ['防火阻燃', '空气净化', '药用价值', '易于养护'],
        careInstructions: ['少量浇水', '充足阳光', '排水良好', '温度适宜'],
        fireResistance: 4.5,
        airPurification: 3.5,
        moistureLevel: 2.0,
        lightRequirement: 4.0,
        suitableRoomTypes: ['living_room', 'bedroom', 'study', 'balcony'],
        difficultyLevel: 'easy',
      ),
      const Plant(
        id: 'jade_plant',
        name: '玉树',
        scientificName: 'Crassula ovata',
        description: '厚叶多肉植物，水分含量极高，是天然的防火屏障',
        imagePath: 'assets/images/jade_plant.jpg',
        benefits: ['极强防火性', '美化环境', '招财寓意', '生命力强'],
        careInstructions: ['控制浇水', '明亮光线', '通风良好', '避免积水'],
        fireResistance: 5.0,
        airPurification: 3.0,
        moistureLevel: 2.0,
        lightRequirement: 3.5,
        suitableRoomTypes: ['living_room', 'study', 'balcony'],
        difficultyLevel: 'easy',
      ),
      const Plant(
        id: 'spider_plant',
        name: '吊兰',
        scientificName: 'Chlorophytum comosum',
        description: '优秀的空气净化植物，叶片含水量适中，具有一定的防火作用',
        imagePath: 'assets/images/spider_plant.jpg',
        benefits: ['空气净化', '甲醛吸收', '美观垂吊', '繁殖容易'],
        careInstructions: ['适量浇水', '散射光照', '定期施肥', '修剪枯叶'],
        fireResistance: 3.0,
        airPurification: 4.5,
        moistureLevel: 3.0,
        lightRequirement: 2.5,
        suitableRoomTypes: ['living_room', 'bedroom', 'study', 'bathroom'],
        difficultyLevel: 'easy',
      ),
      const Plant(
        id: 'snake_plant',
        name: '虎尾兰',
        scientificName: 'Sansevieria trifasciata',
        description: '厚实的肉质叶片，含水量高，夜间释放氧气，防火效果显著',
        imagePath: 'assets/images/snake_plant.jpg',
        benefits: ['夜间制氧', '防火阻燃', '耐阴耐旱', '空气净化'],
        careInstructions: ['少量浇水', '耐阴环境', '避免过湿', '温度稳定'],
        fireResistance: 4.0,
        airPurification: 4.0,
        moistureLevel: 2.0,
        lightRequirement: 2.0,
        suitableRoomTypes: ['bedroom', 'bathroom', 'study'],
        difficultyLevel: 'easy',
      ),
      const Plant(
        id: 'peace_lily',
        name: '白掌',
        scientificName: 'Spathiphyllum wallisii',
        description: '叶片宽大，含水量丰富，能有效增加室内湿度，具有防火功能',
        imagePath: 'assets/images/peace_lily.jpg',
        benefits: ['增加湿度', '空气净化', '优雅花朵', '防火保护'],
        careInstructions: ['保持湿润', '散射光照', '定期喷水', '避免直射'],
        fireResistance: 3.5,
        airPurification: 4.0,
        moistureLevel: 4.0,
        lightRequirement: 2.5,
        suitableRoomTypes: ['living_room', 'bedroom', 'bathroom'],
        difficultyLevel: 'medium',
      ),
      const Plant(
        id: 'rubber_plant',
        name: '橡皮树',
        scientificName: 'Ficus elastica',
        description: '厚实的革质叶片，含有丰富的水分和乳汁，防火性能优秀',
        imagePath: 'assets/images/rubber_plant.jpg',
        benefits: ['优秀防火性', '空气净化', '美观大方', '生长迅速'],
        careInstructions: ['适量浇水', '明亮环境', '定期擦叶', '控制温度'],
        fireResistance: 4.2,
        airPurification: 3.8,
        moistureLevel: 3.0,
        lightRequirement: 3.0,
        suitableRoomTypes: ['living_room', 'study'],
        difficultyLevel: 'medium',
      ),
      const Plant(
        id: 'boston_fern',
        name: '波士顿蕨',
        scientificName: 'Nephrolepis exaltata',
        description: '高湿度植物，叶片柔软多汁，能有效增加空气湿度，降低火灾风险',
        imagePath: 'assets/images/boston_fern.jpg',
        benefits: ['增加湿度', '空气净化', '自然加湿器', '降低火险'],
        careInstructions: ['保持湿润', '避免直射', '高湿环境', '定期喷雾'],
        fireResistance: 3.8,
        airPurification: 3.5,
        moistureLevel: 4.5,
        lightRequirement: 2.0,
        suitableRoomTypes: ['bathroom', 'kitchen'],
        difficultyLevel: 'medium',
        warnings: ['需要高湿度环境', '不耐干燥'],
      ),
      const Plant(
        id: 'pothos',
        name: '绿萝',
        scientificName: 'Epipremnum aureum',
        description: '叶片含水量高，生长迅速，是厨房等高风险区域的理想选择',
        imagePath: 'assets/images/pothos.jpg',
        benefits: ['快速生长', '空气净化', '易于繁殖', '适应性强'],
        careInstructions: ['定期浇水', '散射光照', '攀援支撑', '修剪整形'],
        fireResistance: 3.2,
        airPurification: 4.2,
        moistureLevel: 3.5,
        lightRequirement: 2.5,
        suitableRoomTypes: ['kitchen', 'bathroom', 'living_room'],
        difficultyLevel: 'easy',
      ),
    ];
  }

  String get difficultyText {
    switch (difficultyLevel) {
      case 'easy':
        return '容易养护';
      case 'medium':
        return '中等难度';
      case 'hard':
        return '需要经验';
      default:
        return '未知';
    }
  }

  Color get difficultyColor {
    switch (difficultyLevel) {
      case 'easy':
        return const Color(0xFF4CAF50);
      case 'medium':
        return const Color(0xFFFF9800);
      case 'hard':
        return const Color(0xFFF44336);
      default:
        return const Color(0xFF9E9E9E);
    }
  }
}
