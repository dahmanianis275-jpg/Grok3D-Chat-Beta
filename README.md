# Grok3D Chat — Beta v0.1.0

A beautiful **ChatGPT-style chat interface** with a live **3D particle + geometric background** powered by Three.js.

## Features

- Immersive 3D animated background (particles + floating wireframe shapes)
- Modern glassmorphism chat UI
- Typing indicator & smooth animations
- Responsive design
- Pure HTML / CSS / JS — no build step required for the web version
- Simulated responses (ready to plug in real LLM APIs)

## Quick Start (Web)

Just open `index.html` in any modern browser.

Or serve it:

```bash
npx serve .
# or
python -m http.server 8080
```

## Make it a Desktop .EXE (Windows)

### Option A — Electron (recommended for beta)

1. Create a new folder and copy `index.html` into it.
2. Initialize:

```bash
npm init -y
npm install electron electron-builder --save-dev
```

3. Add to `package.json`:

```json
{
  "main": "main.js",
  "scripts": {
    "start": "electron .",
    "dist": "electron-builder --win"
  },
  "build": {
    "appId": "com.grok3d.chat",
    "productName": "Grok3D Chat",
    "directories": { "output": "dist" },
    "win": {
      "target": "nsis",
      "icon": "icon.ico"
    }
  }
}
```

4. Create `main.js`:

```js
const { app, BrowserWindow } = require('electron');
const path = require('path');

function createWindow() {
  const win = new BrowserWindow({
    width: 1100,
    height: 750,
    minWidth: 800,
    minHeight: 600,
    backgroundColor: '#0a0a0f',
    webPreferences: {
      nodeIntegration: false,
      contextIsolation: true
    }
  });
  win.loadFile('index.html');
  // win.setMenu(null); // optional: remove menu
}

app.whenReady().then(createWindow);
app.on('window-all-closed', () => { if (process.platform !== 'darwin') app.quit(); });
```

5. Build the EXE:

```bash
npm run dist
```

The installer / portable EXE will appear in the `dist/` folder.

### Option B — Lighter alternatives

- **Tauri** (Rust) → very small binary
- **Neutralinojs** → lightweight
- **WebView2 + C# / Python** wrappers

## Adding Real AI

Replace the `getResponse()` function with a call to:

- OpenAI Chat Completions
- xAI Grok API
- Local Ollama / LM Studio
- Any OpenAI-compatible endpoint

Example (OpenAI-style):

```js
async function getResponse(text) {
  const res = await fetch('https://api.openai.com/v1/chat/completions', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': `Bearer ${YOUR_API_KEY}`
    },
    body: JSON.stringify({
      model: 'gpt-4o-mini',
      messages: [{ role: 'user', content: text }]
    })
  });
  const data = await res.json();
  return data.choices[0].message.content;
}
```

## License

MIT — free to use, modify, and distribute.

---

**Built as a beta demo** • HTML + Three.js • Enjoy the 3D vibes ✨
