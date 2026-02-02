# Ali Ramadan El Banna - Flutter Developer Portfolio

A modern, dark-themed portfolio website built with Flutter Web showcasing my work as a Flutter Developer.

## 🌟 Features

- **Modern Dark Theme** - Sleek, professional design with cyan and pink accent colors
- **Fully Responsive** - Works perfectly on desktop, tablet, and mobile devices
- **Smooth Animations** - Engaging user experience with fluid transitions
- **Interactive Sections** - Hero, About, Skills, Projects, Experience, and Contact
- **Featured Projects** - Highlighting COPA, Gdawel ERP, EyeTrack, and Pasma HRM
- **Clean Code** - Built with Flutter best practices and organized structure

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.0.0 or higher)
- Dart SDK
- A code editor (VS Code or Android Studio recommended)

### Installation

1. Clone this repository:
```bash
git clone https://github.com/yourusername/portfolio.git
cd portfolio
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app locally:
```bash
flutter run -d chrome
```

## 📦 Building for Production

Build the web app for deployment:

```bash
flutter build web --release --web-renderer canvaskit
```

The built files will be in the `build/web` directory.

## 🌐 Deploying to GitHub Pages

### Option 1: Using GitHub Actions (Automated)

1. Create a new repository on GitHub
2. Push your code to the repository
3. Create `.github/workflows/deploy.yml` with the following content:

```yaml
name: Deploy to GitHub Pages

on:
  push:
    branches: [ main ]

jobs:
  build-and-deploy:
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v3
    
    - uses: subosito/flutter-action@v2
      with:
        flutter-version: '3.16.0'
        channel: 'stable'
    
    - name: Install dependencies
      run: flutter pub get
    
    - name: Build web
      run: flutter build web --release --web-renderer canvaskit --base-href /portfolio/
    
    - name: Deploy to GitHub Pages
      uses: peaceiris/actions-gh-pages@v3
      with:
        github_token: ${{ secrets.GITHUB_TOKEN }}
        publish_dir: ./build/web
```

4. Go to your repository Settings > Pages
5. Set Source to "gh-pages" branch
6. Your site will be live at `https://yourusername.github.io/portfolio/`

### Option 2: Manual Deployment

1. Build the web app:
```bash
flutter build web --release --web-renderer canvaskit --base-href /portfolio/
```

2. Install gh-pages (if not already installed):
```bash
npm install -g gh-pages
```

3. Deploy to GitHub Pages:
```bash
gh-pages -d build/web
```

## 🎨 Customization

### Update Personal Information

Edit the following files to customize with your information:

- `lib/widgets/hero_section.dart` - Name and title
- `lib/widgets/about_section.dart` - About me text and stats
- `lib/widgets/projects_section.dart` - Your projects
- `lib/widgets/experience_section.dart` - Work experience
- `lib/widgets/contact_section.dart` - Contact details

### Change Colors

Update the theme colors in `lib/main.dart`:

```dart
ColorScheme.dark(
  primary: Color(0xFF00D9FF),  // Cyan
  secondary: Color(0xFFFF006E), // Pink
  // ... other colors
)
```

### Add Your GitHub/LinkedIn Links

Update the social links in:
- `lib/widgets/hero_section.dart`
- `lib/widgets/contact_section.dart`

## 📱 Project Structure

```
portfolio/
├── lib/
│   ├── main.dart                          # App entry point
│   ├── screens/
│   │   └── home_screen.dart               # Main screen
│   └── widgets/
│       ├── animated_gradient_background.dart
│       ├── hero_section.dart
│       ├── about_section.dart
│       ├── skills_section.dart
│       ├── projects_section.dart
│       ├── experience_section.dart
│       ├── contact_section.dart
│       └── custom_navigation_bar.dart
├── web/
│   ├── index.html                         # HTML entry point
│   └── manifest.json                      # Web app manifest
└── pubspec.yaml                           # Dependencies
```

## 🛠️ Technologies Used

- **Flutter** - UI framework
- **Dart** - Programming language
- **Google Fonts** - Typography (Space Grotesk)
- **url_launcher** - Opening links

## 📄 License

This project is open source and available under the MIT License.

## 👤 Contact

- **Email**: alielbana6662@gmail.com
- **Phone**: +20 112 993 7838
- **Location**: El Menoufia, Egypt

## 🙏 Acknowledgments

- Inspired by modern web design trends
- Built with Flutter's powerful web capabilities
- Designed for optimal performance and user experience

---

**Built with Flutter 💙**