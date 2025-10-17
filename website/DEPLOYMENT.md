# 🚀 SmartTree网站部署指南

## 📋 部署前检查清单

### 必需文件
- [x] `index.html` - 主页面
- [x] `css/style.css` - 样式文件  
- [x] `js/script.js` - 交互脚本
- [x] `assets/favicon.svg` - 网站图标
- [ ] `images/` - 应用截图和植物图片
- [x] `README.md` - 项目说明

### 内容检查
- [x] 应用信息准确性
- [x] 下载链接有效性
- [x] 联系信息正确性
- [ ] 图片资源完整性
- [x] 响应式设计测试

## 🌐 部署选项

### 1. GitHub Pages (推荐)

#### 步骤：
1. 创建GitHub仓库
2. 上传网站文件到仓库
3. 启用GitHub Pages
4. 配置自定义域名(可选)

#### 配置文件 `.github/workflows/deploy.yml`:
```yaml
name: Deploy to GitHub Pages

on:
  push:
    branches: [ main ]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - name: Deploy to GitHub Pages
      uses: peaceiris/actions-gh-pages@v3
      with:
        github_token: ${{ secrets.GITHUB_TOKEN }}
        publish_dir: ./website
```

### 2. Netlify

#### 步骤：
1. 连接GitHub仓库
2. 设置构建命令: `# 无需构建`
3. 设置发布目录: `website`
4. 部署设置完成

#### `netlify.toml` 配置:
```toml
[build]
  publish = "website"

[[headers]]
  for = "/*"
  [headers.values]
    X-Frame-Options = "DENY"
    X-XSS-Protection = "1; mode=block"
    X-Content-Type-Options = "nosniff"

[[redirects]]
  from = "/*"
  to = "/index.html"
  status = 200
```

### 3. Vercel

#### 步骤：
1. 导入GitHub仓库
2. 设置根目录: `website`
3. 自动部署配置

#### `vercel.json` 配置:
```json
{
  "version": 2,
  "builds": [
    {
      "src": "website/**/*",
      "use": "@vercel/static"
    }
  ],
  "routes": [
    {
      "src": "/(.*)",
      "dest": "/website/$1"
    }
  ]
}
```

### 4. Firebase Hosting

#### 步骤：
```bash
# 安装Firebase CLI
npm install -g firebase-tools

# 初始化项目
firebase init hosting

# 部署
firebase deploy
```

#### `firebase.json` 配置:
```json
{
  "hosting": {
    "public": "website",
    "ignore": [
      "firebase.json",
      "**/.*",
      "**/node_modules/**"
    ],
    "rewrites": [
      {
        "source": "**",
        "destination": "/index.html"
      }
    ],
    "headers": [
      {
        "source": "**/*.@(jpg|jpeg|gif|png|svg|webp|js|css)",
        "headers": [
          {
            "key": "Cache-Control",
            "value": "max-age=31536000"
          }
        ]
      }
    ]
  }
}
```

## 🔧 性能优化

### 图片优化
```bash
# 压缩图片 (需要安装imagemin)
npm install -g imagemin-cli imagemin-mozjpeg imagemin-pngquant

# 压缩JPG
imagemin images/*.jpg --out-dir=images/optimized --plugin=mozjpeg

# 压缩PNG  
imagemin images/*.png --out-dir=images/optimized --plugin=pngquant
```

### CSS/JS压缩
```bash
# 安装压缩工具
npm install -g uglifycss uglify-js

# 压缩CSS
uglifycss css/style.css > css/style.min.css

# 压缩JS
uglifyjs js/script.js -o js/script.min.js
```

### 启用Gzip压缩
在服务器配置中启用Gzip压缩：

#### Nginx配置:
```nginx
gzip on;
gzip_vary on;
gzip_min_length 1024;
gzip_types text/plain text/css text/xml text/javascript application/javascript application/xml+rss application/json;
```

#### Apache配置:
```apache
<IfModule mod_deflate.c>
    AddOutputFilterByType DEFLATE text/plain
    AddOutputFilterByType DEFLATE text/html
    AddOutputFilterByType DEFLATE text/xml
    AddOutputFilterByType DEFLATE text/css
    AddOutputFilterByType DEFLATE application/xml
    AddOutputFilterByType DEFLATE application/xhtml+xml
    AddOutputFilterByType DEFLATE application/rss+xml
    AddOutputFilterByType DEFLATE application/javascript
    AddOutputFilterByType DEFLATE application/x-javascript
</IfModule>
```

## 📊 SEO优化

### 添加sitemap.xml
```xml
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  <url>
    <loc>https://smarttree.app/</loc>
    <lastmod>2024-10-15</lastmod>
    <changefreq>monthly</changefreq>
    <priority>1.0</priority>
  </url>
</urlset>
```

### 添加robots.txt
```
User-agent: *
Allow: /

Sitemap: https://smarttree.app/sitemap.xml
```

### Google Analytics
在`<head>`标签中添加：
```html
<!-- Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=GA_TRACKING_ID"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'GA_TRACKING_ID');
</script>
```

## 🔒 安全配置

### 安全头设置
```html
<meta http-equiv="Content-Security-Policy" content="default-src 'self'; script-src 'self' 'unsafe-inline' https://unpkg.com https://cdnjs.cloudflare.com; style-src 'self' 'unsafe-inline' https://fonts.googleapis.com https://cdnjs.cloudflare.com; font-src 'self' https://fonts.gstatic.com; img-src 'self' data: https:;">
<meta http-equiv="X-Content-Type-Options" content="nosniff">
<meta http-equiv="X-Frame-Options" content="DENY">
<meta http-equiv="X-XSS-Protection" content="1; mode=block">
```

## 📱 PWA支持 (可选)

### 添加manifest.json
```json
{
  "name": "SmartTree - 智能绿植",
  "short_name": "SmartTree",
  "description": "智能绿植推荐应用",
  "start_url": "/",
  "display": "standalone",
  "background_color": "#F1F8E9",
  "theme_color": "#2E7D32",
  "icons": [
    {
      "src": "assets/icon-192.png",
      "sizes": "192x192",
      "type": "image/png"
    },
    {
      "src": "assets/icon-512.png", 
      "sizes": "512x512",
      "type": "image/png"
    }
  ]
}
```

### Service Worker
```javascript
// sw.js
const CACHE_NAME = 'smarttree-v1';
const urlsToCache = [
  '/',
  '/css/style.css',
  '/js/script.js',
  '/assets/favicon.svg'
];

self.addEventListener('install', event => {
  event.waitUntil(
    caches.open(CACHE_NAME)
      .then(cache => cache.addAll(urlsToCache))
  );
});

self.addEventListener('fetch', event => {
  event.respondWith(
    caches.match(event.request)
      .then(response => response || fetch(event.request))
  );
});
```

## 🧪 测试清单

### 功能测试
- [ ] 导航菜单正常工作
- [ ] 植物标签页切换
- [ ] 下载链接有效
- [ ] 表单提交(如有)
- [ ] 移动端菜单

### 性能测试
- [ ] 页面加载速度 < 3秒
- [ ] 图片懒加载正常
- [ ] 动画流畅度
- [ ] 内存使用合理

### 兼容性测试
- [ ] Chrome (最新版本)
- [ ] Firefox (最新版本)
- [ ] Safari (最新版本)
- [ ] Edge (最新版本)
- [ ] 移动端浏览器

### 响应式测试
- [ ] 桌面端 (1920x1080)
- [ ] 平板端 (768x1024)
- [ ] 手机端 (375x667)
- [ ] 超宽屏 (2560x1440)

## 📞 部署支持

如需部署协助，请联系：
- 技术支持: support@smarttree.app
- 文档更新: docs@smarttree.app

---

**部署完成后记得更新DNS记录和SSL证书！** 🔒
