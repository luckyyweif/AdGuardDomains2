#!/usr/bin/env bash
set -e

SRC_URL="https://adguardteam.github.io/HostlistsRegistry/assets/filter_1.txt"
TMP_FILE="filter_1.txt"

# 下载源文件
curl -sSL "$SRC_URL" -o "$TMP_FILE"

# 抽取裸域名：去掉前缀“||”和后缀“^”，去重、排序
grep -E '^\|\|.+\^$' "$TMP_FILE" \
  | sed 's/^\|\|//; s/\^$//' \
  | sort -u > domains.txt

# 移到 docs/ 目录（GitHub Pages 发布目录）
mkdir -p docs
mv domains.txt docs/

echo "生成 docs/domains.txt ，共 $(wc -l < docs/domains.txt) 条域名"
