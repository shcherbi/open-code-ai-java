# open-code-ai-java

> Reusable AI development infrastructure for Java projects, optimized for OpenCode

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

*This project is not affiliated with OpenCode.*

## What is this?

A collection of reusable components for [OpenCode](https://opencode.ai/docs). The core of this project is a set of **skills** (structured markdown files that provide OpenCode with domain knowledge and workflows), but it also includes project templates, MCP server configurations, and setup scripts.

**Who is this for?** Java developers using OpenCode who want consistent, high-quality AI assistance for common tasks like code reviews, testing, commits, and architecture decisions.

## Purpose

AI-powered development workflows with focus on:
- **Token efficiency** - Designed for fewer iterations and lower token usage
- **Reproducible patterns** - Reusable workflows across projects
- **Java ecosystem** - Tailored for Java/Maven development
- **Incremental adoption** - Start small, expand as needed

## Quick Start

### 1. Clone this workspace
```bash
git clone https://github.com/decebals/claude-code-java.git ~/projects/claude-code-java
cd ~/projects/claude-code-java
chmod +x scripts/*.sh
```

### 2. Setup your Java project
```bash
./scripts/setup-project.sh ~/projects/your-java-project
```

This creates `.opencode/` with symlinked skills, generates `AGENTS.md`, and configures `opencode.json`.

**Prefer manual setup?** Just copy or symlink the skills you want:
```bash
mkdir -p your-project/.opencode/skill

# Copy specific skills
cp -r ~/projects/claude-code-java/.opencode/skill/java-code-review your-project/.opencode/skill/

# Or symlink all skills
ln -s ~/projects/claude-code-java/.opencode/skill/* your-project/.opencode/skill/
```

### 3. Use with OpenCode
```bash
cd ~/projects/your-java-project
opencode

# Skills load automatically based on context, or invoke directly:
> "Use the git-commit skill"
> "Use the java-code-review skill"
```

## Available Skills (18)

Skills are automatically loaded by OpenCode based on context.

### Workflow
| Skill | Trigger Examples |
|-------|------------------|
| [**git-commit**](.opencode/skill/git-commit/) | "commit these changes", "create commit" |
| [**changelog-generator**](.opencode/skill/changelog-generator/) | "generate changelog", "what changed since release" |
| [**issue-triage**](.opencode/skill/issue-triage/) | "triage issues", "check open issues" |

### Code Quality
| Skill | Trigger Examples |
|-------|------------------|
| [**java-code-review**](.opencode/skill/java-code-review/) | "review this code", "check this PR" |
| [**api-contract-review**](.opencode/skill/api-contract-review/) | "review API", "check REST endpoints" |
| [**concurrency-review**](.opencode/skill/concurrency-review/) | "check thread safety", "review async code" |
| [**performance-smell-detection**](.opencode/skill/performance-smell-detection/) | "check performance", "find slow code" |
| [**test-quality**](.opencode/skill/test-quality/) | "add tests", "improve coverage" |
| [**maven-dependency-audit**](.opencode/skill/maven-dependency-audit/) | "check dependencies", "audit deps" |
| [**security-audit**](.opencode/skill/security-audit/) | "security review", "check OWASP", "vulnerabilities" |

### Architecture & Design
| Skill | Trigger Examples |
|-------|------------------|
| [**architecture-review**](.opencode/skill/architecture-review/) | "review architecture", "check package structure" |
| [**solid-principles**](.opencode/skill/solid-principles/) | "check SOLID", "single responsibility" |
| [**design-patterns**](.opencode/skill/design-patterns/) | "use factory pattern", "implement strategy" |
| [**clean-code**](.opencode/skill/clean-code/) | "clean this code", "refactor" |

### Framework & Data
| Skill | Trigger Examples |
|-------|------------------|
| [**spring-boot-patterns**](.opencode/skill/spring-boot-patterns/) | "create controller", "Spring Boot help" |
| [**java-migration**](.opencode/skill/java-migration/) | "upgrade to Java 21", "migrate from Java 8" |
| [**jpa-patterns**](.opencode/skill/jpa-patterns/) | "N+1 problem", "LazyInitializationException" |
| [**logging-patterns**](.opencode/skill/logging-patterns/) | "add logging", "debug this flow", "analyze logs" |

See [.opencode/skill/README.md](.opencode/skill/README.md) for full documentation and [docs/SCRIPTS.md](docs/SCRIPTS.md) for setup script options.

## Project Structure

```
claude-code-java/
├── README.md                    # This file
├── LICENSE                      # MIT license
├── .gitignore                   # Git ignore rules
├── .opencode/
│   └── skill/                   # 18 reusable skills (see Available Skills above)
├── docs/                        # Guidelines and best practices
│   ├── DESIGN_PRINCIPLES.md     # Core philosophy
│   ├── RED_FLAGS.md             # Warning signs to watch for
│   ├── SAFE_WORKFLOWS.md        # Step-by-step safe workflows
│   ├── SCRIPTS.md               # Scripts documentation
│   ├── SKILL_GUIDELINES.md      # How to create new skills
│   └── TESTING.md               # Testing strategy
├── templates/
│   ├── AGENTS.md.template       # Template for projects
│   └── opencode.json.template   # OpenCode config template (permissions + MCP)
└── scripts/
    ├── setup-project.sh         # Full project setup (orchestrator)
    ├── link-skills.sh           # Symlink skills to project
    ├── generate-agents-md.sh    # Generate AGENTS.md
    ├── configure-opencode.sh    # Configure opencode.json
    └── test-all.sh              # Run all tests
```

## Typical Workflow

1. **Link skills** to your Java project
2. **Start OpenCode** in project directory
3. **Load skill** relevant to current task
4. **Execute workflow** with natural language
5. **Measure results** (tokens used, time saved)

## Success Metrics

Track these to validate effectiveness:

- **Token reduction**: Track your improvement vs manual workflows
- **Time savings**: Measure before/after per task
- **Reusability**: Number of projects using skills
- **Quality**: Code review feedback, test coverage

## Requirements

- [OpenCode](https://opencode.ai/docs) installed
- Java 11+ projects (Java 17+ recommended)
- Git for version control
- Maven or Gradle build tool
- (Optional) [OpenCode GitHub integration](https://opencode.ai/docs/github)

## What's Included

- 18 skills (workflow, code quality, architecture, frameworks)
- Setup automation scripts
- Project templates
- YAML frontmatter for automatic skill detection

## Contributing

Skills are evolving based on real-world usage. Try them, open issues, share what works.

1. Try the skills in your projects
2. Open issues for suggestions
3. Share token savings/improvements

## Documentation

See [docs/](docs/) for detailed guides:
- [DESIGN_PRINCIPLES.md](docs/DESIGN_PRINCIPLES.md) - Core philosophy
- [SAFE_WORKFLOWS.md](docs/SAFE_WORKFLOWS.md) - Recommended workflows
- [RED_FLAGS.md](docs/RED_FLAGS.md) - Warning signs to watch for
- [SKILL_GUIDELINES.md](docs/SKILL_GUIDELINES.md) - How to create new skills

## License

MIT License - Use freely, modify as needed.
