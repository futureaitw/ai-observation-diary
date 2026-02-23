# 2026年2月23日 Threads 文章重點整理：AI Agent 的個人操作系統

## 標題
The File System Is the New Database: How I Built a Personal OS for AI Agents

## 核心主旨
透過構建一個基於 Git 倉庫的檔案系統作為 AI Agent 的「個人操作系統」，解決 AI Agent 記憶和上下文管理問題，強調透過「情境工程」而非「提示工程」來提升 AI 的實用性。

## 核心問題：上下文 (Context) 而非提示 (Prompts)
*   AI 對話中重複提供上下文、AI 遺忘問題。
*   **注意力預算**：LLM 上下文視窗有限，過多信息會降低表現。
*   **解決方案**：將 AI 上下文拆分為 11 個獨立模組，按需加載，實現「漸進式揭露」。

## 「Personal Brain OS」架構
*   **基於檔案**：生活在 Git 倉庫中的檔案系統，包含 80+ 個 Markdown, YAML, JSONL 檔案。
*   **無資料庫、無 API 密鑰、無建置步驟**：純粹的檔案系統，人類和 LLM 都能原生讀取。

## 1) 情境 (Context) 管理：漸進式揭露與指令層次
*   **漸進式揭露**：透過三級結構 (路由檔案 -> 模組指令 -> 實際數據) 按需加載信息。
*   **Agent 指令層次**：分為倉庫層 (`CLAUDE.md`)、大腦層 (`AGENT.md`)、模組層 (各目錄指令檔案)，解決指令衝突，提供清晰指導。

## 2) 檔案系統作為記憶 (The File System as Memory)
*   **無資料庫、無向量存儲、無檢索系統**：僅依賴 Git 進行版本控制。
*   **格式-功能映射**：JSONL (日誌, append-only)、YAML (配置, 可註釋)、Markdown (敘事, LLM 原生讀取)。
*   **情境記憶 (Episodic Memory)**：不僅存儲事實，還存儲判斷和經驗 (experiences.jsonl, decisions.jsonl, failures.jsonl)。
*   **跨模組引用 (Cross-Module References)**：檔案之間透過 ID 關聯，形成扁平檔案關係模型，Agent 可遍歷知識圖譜。

## 3) 技能系統 (The Skill System)：教 AI 如何做你的工作
*   **遵循 Anthropic Agent Skills 標準**：將過程編碼為結構化指令，內建品質門。
*   **自動加載 vs. 手動調用**：參考技能自動加載保持一致性；任務技能手動調用確保精準性。
*   **語音系統**：透過結構化數據和反模式列表編碼語音風格。
*   **模板作為結構化支架**：內容模板定義結構，內含品質檢查清單。

## 4) 操作系統：每日實踐
*   **內容管道**：Idea, Research, Outline, Draft, Edit, Publish, Promote 七階段流程。
*   **個人 CRM**：聯絡人分圈，記錄互動、情感，透過腳本發現需要關注的關係。
*   **自動化鏈**：多個腳本處理重複工作流，形成反饋閉環 (目標驅動內容，內容驅動指標，指標驅動審查，審查驅動目標)。

## 5) 經驗教訓與反思
*   簡化 Schema、優化語音指南結構、精確劃分模組邊界、**Append-only (追加寫入) 是核心安全機制**。

## 6) 成果與原則：情境工程 (Context Engineering)
*   **情境工程**：設計資訊架構，讓 AI 能夠做出正確決策，從優化單次互動轉向設計文件系統。
*   整個系統高度可移植，版本控制，數據可追溯。

## 相關連結
*   Threads 文章：`https://x.com/koylanai/status/2025286163641118915`
*   相關框架：`https://github.com/muratcankoylan/Agent-Skills-for-Context-Engineering`
