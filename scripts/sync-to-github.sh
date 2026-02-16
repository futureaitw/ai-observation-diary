#!/bin/bash
# 同步 OpenClaw workspace 內容到 GitHub
# 用法: ./sync-to-github.sh

set -e

REPO_DIR="$HOME/.openclaw/workspace/ai-observation-diary"
SOURCE_DIR="$HOME/.openclaw/workspace/output"

echo "🔄 同步內容到 GitHub..."

# 複製內容
cp -r "$SOURCE_DIR"/research/* "$REPO_DIR/content/research/" 2>/dev/null || true
cp -r "$SOURCE_DIR"/newsletters/* "$REPO_DIR/content/newsletters/" 2>/dev/null || true
cp -r "$SOURCE_DIR"/x-briefs/* "$REPO_DIR/content/x-briefs/" 2>/dev/null || true
cp -r "$SOURCE_DIR"/youtube-digests/* "$REPO_DIR/content/youtube-digests/" 2>/dev/null || true
cp -r "$SOURCE_DIR"/podcasts/* "$REPO_DIR/content/podcasts/" 2>/dev/null || true
cp -r "$SOURCE_DIR"/instagram/* "$REPO_DIR/content/instagram/" 2>/dev/null || true
cp -r "$SOURCE_DIR"/threads/* "$REPO_DIR/content/threads/" 2>/dev/null || true
cp -r "$SOURCE_DIR"/line/* "$REPO_DIR/content/line/" 2>/dev/null || true

# 提交到 GitHub
cd "$REPO_DIR"
git add .
if git diff --cached --quiet; then
    echo "✅ 沒有新內容需要同步"
else
    git commit -m "Sync content: $(date +%Y-%m-%d-%H:%M)"
    git push origin master
    echo "✅ 已成功同步到 GitHub!"
fi
