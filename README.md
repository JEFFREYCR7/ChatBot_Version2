# ChatBot_Version2

<p align="center">
  <img src="https://your-image-url.com/logo.png" alt="ChatBot_Version2 Logo" width="200"/>
  <img width="128" height="128" alt="mac256 1" src="https://github.com/user-attachments/assets/cf2709b4-92ee-4b03-bffb-572e04111faa" />
</p>

ChatBot_Version2 是基于 [Ollama](https://ollama.com) 构建的本地大模型聊天 UI，支持多种开源语言模型，专注于提供现代、便捷、高效的本地 AI 聊天体验。

---

## 🧠 关于 Ollama

**[Ollama](https://ollama.com)** 是一个轻量级的本地大语言模型运行平台，它让开发者可以在本地快速部署和运行诸如 LLaMA、Qwen、Mistral、Gemma 等开源模型。

它的特点包括：

- 快速下载与切换模型
- 本地隐私保护
- 命令行 & API 支持，适合集成到各种工具中

---

## 🔧 核心功能

- ✅ 多种大模型自由选择（当前常用模型包括：`Qwen3`、`Gemma3`、`LLaMA` 等）
- ✅ 支持多轮对话
- ✅ 支持代码高亮显示
- ✅ 支持 Markdown 表格生成与渲染
- ✅ 轻量 UI，适配桌面环境，快速响应
- ✅ 可与本地 Ollama API 无缝集成

---

## 🚀 快速开始

确保你已经安装并运行 Ollama：

```bash
# 安装 Ollama（macOS 示例）
brew install ollama
或者官网下载

# 运行你喜欢的模型（例如 Qwen3）
ollama run qwen:latest
