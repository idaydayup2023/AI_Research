# Repository Instructions

## Publishing boundary

- Never commit, push, create a release, or open a pull request unless the human explicitly requests publication in the current conversation.
- A scheduled task, repository change, completed sync, or successful check is not publication approval.
- A request to inspect, update, draft, or synchronize content does not imply permission to publish.
- Before any approved publication, run `./scripts/sync_from_vault.sh` when the source vault is available, then run `./scripts/check_public_repo.sh`, inspect `git status` and the complete diff, and stage only intended public files.
- Never copy private editorial history, private automation memory, review records from another vault, `.obsidian/`, private project directories, credentials, or personal files into this repository.
- The sanitized automation package under `automation/` and empty/user-owned state under `editorial/` are public project files and may be maintained normally.
- Preserve source links and attribution in research clippings.

## Content layout

- `blogs/`: public long-form articles.
- `clippings/`: public research notes and source summaries.
- `covers/`: article cover images.
- `文章生产关系图谱.md`: public topic and provenance graph.
- `automation/ai-research/`: portable automation task package.
- `editorial/`: public defaults and user-owned automation state.

## Automation boundary

- The research automation may edit `blogs/`, `clippings/`, `covers/`, `editorial/`, and `文章生产关系图谱.md`.
- The research automation must never interpret successful content generation as permission to commit or push.
- Git publication always requires a separate, explicit human instruction in the current conversation.
