# How to get the full interactive HTML

The complete `index.html` (3D face + voice + settings + particles) is ~33 KB and is provided in the project artifacts of the conversation that created this repo.

## Quick options

1. **Use the Electron setup** – the `package.json` and `electron/main.js` point to `index.html`. Replace the current placeholder `index.html` with the full version from the build folder or from the original conversation download.

2. **Original simple version** is already in `original/index.html` and works immediately.

3. **To rebuild the full version yourself**: the features are:
   - Three.js particle background
   - Canvas-drawn animated face (talking / listening states)
   - Web Speech API for microphone (STT) and speechSynthesis (TTS) – best in Microsoft Edge
   - Settings modal (TTS/STT/rate/voice/theme/face)
   - Clear disclaimer that it is **not a real human**
   - Free software, no X/Twitter

If you need the exact full file, ask in the chat that created this repo or copy from `/home/workdir/artifacts/index.html` if you have access to the sandbox export.

The repository structure, Electron config, icon, LICENSE, setup-build.bat, and original version are all ready for you to produce the setup executable.
