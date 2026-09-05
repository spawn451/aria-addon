# Aria — Home Assistant add-on

A full-body 3D talking avatar for your Home Assistant, powered by the Assist
pipeline you already have: your speech recognition, your language model, your
voice, your house. Runs as a single static binary with the web app embedded —
installing compiles nothing, even on a Raspberry Pi.

## Install

1. In Home Assistant open **Settings → Apps** (called *Add-ons* before
   HA 2026.2) **→ App Store**.
2. Menu **⋮ → Repositories**, paste this repository's URL, **Add**.
3. Refresh the page, find **Aria** under *Aria Add-ons*, click **Install**,
   then **Start**.

## Open it

Aria supports **Ingress**: it appears in the Home Assistant sidebar and opens
inside HA's own HTTPS page — no port, no certificate warning, nothing to
configure. Hide or show the sidebar entry with the standard *Show in sidebar*
toggle on the app's page.

On first open the setup wizard asks for:

- **Home Assistant address** — `http://homeassistant:8123` works from inside
  any add-on; your LAN address (`http://192.168.x.x:8123`) works too.
- **A long-lived access token** — in HA click your name (bottom left) →
  **Security** tab → **Long-lived access tokens** → create one and paste the
  whole string. It is stored on the server, never in the browser.

Drop your own avatar or environment `.glb` files in through the app's
settings panel; they persist in the add-on's `/data` across updates.

## Direct access (optional)

Besides Ingress, the add-on also listens on two host ports:

| Port | What |
|---|---|
| `8420` | HTTP — typing works, the microphone does not (browser rule) |
| `8421` | HTTPS — microphone works after accepting the certificate warning |

The `ssl` option only affects port 8421: set it to `true` with `certfile` /
`keyfile` to use a real certificate from HA's `/ssl` folder instead of the
self-signed one. Behind your own reverse proxy, point it at port 8420 with
`X-Forwarded-Proto: https` and a WebSocket timeout of at least 600 s.

## Architectures

`amd64` (Intel/AMD), `aarch64` (Raspberry Pi 4/5 and most boards), `armv7`
(older 32-bit installs).
