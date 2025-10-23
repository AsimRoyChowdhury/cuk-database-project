# University Data Project

A modern university data management system built with a monorepo architecture.

## 📁 Project Structure

This monorepo contains three main packages:

- **Frontend**: `apps/frontend` - Next.js application with TanStack Table and TanStack Query
- **Backend**: `apps/backend` - Hono API with Lucia Auth and Zod validation
- **Database**: `packages/database` - PostgreSQL database with Prisma ORM

## 🚀 One-Time Setup

You only need to complete these steps once when setting up the project for the first time.

### 1. Install Prerequisites

Before you begin, make sure you have the following installed:

1. **Git** - Download from [git-scm.com](https://git-scm.com)
2. **Node.js** - Download the LTS version from [nodejs.org](https://nodejs.org)
3. **pnpm** - Install globally via npm:
```bash
   npm install -g pnpm
```
4. **Docker Desktop** - Download from [docker.com/products/docker-desktop](https://docker.com/products/docker-desktop)

### 2. Enable WSL 2 (Windows Users Only)

Docker requires WSL 2 to run on Windows Home and Pro editions.

1. Open PowerShell as Administrator
2. Run the following command:
```bash
   wsl --install
```
3. Restart your computer when the installation completes

### 3. Configure Docker Desktop

1. Open Docker Desktop
2. Navigate to **Settings → General**
3. Enable the option: **Start Docker Desktop when you log in**

## 💻 Local Development

Follow these steps each time you want to work on the project.

### 1. Clone the Repository
```bash
git clone https://github.com/AsimRoyChowdhury/cuk-database-project.git
cd university-project
```

### 2. Install Dependencies

Install all required packages for the entire monorepo:
```bash
pnpm install
```

### 3. Setup Environment Variables

1. Navigate to the `packages/database` folder
2. Copy the `.env.example` file from the root directory
3. Rename the copied file to `.env`

### 4. Start the Database

Start the PostgreSQL database container:
```bash
docker-compose up -d
```

> **Note**: You only need to run this command once after restarting your computer. The container will continue running if you put your computer to sleep.

### 5. Run the Development Server

Start both the backend API and frontend application simultaneously:
```bash
pnpm dev
```

The project will be available at:

- **Frontend**: [http://localhost:3000](http://localhost:3000)
- **Backend**: [http://localhost:8000](http://localhost:8000)

## 🛠️ Database Commands

Run these commands from the root project directory (`/university-project`).

### Open Prisma Studio

View and edit your database with a visual interface:
```bash
pnpm db:studio
```

### Create a Migration

When you need to modify the database schema:

1. Edit the schema file: `packages/database/prisma/schema.prisma`
2. Generate and apply the migration:
```bash
   pnpm db:migrate
```
3. Provide a descriptive name for your migration when prompted

## 📦 Tech Stack

- **Frontend**: Next.js, TanStack Table, Shadcn/ui
- **Backend**: Hono, Lucia Auth, Zod
- **Database**: PostgreSQL, Prisma
- **Package Manager**: pnpm
- **Containerization**: Docker