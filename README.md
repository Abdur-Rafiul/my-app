# hoopnetic.cloud Application

This requires [Docker](https://www.docker.com/) and [Docker Compose](https://docs.docker.com/compose/) to run.

## Getting Started

### Run with Docker

To build and start the application and Nginx:

```bash
docker compose up -d --build
```

The application will be available at:
- `http://hoopnetic.cloud` (via Nginx)
- `http://localhost` (local testing)

### Run locally (Development)

```bash
npm install
npm run dev
```

Open [http://localhost:3000](http://localhost:3000) with your browser.
