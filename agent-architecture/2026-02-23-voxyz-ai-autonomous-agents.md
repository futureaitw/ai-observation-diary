# 2026年2月23日 Threads 文章重點整理：自主 AI 公司架構

## 標題
我用 OpenClaw + Vercel + Supabase 建立了一家 AI 公司 — 兩週後，它們自主運行

## 核心主旨
闡述如何將 AI Agent 從「能夠產出內容」提升到「能夠自主運行網站」的閉環系統架構，並分享在兩週內實現自主化過程中遇到的三大陷阱及其解決方案。

## VoxYZ Agent World 系統構成
*   **6 個 AI Agent 角色**：Minion (決策)、Sage (策略分析)、Scout (情報收集)、Quill (內容寫作)、Xalt (社交媒體管理)、Observer (品質檢查)。
*   **技術棧**：
    *   **OpenClaw (在 VPS 上)**：Agent 的「大腦」，負責圓桌討論、Cron Jobs、深度研究。
    *   **Next.js + Vercel**：網站前端 + API 層。
    *   **Supabase**：所有狀態的單一事實來源 (提案、任務、事件、記憶)。

## 從「能夠產出」到「自主運行」的缺失環節
*   Agent 產出的內容停留在 OpenClaw 的輸出層，缺乏自動執行機制和反饋閉環。
*   需要一個完整的 **執行 → 反饋 → 再觸發** 循環。

## 閉環系統的運作流程
1.  Agent 提出想法 (Proposal)。
2.  自動審批檢查 (Auto-Approve)。
3.  創建任務和步驟 (Mission + Steps)。
4.  Worker 認領並執行 (Worker)。
5.  發出事件 (Event)。
6.  觸發新的反應 (Trigger / Reaction)。
7.  回到第一步。

## 三大陷阱與解決方案
1.  **陷阱 1：兩個地方爭搶工作** (Two Places Fighting Over Work)
    *   **問題**：VPS 上的 OpenClaw worker 和 Vercel 上的 heartbeat cron 同時嘗試認領和執行相同的任務，導致競爭條件。
    *   **解決方案**：**只保留一個執行者**。VPS 為唯一的執行者，Vercel 僅運行輕量級的控制平面。
2.  **陷阱 2：觸發了但沒人認領** (Triggered But Nobody Picked It Up)
    *   **問題**：觸發器直接插入提案表，但繞過了正常的自動審批流程。
    *   **解決方案**：**提取一個共享函數 `createProposalAndMaybeAutoApprove`**。所有創建提案的路徑都必須呼叫這一個函數。
3.  **陷阱 3：配額已滿時佇列持續增長** (Queue Keeps Growing When Quota Is Full)
    *   **問題**：配額已滿，但提案仍被批准，生成任務，並產生排隊的步驟。
    *   **解決方案**：**實施「Cap Gates」**。在提案入口點即時拒絕，不讓其產生排隊的步驟。

## 讓系統「活起來」
*   **觸發器 (Triggers)**：4 個內置規則，偵測條件並返回提案模板。
*   **反應矩陣 (Reaction Matrix)**：實現 Agent 之間自發的互動，帶有概率性。

## 自我修復 (Self-Healing)
*   **`recoverStaleSteps`**：Heartbeat 中包含此功能，用於偵測並將長時間沒有進度的任務標記為失敗。

## 完整架構
*   **OpenClaw (VPS)**：思考 + 執行 (大腦 + 雙手)。
*   **Vercel**：審批 + 監控 (控制平面)。
*   **Supabase**：所有狀態 (共享皮層)。

## 可借鑒的閉環系統最小化清單
1.  **資料庫表 (Supabase)**：定義所需的各種 `ops_` 表格。
2.  **提案服務 (單一函數)**：將提案創建、Cap Gates、自動審批、任務創建整合在一個函數中。
3.  **策略驅動配置 (ops_policy 表)**：所有行為開關和限制都配置在 `ops_policy` 表中，無需重新部署代碼即可調整。
4.  **Heartbeat (一個 API 路由 + 一行 Crontab)**：定期呼叫 heartbeat 路由，用於觸發器評估、反應佇列處理等。
5.  **VPS Worker Contract**：每個步驟類型對應一個 worker，完成步驟後呼叫 `maybeFinalizeMissionIfDone`。

## 兩週時間線
*   不含基礎設施，核心閉環 (提案 → 執行 → 反饋 → 再觸發) 大約一週即可完成。

## 未來展望
*   下一篇文章將探討 Agent 如何「爭論」和「說服」彼此，實現團隊認知。
