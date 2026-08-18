# Adoption Assessment — Fictional Orchard Ledger

- Assessment status: Readiness work required
- Protocol version: 0.1.0-draft
- Evidence boundary: fictional, sanitized example; production not accessed

## Evidence and findings

Repository evidence shows a maintenance command capable of destructive writes.
The owner states that it may target production, but the target identity,
production owner, backup, restore test, and action authority are not evidenced.

- **BA-001 — Blocker — Open.** Production target and owner are unverified.
  Completion test: authoritative target identity and accountable owner are
  documented.
- **BA-002 — Blocker — Open.** No verified backup and recovery path exists.
  Completion test: the owner records a current backup, protected storage,
  restoration procedure, and verification appropriate to the system.
- **BA-003 — Readiness requirement — Open.** No explicit authority exists for
  the proposed production action. Completion test: action-specific approval and
  rollback/verification plan are recorded after BA-001 and BA-002 resolve.

## Stop

No command was run, no secret was collected, and no production mutation or
deployment was attempted. Discovery may continue read-only, but risky work stops
until recovery, ownership, and explicit authority are established.

