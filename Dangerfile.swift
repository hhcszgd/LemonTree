import Danger

let danger = Danger()

// ── Warn about large PRs ──────────────────────────────────────────
let bigPRThreshold = 500
if danger.git.createdFiles.count + danger.git.modifiedFiles.count > bigPRThreshold {
    warn("This PR is quite large — consider splitting it into smaller ones.")
}

// ── Check for changelog entry ─────────────────────────────────────
let changelogChanged = danger.git.modifiedFiles.contains("CHANGELOG.md")
if !changelogChanged {
    warn("No changes to CHANGELOG.md — consider documenting your changes.")
}

// ── Enforce test files for code changes ───────────────────────────
let sourceFiles = danger.git.modifiedFiles.filter { $0.hasSuffix(".swift") && !$0.contains("Tests") }
let testFiles = danger.git.modifiedFiles.filter { $0.contains("Tests") }

if sourceFiles.count > 0 && testFiles.count == 0 {
    warn("You modified Swift source files but no test files — please add tests.")
}

// ── Check for TODOs ───────────────────────────────────────────────
let allFiles = danger.git.createdFiles + danger.git.modifiedFiles
let todos = allFiles.flatMap { path -> [String] in
    if let content = try? String(contentsOfFile: path) {
        let lines = content.split(separator: "\n")
            .filter { $0.contains("TODO") || $0.contains("FIXME") }
            .map { String($0).trimmingCharacters(in: .whitespaces) }
        return lines.isEmpty ? [] : ["\(path): \(lines.joined(separator: ", "))"]
    }
    return []
}

if !todos.isEmpty {
    warn("Found TODO/FIXME marks:\n" + todos.joined(separator: "\n"))
}

// ── Message if everything looks good ──────────────────────────────
message("All checks passed — looks good!")
