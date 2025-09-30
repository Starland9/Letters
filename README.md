# Letters 🔤

A fun and educational word puzzle game built with Godot Engine, designed to help improve French vocabulary and spelling skills.

## 📖 About

Letters is an interactive mobile game where players unscramble letters to form French words. With beautiful letter tile graphics and an intuitive drag-and-drop interface, the game offers an engaging way to practice language skills.

## ✨ Features

- **Word Puzzle Gameplay**: Arrange scrambled letters to form correct French words
- **Beautiful Graphics**: Multiple letter tile styles (Blue, Box, Brown, Marble, Metal, Solid, Wood, Yellow)
- **Accent Normalization**: Automatically handles French accents for easier gameplay
- **Mobile-Optimized**: Designed specifically for Android devices with portrait orientation
- **Extensive Word Database**: Large collection of French words for varied gameplay
- **Animated Interface**: Smooth animations and visual feedback

## 🎮 How to Play

1. Launch the game on your Android device
2. View the target word shown as blank spaces (★)
3. Select letters from the scrambled collection at the bottom
4. Drag letters to their correct positions
5. Complete the word to proceed to the next challenge
6. Use the restart button to try a new word

## 🛠️ Technology Stack

- **Engine**: Godot 4.5
- **Language**: GDScript
- **Renderer**: OpenGL Compatibility
- **Target Platform**: Android (minimum orientation: portrait)

## 📁 Project Structure

```
Letters/
├── assets/           # Game assets (images, fonts, data)
│   ├── animated_face/  # Character animations
│   ├── json/          # Word database
│   └── letters/       # Letter tile graphics
├── autoloads/        # Global singleton scripts
│   ├── manager.gd    # Letter style manager
│   └── utils.gd      # Utility functions (accent removal, etc.)
├── objects/          # Reusable game objects
│   ├── animated_face/  # Animated face component
│   ├── letter/        # Letter tile component
│   ├── letter_choices/  # Letter selection interface
│   └── word/          # Word display component
├── scenes/           # Game scenes
│   └── main/         # Main game scene
└── project.godot     # Godot project configuration
```

## 🚀 Getting Started

### Prerequisites

- [Godot Engine 4.5+](https://godotengine.org/download) (for development)
- Android device or emulator (for testing)

### Installation

1. Clone the repository:
```bash
git clone https://github.com/Starland9/Letters.git
cd Letters
```

2. Open the project in Godot:
   - Launch Godot Engine
   - Click "Import"
   - Navigate to the project directory
   - Select `project.godot`
   - Click "Import & Edit"

3. Run the project:
   - Press F5 or click the Play button in Godot Editor

## 📱 Building for Android

1. Install Android SDK and configure Godot's Android export settings
2. Open **Project → Export**
3. Select the "Android" preset
4. Configure signing and build settings
5. Click **Export Project** and choose your output location
6. The APK will be generated at `.Exports/Letters.apk`

For detailed Android export instructions, see the [Godot Android Export Documentation](https://docs.godotengine.org/en/stable/tutorials/export/exporting_for_android.html).

## 🔧 Development

### Key Components

- **Letter**: Individual letter tile with drag-and-drop functionality
- **Word**: Word display with hidden letter management
- **LetterChoices**: Scrambled letter selection interface
- **Manager**: Global configuration for letter styles
- **Utils**: Utility functions including accent removal for French characters

### Adding New Words

Edit `assets/json/words.tres` to add new French words to the database:

```gdscript
data = [{
"word": "nouveau"
}, {
"word": "exemple"
}]
```

### Customizing Letter Styles

Letter tile graphics are located in `assets/letters/png/[StyleName]/`. Each style folder should contain:
- `letter.png` (empty tile)
- `letter_A.png` through `letter_Z.png` (individual letters)

## 🤝 Contributing

Contributions are welcome! Here's how you can help:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

Please ensure your code follows the existing style and includes appropriate comments.

## 📄 License

This project is available for educational and personal use. Please contact the repository owner for commercial usage rights.

## 🙏 Acknowledgments

- Letter tile graphics and assets
- Godot Engine community
- French word database contributors

## 📧 Contact

**Repository Owner**: [Starland9](https://github.com/Starland9)

For questions, suggestions, or feedback, please open an issue on GitHub.

---

Made with ❤️ using [Godot Engine](https://godotengine.org/)
