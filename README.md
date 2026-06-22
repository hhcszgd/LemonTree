# LemonTree — iOS App with CI/CD

A modern SwiftUI iOS application template with a fully configured **GitHub Actions** CI/CD pipeline.

## Features

- SwiftUI app with iOS 17+ deployment target
- Unit tests (Swift Testing framework)
- UI tests (XCTest)
- CI pipeline: Build + Unit Tests + UI Tests on every push/PR
- Optional deploy to TestFlight via tag releases
- SwiftLint integration
- Danger bot for PR checks

## Getting Started

### Prerequisites

- Xcode 16+
- iOS 17+ device or simulator
- An Apple Developer account (for deployment)

### Clone and Run

```bash
git clone https://github.com/hhcszgd/LemonTree.git
cd LemonTree
open LemonTree.xcodeproj
```

Select an iOS 17+ simulator and press `Cmd+R` to run.

## CI/CD Pipelines

### iOS CI (`ios-ci.yml`)

Triggered on every push to `main`/`develop` and every PR to `main`:

| Stage | Description |
|---|---|
| Build | Compile the app in Debug mode for simulator |
| Unit Tests | Run unit tests with `LemonTreeTests` target |
| UI Tests | Run UI tests with `LemonTreeUITests` target |
| SwiftLint | Static code analysis (informational) |
| Danger | Automated PR review (PRs only) |

### iOS Deploy (`ios-deploy.yml`)

Triggered by pushing a version tag (`1.0.0`, `2.3.1`, etc.) or manually via workflow_dispatch.

**Requires GitHub Secrets:**
| Secret | Description |
|---|---|
| `CERTIFICATES_P12` | Base64-encoded Apple Distribution certificate |
| `CERTIFICATES_P12_PASSWORD` | Certificate password |
| `PROVISIONING_PROFILE_BASE64` | Base64-encoded App Store provisioning profile |
| `APPLE_ID` | Your Apple ID email |
| `APPLE_APP_SPECIFIC_PASSWORD` | App-specific password for altool |
| `APPLE_TEAM_ID` | Your Apple Team ID |

## Project Structure

```
LemonTree/
├── .github/workflows/
│   ├── ios-ci.yml              # CI pipeline
│   └── ios-deploy.yml          # TestFlight deployment
├── LemonTree.xcodeproj/       # Xcode project
├── LemonTree/                 # App source
│   ├── LemonTreeApp.swift     # App entry point
│   ├── ContentView.swift       # Main content view
│   └── Assets.xcassets/        # Asset catalog
├── LemonTreeTests/            # Unit tests
└── LemonTreeUITests/          # UI tests
```

## License

MIT
