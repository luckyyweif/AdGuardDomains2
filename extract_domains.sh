#!/usr/bin/env bash
set -e

# 源文件地址
SRC_URL="https://adguardteam.github.io/HostlistsRegistry/assets/filter_1.txt"
# 临时下载文件名
TMP_FILE="filter_1.txt"

# 1. 下载最新列表
curl -sSL "$SRC_URL" -o "$TMP_FILE"

# 2. 提取所有以 || 开头的行，
#    去掉所有的 '|' 字符，再去掉可能的尾部 '^'，
#    去重排序，并在每个域名前加一个点
grep -E '^\|\|' "$TMP_FILE" \
  | sed 's/|//g; s/\^$//' \
  | sort -u \
  | sed 's/^/./' > domains.txt

# 3. 移动到 docs/ 目录以供 Pages 发布
mkdir -p docs
mv domains.txt docs/

echo "已生成 docs/domains.txt，包含 $(wc -l < docs/domains.txt) 条域名，格式示例如下："
head -n5 docs/domains.txt | sed 's/^/  /'
