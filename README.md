# AdGuardDomains2

本仓库自动从 AdGuard 官方的 `filter_1.txt` 中提取广告域名，只保留「裸域名」格式（去掉 `||` 和 `^`），并每天自动更新。

- 🔗 **源列表**：https://adguardteam.github.io/HostlistsRegistry/assets/filter_1.txt  
- 📄 **输出文件**：`domains.txt`（发布于 GitHub Pages）  
- 🚀 **访问链接**：https://luckyyweif.github.io/AdGuardDomains2/domains.txt  

### 使用方法

1. 直接通过上面的链接获取最新的 `domains.txt`，以 AdGuard 或其他支持纯域名列表的工具导入即可。  
2. 如果需要手动触发更新，在仓库的 **Actions → 每日更新 AdGuard 域名列表** 里点 **Run workflow**。

### 项目结构

├── .github/
│ └── workflows/
│ └── update-domains.yml # 自动更新的 GitHub Actions 配置
├── docs/
│ ├── domains.txt # 最终发布的域名列表
│ └── .nojekyll # 禁用 Jekyll，直接发布静态文件
├── extract_domains.sh # 提取和生成 domains.txt 的脚本
└── README.md # 本说明

### 协议

本项目采用 [MIT License](LICENSE)（如需可自行添加 LICENSE 文件）。
