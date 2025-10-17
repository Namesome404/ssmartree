# 智能绿植 - SmartTree

一个基于Flutter开发的智能绿植规划应用，根据用户的房型推荐合适的防火绿植。

## 功能特色

🌱 **智能推荐** - 根据房间类型和特征推荐最适合的防火绿植
🔥 **防火安全** - 专注于具有防火特性的植物，提高家居安全
🏠 **房型适配** - 支持客厅、卧室、厨房、卫生间、书房、阳台等多种房型
📊 **详细评级** - 提供防火能力、空气净化、养护难度等多维度评级
💡 **养护指南** - 详细的植物养护说明和注意事项
🎨 **精美界面** - 现代化设计，流畅的动画效果

## 应用截图

### 主要界面
- **启动页面** - 优雅的启动动画和品牌展示
- **房型选择** - 直观的房间类型选择界面
- **智能推荐** - 基于算法的植物推荐列表
- **植物详情** - 完整的植物信息和养护指南

### 核心功能
- **防火等级评估** - 1-5星防火能力评级
- **空气净化指数** - 植物空气净化能力评估
- **养护难度** - 适合不同经验水平的用户
- **房间适配性** - 精确匹配房间环境需求

## 技术栈

- **Flutter** - 跨平台移动应用开发框架
- **Dart** - 编程语言
- **Provider** - 状态管理
- **Google Fonts** - 字体支持
- **Flutter Staggered Animations** - 动画效果

## 环境要求

- Flutter SDK >= 3.10.0
- Dart SDK >= 3.0.0
- Android Studio / VS Code
- iOS: Xcode (仅iOS开发需要)
- Android: Android SDK

## 安装运行

### 1. 克隆项目
```bash
git clone <repository-url>
cd SmartTree
```

### 2. 安装依赖
```bash
flutter pub get
```

### 3. 运行应用
```bash
# Android
flutter run

# iOS (需要macOS)
flutter run -d ios

# Web
flutter run -d chrome
```

### 4. 构建发布版本
```bash
# Android APK
flutter build apk --release

# iOS IPA (需要macOS和开发者账户)
flutter build ios --release

# Web
flutter build web --release
```

## 项目结构

```
lib/
├── main.dart                 # 应用入口
├── models/                   # 数据模型
│   ├── plant.dart           # 植物模型
│   ├── room_type.dart       # 房型模型
│   └── recommendation.dart   # 推荐模型
├── screens/                  # 界面页面
│   ├── splash_screen.dart   # 启动页面
│   ├── home_screen.dart     # 主页
│   ├── recommendation_screen.dart # 推荐页面
│   └── plant_detail_screen.dart   # 植物详情页
├── widgets/                  # 自定义组件
│   ├── gradient_background.dart
│   ├── room_type_card.dart
│   ├── plant_recommendation_card.dart
│   ├── loading_widget.dart
│   └── rating_bar.dart
├── providers/               # 状态管理
│   └── app_provider.dart
├── utils/                   # 工具类
│   └── app_theme.dart      # 主题配置
└── data/                   # 数据服务
    └── plant_data.dart     # 植物数据服务
```

## 植物数据

应用内置了多种防火绿植数据：

### 高防火等级植物
- **玉树** (5.0/5.0) - 极强防火性，厚叶多肉植物
- **芦荟** (4.5/5.0) - 优秀防火特性，药用价值高
- **橡皮树** (4.2/5.0) - 厚实革质叶片，防火性能优秀
- **虎尾兰** (4.0/5.0) - 夜间制氧，防火阻燃

### 房型适配
- **客厅** - 玉树、芦荟、橡皮树等大型植物
- **卧室** - 虎尾兰、吊兰等净化空气植物
- **厨房** - 绿萝、波士顿蕨等耐高温高湿植物
- **卫生间** - 波士顿蕨、白掌等喜湿植物

## 开发说明

### 添加新植物
在 `lib/models/plant.dart` 中的 `getAllPlants()` 方法中添加新的植物数据。

### 修改推荐算法
在 `lib/models/recommendation.dart` 中的 `_calculateRecommendation()` 方法中调整推荐逻辑。

### 自定义主题
在 `lib/utils/app_theme.dart` 中修改颜色和样式配置。

## 贡献指南

1. Fork 项目
2. 创建功能分支 (`git checkout -b feature/AmazingFeature`)
3. 提交更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 开启 Pull Request

## 许可证

本项目采用 MIT 许可证 - 查看 [LICENSE](LICENSE) 文件了解详情

## 联系方式

如有问题或建议，请通过以下方式联系：

- 邮箱: your-email@example.com
- 项目地址: https://github.com/your-username/SmartTree

---

**智能绿植 - 让您的家既美观又安全** 🌱🔥🏠
