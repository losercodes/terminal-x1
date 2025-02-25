# TerminalGenius - AI Assistant for Ubuntu Terminal

![TerminalGenius](https://img.shields.io/badge/Ubuntu-Terminal--AI-blue?style=for-the-badge)

TerminalGenius is a lightweight, terminal-integrated AI assistant for Ubuntu. It uses the **Google Gemini API** to provide programming assistance, Stack Overflow integration, and intelligent file searching.

---

## 🔥 Features

### 📌 Programming Assistance
- Uses **Google Gemini Pro API** for intelligent, context-aware responses
- Formats code snippets with proper syntax highlighting
- Configurable to prioritize efficient solutions

### 📌 Stack Overflow Integration
- Retrieves relevant, highly-rated answers
- Provides summaries and direct links
- Indicates accepted answers

### 📌 File Search
- Implements **fuzzy matching** using `fuzzywuzzy`
- Presents prioritized results with match quality indicators
- Shows search paths and scores

### 📌 Performance Optimizations
- **Resource Monitoring**: Tracks CPU and memory usage in real-time
- **Caching**: Implements TTL-based caching to reduce API calls
- **Minimal Dependencies**: Uses lightweight libraries
- **AsyncIO**: Handles concurrent operations efficiently

---

## 🚀 Installation

Run the installation script to set up TerminalGenius:
```bash
bash connect.sh
```
The script will:
✅ Create a Python virtual environment  
✅ Install required dependencies  
✅ Set up a convenient `tg` command for terminal access  
✅ Configure **auto-start** when opening a new terminal  

---

## 📌 Usage

### 🤖 Ask a programming question
```bash
tg ask "How do I use grep to find text in multiple files?"
```

### 🔍 Search for files
```bash
tg find "report" --depth 4
```

### 📚 Look up Stack Overflow answers
```bash
tg so "python pandas groupby"
```

### ⚡ Combined AI + Stack Overflow search
```bash
tg ask "How to optimize SQL queries?" --so
```

### ⚙️ View and modify configuration
```bash
tg config --list
tg config --set enable_cache true
```

---

## 🔧 Extension & Customization

TerminalGenius is modular and customizable:
- **Custom API Configuration**: Easily switch between AI providers
- **Adjustable Search Parameters**: Modify depth, filtering, and ranking
- **Multiple Output Styles**: Plain text, markdown, or JSON
- **Performance Tuning Options**: Optimize caching and concurrency

---

## 🛠 Getting Started
1. **Run the installation script:**
   ```bash
   bash connect.sh
   ```
2. **Edit `.env` and add your Google Gemini API key:**
   ```env
   GEMINI_API_KEY=your_api_key_here
   ```
3. **Start using `tg` commands from your terminal!**

---

## 📜 License
This project is open-source and available under the MIT License.

🚀 Happy coding with **TerminalGenius**! 🎯

