# ChatBot_Version2

<p align="center">
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
```

模型选择（根据用户Ollama所下载的模型）
<p align="center">
<img width="788" height="324" alt="截屏2025-07-29 02 07 08" src="https://github.com/user-attachments/assets/a3264318-1b5f-4b00-b828-d95636a340a2" />
</p>

代码高亮
<p align="center">
<img width="1359" height="875" alt="截屏2025-07-29 02 01 17" src="https://github.com/user-attachments/assets/6e721ab5-dad0-4915-93f1-985eafa9464a" />
</p>

表格生成
<p align="center">
<img width="903" height="811" alt="截屏2025-07-29 01 58 58" src="https://github.com/user-attachments/assets/16a61abe-980b-4ed2-bb9c-961f65d9125b" />
</p>

Markdown格式
<p align="center">
<img width="1512" height="944" alt="截屏2025-07-29 02 11 27" src="https://github.com/user-attachments/assets/f8d18619-6310-404b-b7ae-5c7b11065c50" width="200"/>
 </p>
 
示例展示
# 微积分基础知识笔记

## 1. 导数 (Derivatives)

*   **定义:** 导数衡量的是函数在某一点的变化率。
    *   几何意义：切线的斜率。
    *   物理意义：瞬时速度、加速度等。
*   **求导公式:**
    *   **幂函数:**  d/dx (x<sup>n</sup>) = n*x<sup>(n-1)</sup>
    *   **常数函数:** d/dx (c) = 0
    *   **常数倍函数:** d/dx (c*f(x)) = c*df/dx
    *   **和与差函数:** d/dx (f(x) ± g(x)) = df/dx ± dg/dx
    *   **积的导数:** (uv)' = u'v + uv'
    *   **商的导数:** ((u/v))' = (u'v - uv') / v<sup>2</sup>
    *   **链式法则:**  d/dx [f(g(x))] = f'(g(x)) * g'(x)
*   **导数的应用:**
    *   **极值问题:**  求函数极大值和极小值。
    *   **平均值问题:**  求函数在给定区间上的平均值。
    *   **速率与变化率:**  根据曲线的斜率来分析物体运动。


