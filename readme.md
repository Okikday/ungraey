# Ungraey — Don't Trash It, Cash It.

## Inspiration

Every week, millions of people throw away perfectly useful materials such as moving boxes, glass jars, scrap wood, leftover denim, old copper wire e.t.c., not because they want to, but because the trash can is the only zero-friction option. At the same time, a ceramics artist two streets away is driving to a big-box store to buy the exact glass jars that just hit the dumpster.

The gap isn't supply. It isn't demand. It's **discovery and friction.**

We kept coming back to a simple observation: recycling is passive and broken. The bin sits there, the truck comes, the material gets mixed and degraded and often still ends up in landfill. But what if we could make *diversion* the default as fast and frictionless as throwing something away? That question became Ungraey.

---

## What It Does

Ungraey is a cross-platform mobile marketplace that treats everyday household waste as a **localized commodity**, matching supply with demand before anything touches a landfill.

**The Bounty (Demand):** A ceramics artist, moving company, or fashion student posts a geo-tagged, time-limited request for a specific material with a cash price, a trade offer, or both.

> *"Need 50 clean glass jars. $0.10 each or trade a handmade mug."*
> *"Infinite intact cardboard boxes ongoing. $0.05/box."*

**The Snap (Supply):** A user declutters their space, snaps a photo in the app, and our on-device AI classifier instantly identifies the material, estimates what the lot could earn from a local market price guide, and surfaces the nearest active Bounties that match. Entire flow: under 10 seconds. No camera-weighed gimmicks — vision identifies, the price guide values, and buyer and seller agree the final price at handoff.

**The Handoff (Settlement):** Once a match is accepted, Ungraey generates a cryptographic single-use QR token shared between both parties. The buyer scans it on pickup to confirm the exchange, triggering real-time eco-impact accounting for both sides: CO₂ diverted, landfill weight saved, and a running community leaderboard.

---

## Try the Demo (60 Seconds)

No login, no backend, no setup. The app ships with realistic seeded data and works fully offline:

1. **Home** — see live bounties, the Eco-Dial, community totals, and the neighborhood leaderboard.
2. **Snap (camera tab)** — tap the shutter. AI identifies the material, shows an estimated market value (e.g. $5–$8), and surfaces matching local buyers.
3. **Bounties** — open a bounty, tap "Generate Handoff QR Code" to create the cryptographic single-use token.
4. **Profile** — check the wallet, diversion stats, and leaderboard position.

Grab the latest APK from [GitHub Releases](../../releases) (`ungraey-arm64-v8a-release.apk` fits most modern phones) or run `flutter run` from `ungraey_flutter/` with the Serverpod backend via `serverpod start`.

---

## How We Built It

| Layer | Technology |
|---|---|
| Mobile (iOS & Android) | Flutter |
| State Management | Riverpod (Pod architecture with Equatable) |
| Backend / API | Serverpod 4.0 + PostgreSQL |
| Real-time Feeds | Serverpod streaming WebSockets (`nearby_bounties`, `nearby_snaps`) |
| AI Snap Classifier | On-device material recognition via camera |
| Auth | Serverpod built-in authentication |
| QR Settlement | Cryptographic single-use handoff tokens |

The UI is built on an internal **Aura Design System**, a non-linear 10-stop backdrop dissolve mask, spring-physics PageView navigation, a floating dock with an animated highlight pill, and frosted context menus. Every widget file is strictly under 200 lines with zero inlined build helpers.

The app is **offline-first by design**: every critical flow degrades gracefully to pre-seeded realistic mock data, ensuring a zero-flicker, fully interactive experience even when the backend is unreachable.

---

## Challenges We Ran Into

- **Matching latency vs. hyperlocality.** Getting Bounty feeds to feel instant while filtering by geolocation, material type, and grade simultaneously required careful query design and a streaming architecture over WebSockets rather than polling.
- **On-device AI accuracy.** Training the snap classifier to reliably distinguish, say, clean corrugated cardboard from dirty cardboard (which has no resale value) in varied lighting and angles took significant iteration.
- **Two-sided trust.** Building the handoff QR flow so neither party can fake a completed exchange without requiring a centralized escrow or third-party payment system was the hardest design constraint we solved.
- **Offline resilience.** Ensuring that every screen in the app remained fully functional and visually consistent with live data required building a complete parallel layer of seeded mock data that mirrors production data structures exactly.

---

## Accomplishments That We're Proud Of

- A **sub-10-second snap-to-match flow** that genuinely feels like magic the first time you use it.
- A fully functional **cryptographic QR handoff** with dual-party eco-impact accounting that neither party can falsify.
- The **Aura Design System** — a cohesive, tactile visual language that makes the app feel premium and trustworthy rather than another green-washed startup aesthetic.
- **Zero static analysis issues** across Flutter, server, and client packages at submission time.
- A comprehensive **widget and unit test suite** (10/10 passing) covering classifier logic, Riverpod pod state, and core UI flows.
- Shipping a fully offline-capable prototype that demonstrates the complete user journey end-to-end with no backend dependency.

---

## What We Learned

- **Friction is the environmental problem.** Users' values are often already aligned, they don't want to waste things. The only thing standing between intention and action is a single extra step. Removing that step changes behavior faster than any campaign.
- **Hyperlocality is underserved.** Most marketplace platforms optimize for reach. Ungraey taught us that for physical waste exchange, a 2km radius and a 48-hour window is actually the sweet spot. it changes the logistics from shipping to walking.
- **Design is not decoration.** Making the app feel fast, premium, and trustworthy wasn't cosmetic. In a two-sided marketplace, neither side will post first if the app feels flimsy. The Aura Design System was a product decision as much as a visual one.
- **Serverpod's streaming primitives** made real-time Bounty feeds dramatically simpler than we expected the architecture almost fell out naturally once we committed to WebSocket streams over REST polling.

---

## What's Next for Ungraey

- **AI grading expansion** — moving beyond material type identification to automated condition grading, fair-value pricing suggestions, and fraud detection on submitted snaps.
- **Community Bounty Pools** — letting neighborhoods collectively fund standing Bounties (e.g., a community garden that always needs compost-grade food scraps).
- **Impact Verification & Carbon Credits** — partnering with environmental auditors to convert verified diversion data into tradeable carbon offset credits, creating a new revenue stream that funds the platform without ads.
- **B2B tier for small businesses** — construction companies, coffee shops, and restaurants generate high-volume, predictable waste streams. A lightweight API and dashboard for businesses to post recurring Bounties automatically.
- **City-level partnerships** — working with municipalities to redirect materials that currently go to overloaded recycling centers into the Ungraey local marketplace first.