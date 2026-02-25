# OpenClaw 從新手到中級完整教程

**原始推文連結:** https://x.com/stark_nico99/status/2026235176150581282
**作者:** Nicolechan (@stark_nico99)
**發布時間:** 2026-02-24 17:58 (GMT+8)

---

## 精華重點：

*   **OpenClaw 定位**：強調其作為任務執行型 AI 助理的本質，而非單純聊天機器人，具備本地執行、數據隱私、多平台消息、持久記憶和開源免費等核心特色。
*   **分階段教學**：提供從新手到中級的完整路徑，涵蓋環境準備、安裝配置、首次對話、核心概念理解、Skills 安裝使用、Google Workspace 集成、定時任務設定、持久記憶配置。
*   **進階應用**：深入探討自定義 Skill 編寫、多 Agent 管理、Docker 沙盒安全實踐、瀏覽器控制與其他工具集成等高級應用。
*   **實用指南**：包含常見問題解答（技術要求、安全風險、API 成本、本地模型支持、中文支持等）和豐富的學習資源推薦。
*   **核心價值**：鼓勵用戶像培養員工一樣訓練 AI 助手，使其從「會說話的工具」進化為「會做事的助手」。

---

## 完整繁體中文內容：

## 最後更新： 2026 年 2 月

## 📚 目錄

1. 什麼是 OpenClaw
1. 新手階段：基礎入門
1. 進階階段：實用技能
1. 中級階段：高級應用
1. 實踐任務清單
1. 常見問題解答
1. 學習資源

# 什麼是 OpenClaw

OpenClaw（曾用名 ClawdBot/Moltbot）是 2026 年最熱門的開源 AI Agent 專案，GitHub 已獲得超過 68,000 星標。它不是普通的聊天機器人，而是一個真正能夠執行任務的個人 AI 助理。

本地執行
資料儲存在你的設備上，無需上傳雲端
完全掌控隱私和資料安全

真實執行
不僅是對話，能實際操作你的電腦
自動化處理郵件、日曆、檔案管理等任務

多平台消息
支援 WhatsApp、Telegram、Discord、Slack 等 10+ 平台
從單一入口管理所有通訊

持久記憶
跨會話保存上下文和使用者偏好
隨著時間推移越來越了解你，持續提升效率

開源免費
完全開源，只需自備 API Key
免費，完全自主控制

OpenClaw vs 傳統 AI 助手

傳統 AI（如 ChatGPT）：

- 你：「幫我整理桌面檔案」

- AI：「我建議你可以這樣做：1. 建立資料夾…… 2. 按類型分類……」

OpenClaw：

- 你：「幫我整理桌面檔案」

- OpenClaw：直接重新命名、分類、移動檔案「已完成！我把 47 個檔案按類型整理到 5 個資料夾中。」

這就是「聊天機器人」和「AI Agent」的本質區別。

# 新手階段：基礎入門

## 第一步：環境準備

系統要求

- 作業系統： macOS、Linux 或 Windows （需要 WSL）
- Node.js: v18 或更高版本
- AI 模型 API Key: Claude 或 GPT 的 API 密鑰

🔨 實踐任務 1：檢查環境

# 檢查 Node.js 版本
node --version

# 如果版本低於 v18，需要升級
# macOS/Linux 使用 nvm
nvm install 18
nvm use 18

# Windows 訪問 nodejs.org 下載安裝

✅ 完成標準： 終端顯示 Node.js 版本 >= v18.0.0

## 第二步：安裝 OpenClaw

方法一：NPM 安裝（推薦新手）

方法二：Docker 安裝（推薦有 Docker 經驗者）

方法三：原始碼安裝（開發者）

🔨 實踐任務 2：完成安裝

選擇一種安裝方式，完成 OpenClaw 的安裝。

✅ 完成標準： 運行 openclaw --version 或 openclaw --help 能正常顯示資訊

## 第三步：初始化配置

運行向導

向導會引導你完成：

1. 選擇 AI 模型供應商（Anthropic Claude / OpenAI GPT / 本地模型）

1. 輸入 API Key

1. 選擇消息平台（Telegram / Discord / WhatsApp 等）

1. 配置系統權限（建議先選擇沙盒模式）

配置 API Key

如果你還沒有 API Key，可以透過以下途徑獲取：

- Anthropic Claude: anthropic.com（推薦，$20/月 Pro 訂閱）

- OpenAI GPT: platform.openai.com

- API 聚合服務： apiyi.com（支援多模型，新用戶有免費額度）

🔨 實踐任務 3：完成初始化

運行 openclaw onboard 並完成所有配置步驟。

✅ 完成標準：

- 成功配置 API Key

- 選擇至少一個消息平台

- 完成權限設定（建議先選沙盒模式）

## 第四步：第一次對話

啟動 OpenClaw

連接消息平台

Telegram 範例：

1. 在 Telegram 中搜尋 @BotFather

1. 發送 /newbot 建立新機器人

1. 獲取 Bot Token

1. 配置到 OpenClaw:

1. 在 Telegram 中搜尋你的機器人並開始對話

🔨 實踐任務 4：第一次對話

與你的 OpenClaw 助手進行第一次對話，測試以下命令：

✅ 完成標準： 機器人能正常回覆你的消息

## 第五步：理解核心概念

Gateway（網關）

Gateway 是 OpenClaw 與外部世界互動的方式：

- 消息網關： Telegram、Discord、WhatsApp

- API 網關： HTTP API 介面

- CLI 網關： 命令列互動

Skills（技能）

Skills 是 OpenClaw 的能力擴展，類似於「插件」或「應用程式」：

- 每個 Skill 定義了一組特定任務

- 可以從 Clawhub 安裝第三方 Skills

- 也可以自己編寫自訂 Skills

Memory（記憶）

OpenClaw 會記住：

- 你的偏好和習慣

- 之前的對話上下文

- 重要的資訊和任務

Sandbox（沙盒）

沙盒模式限制 OpenClaw 的系統訪問權限，保護你的電腦安全：

- Sandbox Mode: 限制檔案系統、網路、Shell 訪問

- Full Access Mode: 完全權限（需謹慎使用）

🔨 實踐任務 5：探索工作空間

✅ 完成標準： 理解 OpenClaw 的檔案結構和基本配置

# 進階階段：實用技能

## 第六步：安裝和使用 Skills

瀏覽 Skills 市場

訪問 Clawhub 或使用命令：

安裝常用 Skills

🔨 實踐任務 6：安裝並測試 Skills

1. 安裝至少 3 個 Skills

1. 測試每個 Skill 的功能

1. 記錄哪些 Skills 對你最有用

✅ 完成標準： 成功安裝並使用至少 3 個 Skills

## 第七步：Google Workspace 整合

OpenClaw 可以管理你的 Gmail、Google Calendar、Google Docs 等。

配置步驟

1. 建立 Google Cloud 專案
訪問 console.cloud.google.com
建立新專案
啟用 Gmail API、Google Calendar API、Google Drive API

2.建立服務帳號
在 IAM & Admin → Service Accounts 建立服務帳號
下載 JSON 密鑰檔案

3.配置 OpenClaw

4.授權訪問

🔨 實踐任務 7：Google 整合實踐

完成以下任務：

1.日曆管理：讓 OpenClaw 為你建立一個會議邀請

2.郵件處理：讓 OpenClaw 檢查未讀郵件

3.文件編輯：建立一個 Google Doc

✅ 完成標準： 成功完成至少 2 個 Google Workspace 任務

## 第八步：設定定時任務（Cron Jobs）

OpenClaw 可以定期自動執行任務。

建立每日簡報

OpenClaw 會自動建立一個定時任務（cron job）。

查看定時任務

🔨 實踐任務 8：建立定時任務

建立以下定時任務：

1. 每日簡報：每天早上發送天氣和行程

1. 每週總結：每週五下午發送本週統計

1. 定時提醒：每天下午 6 點提醒你結束工作

✅ 完成標準： 至少建立 2 個定時任務並驗證它們能正常運行

## 第九步：配置持久記憶

OpenClaw 的記憶系統讓它能記住你的偏好。

訓練你的助手

告訴 OpenClaw 關於你的資訊：

查看記憶

🔨 實踐任務 9：個性化你的助手

1. 給你的助手取個名字

1. 告訴它你的基本資訊和偏好

1. 設定你的工作習慣和時間安排

1. 測試它是否記住了這些資訊

✅ 完成標準： OpenClaw 能在對話中體現出對你的了解

# 中級階段：高級應用

## 第十步：編寫自訂 Skill

Skills 使用 YAML 或 Markdown 格式定義。

Skill 基本結構

建立檔案 ~/.openclaw/skills/my-first-skill.yaml:

name: 「每日新聞摘要」
description: 「獲取並總結今日科技新聞」
version: 「1.0.0」

安裝自訂 Skill

🔨 實踐任務 10：建立自訂 Skill

建立一個自訂 Skill，實現以下功能之一：

1. 天氣助手：查詢指定城市的天氣並格式化輸出

1. 任務管理器：新增、查看、完成待辦事項

1. 網站監控：定期檢查某個網站是否可訪問

1. 價格追蹤：監控某個商品的價格變化

✅ 完成標準： 成功建立並運行一個自訂 Skill

## 第十一步：多 Agent 管理

你可以運行多個 OpenClaw 實例，每個有不同的配置和用途。

建立多個 Agent

使用場景

- 工作 Agent: 連接公司郵箱、專案管理工具

- 個人 Agent: 管理個人行程、家庭事務

- 實驗 Agent: 測試新功能、新 Skills

🔨 實踐任務 11：配置多 Agent

建立至少 2 個不同用途的 Agent，並為它們配置不同的：

- AI 模型

- 消息平台

- Skills

- 權限級別

✅ 完成標準： 能夠在不同 Agent 之間切換並使用

## 第十二步：Docker 沙盒安全實踐

Docker 沙盒提供最強的安全性隔離。

配置 Docker 沙盒

沙盒限制

Docker 沙盒會限制：

- 檔案系統訪問（只能訪問指定目錄）

- 網路訪問（可配置白名單）

- 系統命令執行

- 資源使用（CPU、記憶體限制）

🔨 實踐任務 12：安全配置

1. 啟用 Docker 沙盒模式

1. 運行安全稽核：openclaw security audit --deep

1. 根據稽核結果修復安全問題

1. 測試沙盒限制是否生效

✅ 完成標準： 安全稽核通過，沙盒正常工作

## 第十三步：瀏覽器控制

OpenClaw 可以控制瀏覽器執行複雜的網頁操作。

啟用瀏覽器控制

使用範例

🔨 實踐任務 13：瀏覽器自動化

使用瀏覽器控制完成以下任務：

1. 資訊收集：從某個網站抓取資料並整理

1. 表單填寫：自動填寫一個線上表單

1. 價格比較：在多個網站比較同一商品的價格

✅ 完成標準： 成功完成至少 1 個瀏覽器自動化任務

## 第十四步：與其他工具整合

Linear 整合（專案管理）

使用範例：

Obsidian 整合（筆記）

使用範例：

🔨 實踐任務 14：整合第三方工具

選擇至少 2 個你常用的工具，將它們與 OpenClaw 整合：

- 專案管理： Linear, Jira, Trello

- 筆記： Obsidian, Notion, Evernote

- 程式碼： GitHub, GitLab

- 通訊： Slack, Discord, Teams

- 其他： 根據你的需求

✅ 完成標準： 成功整合並使用至少 2 個第三方工具

## 第十五步：高級配置優化

性能優化

成本控制

日誌和偵錯

🔨 實踐任務 15：優化配置

1. 根據你的使用情況優化性能配置

1. 設定成本控制，避免意外高額費用

1. 配置日誌，方便偵錯問題

1. 監控一週的使用情況和成本

✅ 完成標準：

- 配置了成本控制

- 能查看使用統計

- 理解日誌系統

## 實踐任務清單

新手階段（必做）

- 任務 1: 檢查並安裝 Node.js v18+

- 任務 2: 完成 OpenClaw 安裝（選擇一種方式）

- 任務 3: 運行初始化向導，配置 API Key

- 任務 4: 與 OpenClaw 完成第一次對話

- 任務 5: 探索工作空間和配置文件

進階階段（推薦）

- 任務 6: 安裝並測試至少 3 個 Skills

- 任務 7: 完成 Google Workspace 整合（至少 2 個功能）

- 任務 8: 建立至少 2 個定時任務

- 任務 9: 個性化你的助手，配置記憶系統

中級階段（進階）

- 任務 10: 建立一個自訂 Skill

- 任務 11: 配置多個 Agent 用於不同場景

- 任務 12: 啟用 Docker 沙盒並通過安全稽核

- 任務 13: 完成一個瀏覽器自動化任務

- 任務 14: 整合至少 2 個第三方工具

- 任務 15: 優化配置並設定成本控制

實戰專案（挑戰）

- 專案 1: 建構一個自動化工作流，每天早上發送個性化簡報

- 專案 2: 建立一個郵件自動分類和回覆系統

- 專案 3: 搭建一個多渠道消息聚合中心

- 專案 4: 開發一個價格監控和提醒系統

- 專案 5: 建構一個自動化內容發布系統（部落格/社交媒體）

# 常見問題解答

## Q1: OpenClaw 的技術要求是什麼？

OpenClaw 主要面向有一定技術背景的使用者。你需要：

- 會使用命令列

- 理解環境變數配置

- 了解 API Key 的概念

但安裝過程已經大大簡化，只要你能運行 npm 命令，就能使用 OpenClaw。

## Q2: 如何管理安全風險？

關鍵安全建議：

1. 使用沙盒模式：初期測試時使用沙盒模式

1. 不要儲存敏感密碼：不要在配置文件中儲存明文密碼

1. 定期審查：定期檢查自動化規則

1. 理解權限：只啟用你需要的權限

1. 專用設備：建議在專用設備上運行（如 Mac Mini、舊筆記本電腦）

1. 獨立帳號：給 OpenClaw 建立獨立的郵箱和帳號

## Q3: API 成本大概是多少？

取決於使用強度：

- 輕度使用（每天 10-20 次對話）：約 $5-10/月

- 中度使用（每天 50-100 次對話 + 定時任務）：約 $20-30/月

- 重度使用（大量自動化 + 瀏覽器控制）：約 $50-100/月

省錢技巧：

- 使用 API 聚合服務獲取更優惠的價格

- 設定每日/每月使用限制

- 優先使用較便宜的模型

- 新用戶通常有免費額度

## Q4: 可以使用本地模型嗎？

可以！OpenClaw 支援透過 Ollama 連接本地模型：

注意：本地模型的能力通常不如雲端大模型，複雜任務可能表現不佳。

## Q5: OpenClaw 支援中文嗎？

完全支援！OpenClaw 有中文社區維護的漢化版本：

- GitHub: MaoTouHU/OpenClawChinese

- 提供中文介面和中文文件

- 每小時自動同步官方更新

你也可以使用英文版，它能理解和回覆中文。

## Q6: 如何備份我的配置？

OpenClaw 支援 GitHub 同步功能，可以自動備份配置。

## Q7: 遇到問題如何偵錯？

Q8: 可以在伺服器上運行嗎？

可以！許多使用者在 VPS 或雲伺服器上運行 OpenClaw：

推薦平台：

- DigitalOcean（一鍵部署）

- AWS EC2

- 阿里云輕量應用伺服器

- Cloudflare Workers（$5/月方案）

注意事項：

- 確保伺服器安全配置

- 使用 HTTPS 連接

- 配置防火牆

- 定期更新系統

## 學習資源

官方資源

- 官方網站： https://openclaw.ai/

- GitHub 儲存庫： github.com/openclaw/openclaw

- 官方文件： https://docs.openclaw.ai/zh-CN

- Skills 市場： github.com/VoltAgent/awesome-openclaw-skills

影片教程

- freeCodeCamp 完整教程 (1 小時）: YouTube

- OpenClaw 新手入門 (30 分鐘）: YouTube

- 30 分鐘精通 OpenClaw: YouTube

- OpenClaw 速成課程： YouTube

文字教程

- freeCodeCamp 新手教程： freecodecamp.org

- DigitalOcean 部署教程： digitalocean.com

- Reddit 詳細指南： reddit.com/r/clawdbot

中文資源

- CSDN 漢化版教程： blog.csdn.net

- OpenClaw 中文使用教程： lua.ren

- 阿里云部署教程： help.aliyun.com

- Apifox 安裝指南： apifox.com

社區

- Reddit: r/clawdbot, r/AiForSmallBusiness

- Discord: OpenClaw 官方 Discord 伺服器

- GitHub Discussions: 在 GitHub 儲存庫的 Discussions 區提問

- 中文社區： MaoTouHU/OpenClawChinese

## 下一步

完成這個教程後，你應該已經掌握了 OpenClaw 從基礎到中級的大部分核心技能。接下來你可以：

1. 深入某個領域：選擇一個你最感興趣的功能（如瀏覽器自動化、郵件管理等）深入研究

1. 參與社區：在 GitHub 上貢獻程式碼，或在 Clawhub 上分享你的 Skills

1. 建構實戰專案：用 OpenClaw 解決你實際工作或生活中的問題

1. 探索高級功能：研究多 Agent 協作、自訂插件開發等高級話題

OpenClaw 代表了 AI 助手的下一步：從「會說話的工具」到「會做事的助手」。對於願意花時間配置的使用者來說，它可以成為真正的數位分身。

祝你在 OpenClaw 的探索之旅中收穫滿滿！🦞✨

最後更新： 2026 年 2 月 24 日
版本： 1.0
作者： YouMind 基於最新網路資源整理