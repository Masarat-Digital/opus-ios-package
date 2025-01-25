# OpusKit

A Swift Package Manager (SPM) package to share common code between the **Opus Candidate** and **Opus Employer** iOS apps.

## Features

- Shared models
- Utilities
- Common extensions
- Networking helpers

## Installation

To integrate **OpusKit** into your iOS apps using Swift Package Manager:

TODO: (to update)
1. Open your Xcode project.
2. Go to **File > Add Packages...**.
3. Enter the repository URL: `https://github.com/yourusername/SharedCode.git`.
4. Choose the desired version or branch.
5. Add the package to your app target (**Opus Candidate** or **Opus Employer**).

## Usage

1. Import the package where needed:

   ```swift
   import SharedCode
   ```

2. Use the shared code in your projects, such as:

   ```swift
   let sharedUtility = SharedUtility()
   sharedUtility.doSomething()
   ```

## Project Structure

The package is organized as follows:

- **Sources/**: Contains all shared code.
  - **Models/**: Shared models used across both apps.
  - **Utilities/**: Helper functions and utilities.
  - **Extensions/**: Common extensions for system types.
  - **Networking/**: Shared networking logic.

- **Tests/**: Contains unit tests for the shared code.

## Contributing

1. Fork the repository.
2. Create a feature branch: `git checkout -b feature/your-feature`.
3. Commit your changes: `git commit -m "Add new feature"`.
4. Push to the branch: `git push origin feature/your-feature`.
5. Open a pull request.

## License

This project is licensed under the MIT License. See the `LICENSE` file for more details.

---

With **SharedCode**, maintaining consistency and reusing code between **Opus Candidate** and **Opus Employer** becomes seamless and efficient. Happy coding!

