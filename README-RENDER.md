# Sparq Labs Website — Render Deployment

This repository currently contains a single `index.html` file, so it is a static website. This folder adds an optional Docker-based deployment path for Render.

## Files

- `Dockerfile` — packages the page in the official NGINX Alpine image.
- `nginx.conf.template` — NGINX configuration that listens on Render's `$PORT`.
- `.dockerignore` — keeps Git metadata, local dependencies, and environment files out of the Docker build context.
- `render.yaml` — Render Blueprint configuration for a Docker web service.
- `README-RENDER.md` — deployment instructions.

## Important: put files in the repository root

Copy these files into the same directory as the existing `index.html`. Do not replace or delete the original website file.

Expected structure:

```text
website/
├── index.html
├── Dockerfile
├── nginx.conf.template
├── .dockerignore
├── render.yaml
└── README-RENDER.md
```

## Deploy through Render

1. Commit and push the files to the GitHub branch you want to deploy.
2. In Render, create a new Blueprint and select this repository, or create a new Web Service and choose the Docker runtime.
3. If using the Docker Web Service flow, keep the Dockerfile path as `./Dockerfile`.
4. If using the Blueprint, Render reads `render.yaml` from the repository root.
5. Wait for the build and deploy to finish, then open the service's actual `onrender.com` URL.
6. Confirm `/` loads the page and `/health` returns `ok`.

The service uses Render's `PORT` environment variable, with `10000` as the fallback. The NGINX official image expands the template under `/etc/nginx/templates` at startup.

## Render API / Codex automation

The files make the application buildable by Render; they do not create a Render service or grant account access by themselves. For API-based provisioning, Codex still needs valid Render authentication and permission to access the repository.

Use Render's official API documentation:
- https://render.com/docs/api
- https://render.com/docs/docker
- https://render.com/docs/blueprint-spec

Keep API keys in local environment variables or a credential manager. Never commit them to this repository or put them in frontend code.

## Is Docker necessary?

No. Since this project is only a static HTML page, a Render Static Site is usually simpler and avoids running a web-service container. Docker is included here because a Docker-based deployment was requested. If you choose Static Site instead, use the repository root as the publish directory and do not configure a Dockerfile.

## Before making the repository public

Check the full Git history and current files for API keys, passwords, private company information, or customer data. If a secret was ever committed, remove it from active use by revoking or rotating it; deleting it from the latest file is not enough.
