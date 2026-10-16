[README.md](https://github.com/user-attachments/files/33566453/README.md)
# Sparq Labs Website

A single-page website built with HTML, CSS, and JavaScript.

## Project structure

```text
website/
├── index.html
├── Dockerfile
├── nginx.conf.template
├── .dockerignore
├── render.yaml
├── README.md
└── README-RENDER.md
```

## Deploy to Render

This repository includes a Docker-based deployment configuration for Render.

### Option A: Render Blueprint

1. Push the project files to GitHub.
2. Open the [Render Dashboard](https://dashboard.render.com/).
3. Choose **New → Blueprint**.
4. Select the GitHub repository containing this project.
5. Render reads `render.yaml` and configures the service.
6. Wait for the deployment to finish and open the public URL shown in Render.

### Option B: Create a Docker Web Service

1. In the Render Dashboard, choose **New → Web Service**.
2. Connect the GitHub repository.
3. Select **Docker** as the runtime.
4. Set the Dockerfile path to `./Dockerfile`.
5. Deploy the service.

The NGINX server listens on Render's `PORT` environment variable. The `/health` endpoint returns `ok` for health checks.

## Local Docker test

If Docker is installed, run these commands from the repository root:

```bash
docker build -t sparq-labs-website .
docker run --rm -p 10000:10000 -e PORT=10000 sparq-labs-website
```

Then open http://localhost:10000 in your browser. Test the health endpoint at http://localhost:10000/health.

## Notes

- Keep `index.html` and the deployment files in the same repository root unless you update the Dockerfile and Render configuration.
- This is a static single-page website; a Render Static Site can also host it without Docker.
- Fonts, animation libraries, and embedded video may load from third-party services, so those services must remain reachable for the related features to work.
- Do not commit `.env` files, API keys, passwords, or other secrets.
- If a secret was previously committed to Git, revoke or rotate it; deleting it from the latest version is not sufficient.

For detailed deployment notes, see [README-RENDER.md](README-RENDER.md).
