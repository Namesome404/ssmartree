class RoomType {
  final String id;
  final String name;
  final String description;
  final String iconPath;
  final List<String> characteristics;
  final double fireRiskLevel; // 1.0-5.0，数值越高火灾风险越大
  
  const RoomType({
    required this.id,
    required this.name,
    required this.description,
    required this.iconPath,
    required this.characteristics,
    required this.fireRiskLevel,
  });

  static List<RoomType> getAllRoomTypes() {
    return [
      const RoomType(
        id: 'living_room',
        name: '客厅',
        description: '家庭主要活动区域，通风良好，光照充足',
        iconPath: 'assets/images/living_room.png',
        characteristics: ['光照充足', '通风良好', '空间宽敞', '人员活动频繁'],
        fireRiskLevel: 2.0,
      ),
      const RoomType(
        id: 'bedroom',
        name: '卧室',
        description: '休息睡眠区域，相对密闭，需要净化空气',
        iconPath: 'assets/images/bedroom.png',
        characteristics: ['相对密闭', '需要净化空气', '光照适中', '湿度要求高'],
        fireRiskLevel: 3.0,
      ),
      const RoomType(
        id: 'kitchen',
        name: '厨房',
        description: '烹饪区域，高温高湿，火灾风险较高',
        iconPath: 'assets/images/kitchen.png',
        characteristics: ['高温环境', '湿度较高', '油烟较多', '火源较多'],
        fireRiskLevel: 4.5,
      ),
      const RoomType(
        id: 'bathroom',
        name: '卫生间',
        description: '湿度很高，光照较少，通风一般',
        iconPath: 'assets/images/bathroom.png',
        characteristics: ['湿度很高', '光照较少', '通风一般', '空间较小'],
        fireRiskLevel: 2.5,
      ),
      const RoomType(
        id: 'study',
        name: '书房',
        description: '工作学习区域，需要清新空气，电器较多',
        iconPath: 'assets/images/study.png',
        characteristics: ['需要清新空气', '电器设备多', '光照需求高', '相对安静'],
        fireRiskLevel: 3.5,
      ),
      const RoomType(
        id: 'balcony',
        name: '阳台',
        description: '阳光充足，通风极佳，但温度变化大',
        iconPath: 'assets/images/balcony.png',
        characteristics: ['阳光充足', '通风极佳', '温度变化大', '空间开放'],
        fireRiskLevel: 1.5,
      ),
    ];
  }
}
