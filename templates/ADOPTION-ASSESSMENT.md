# Adoption Assessment — [Project]

> Canonical artifact: `ADOPTION-ASSESSMENT.md`. Remove instructional
> placeholders before marking the assessment `Ready for Banka` or `Handed off`.

## 0. Document control

- Assessment date:
- Assessor:
- Existing project owner:
- Repository and path:
- Branch and commit/revision:
- Environments in scope: local / preview or staging / production / other
- Assessment status: Discovery in progress / Scope clarification required /
  Readiness work required / Ready for Banka / Handed off / Stopped by owner
- Protocol version: 0.1.0-draft
- Assessment revision and supersedes:

## 1. Purpose and authorized scope

- Project purpose and intended outcome:
- Assessment boundary:
- Authorized actions:
- Prohibited actions:
- Decision owners and external system owners:
- Sensitive-data and privacy boundary:

## 2. Evidence inventory

| Evidence ID | Source and location | Date checked | Authority: Observed / User-supplied / Assumption | Confidence and limits |
| --- | --- | --- | --- | --- |
| EV-001 |  |  |  |  |

Record names and locations of credentials, never values. Redact private content
from any public copy.

## 3. Project reality

### Architecture and source layout

### Dependencies and supported runtimes

### Commands and observed results

### Tests and verification paths

### Automation, deployment configuration, and instruction files

### Version-control state and authoritative branch

## 4. Environment reality

| Environment | What was observed | Evidence | Owner | Access/authority limits | Unknowns |
| --- | --- | --- | --- | --- | --- |
| Local |  |  |  |  |  |
| Preview/staging |  |  |  |  |  |
| Production |  |  |  |  |  |

Never use local success as proof of production state.

## 5. Documentation versus observed behavior

| Claim | Observed reality | Evidence | Consequence | Finding ID |
| --- | --- | --- | --- | --- |
|  |  |  |  | BA-001 |

## 6. Findings

Use one classification: Blocker, Readiness requirement, Stabilization backlog,
or Observation. Use one state: Open, In progress, Resolved, Superseded, or
Accepted for later. `Accepted for later` applies only to stabilization backlog.

| ID | Classification | State | Finding and impact | Evidence | Proposed owner | Completion test | Resolution/supersession record |
| --- | --- | --- | --- | --- | --- | --- | --- |
| BA-001 |  | Open |  |  |  |  |  |

Retain resolved entries with evidence, verifier, and date. Retain superseded
entries with a reason and replacing finding ID. Never reuse or renumber IDs.

## 7. Scope clarity

- Scope is sufficiently clear: yes / no
- Accepted scope source, filename, and owner:
- Evidence for the decision:
- Open scope questions and consequence:
- Optional clarification route chosen, if any:

No filename or ASMP provenance is required. If scope is materially unclear,
pause readiness work.

## 8. Minimal readiness actions

| Finding ID | Authorized action | Authorized by/date | Change made | Verification | Rollback or reversibility |
| --- | --- | --- | --- | --- | --- |
|  |  |  |  |  |  |

Include only work required for safe, truthful handoff.

## 9. Stabilization backlog

| Finding ID | Item | Priority | Proposed owner | Trigger or next step | Why it does not block handoff |
| --- | --- | --- | --- | --- | --- |
|  |  |  |  |  |  |

## 10. Recovery, security, and production safety

- Secret and private-data handling:
- Backup status, evidence, owner, and limits:
- Restore/rollback path and verification:
- Production owner and explicit authority status:
- Proposed production action, if separately authorized:
- Post-change verification and stop conditions:

Do not include secret values. This assessment does not authorize production
mutation or deployment.

## 11. Readiness decision

- Status:
- Supporting finding IDs and evidence:
- Unresolved blockers or readiness requirements:
- Explicitly unverified claims:
- Decision owner and date:
- Why this status is truthful and safe:

`Ready for Banka` does not mean Banka adoption is complete.

## 12. Handoff package and unresolved dependencies

- This assessment:
- Accepted scope source:
- Verified commands and environment facts:
- Stabilization backlog and owners:
- Explicit exclusions and prohibited actions:
- Unresolved external dependencies and owners:
- Receiving workflow and current authoritative link:
- Next action and owner:
- Stop acknowledgement:

