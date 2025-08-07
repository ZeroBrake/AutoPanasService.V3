# AutoPanas Backend API v3

This is the backend API for the AutoPanas project. 
It is written in TypeScript and uses the [Hono](https://github.com/honojs/hono) framework.
Also, it uses [Bun](https://bun.sh) as a JavaScript runtime.

## Getting Started

To install dependencies:

```bash
bun install
```

To run:

```bash
bun run app.ts
```

This project was created using `bun init` in bun v1.2.19. [Bun](https://bun.com) is a fast all-in-one JavaScript runtime.


## Installation

### Windows

1. Install the libSQL SDK and its Prisma driver
```bash
bun add @libsql/client @prisma/adapter-libsql
```

2. Retrieve database credentials.

    Get the database URL:
    ```bash
    turso db show --url <database-name>
    ```

   Get the database authentication token:
    ```bash
    turso db tokens create <database-name>
    ```
   
    Assign credentials to the environment variables inside .env.
    ```aiignore
    TURSO_DATABASE_URL=
    TURSO_AUTH_TOKEN=
    ```

3. How to install the Turso CLI: [https://docs.turso.tech/cli/installation](https://docs.turso.tech/cli/installation)
4. See more details about the [Prisma + Turso](https://docs.turso.tech/sdk/ts/orm/prisma).