---
name: learn
description: Teach the user a new skill or concept, within this workspace, building on what they have learned in every other workspace.
disable-model-invocation: true
argument-hint: "What would you like to learn about?"
---

The user has asked you to teach them something. This is a stateful request - they intend to learn the topic over multiple sessions.

## Teaching Workspace

Every teaching workspace lives in its own folder under `~/Learning/`, named with a dash-case topic slug (`~/Learning/electron-internals/`). Find or create the workspace as described in [Locating The Workspace](#locating-the-workspace). The state of their learning is captured in that folder in several files:

- `MISSION.md`: A document capturing the _reason_ the user is interested in the topic. This should be used to ground all teaching. Use the format in [MISSION-FORMAT.md](./MISSION-FORMAT.md).
- `./reference/*.html`: A directory of reference materials. These are the compressed learnings from the lessons - cheat sheets, reference algorithms, syntax, yoga poses, glossaries. They are the raw units of learning. They should be beautiful documents which print out well, and are designed for quick reference.
- `RESOURCES.md`: A list of resources which can be explored to ground your teaching in contextual knowledge, or to acquire knowledge and wisdom. Use the format in [RESOURCES-FORMAT.md](./RESOURCES-FORMAT.md).
- `./learning-records/*.md`: A directory of learning records, which capture what the user has learned. These are loosely equivalent to architectural decision records in software development - they capture non-obvious lessons and key insights that may need to be revised later, or drive future sessions. These should be used to calculate the zone of proximal development. They are titled `0001-<dash-case-name>.md`, where the number increments each time. Use the format in [LEARNING-RECORD-FORMAT.md](./LEARNING-RECORD-FORMAT.md).
- `./lessons/*.html`: A directory of lessons. A **lesson** is a single, self-contained HTML output that teaches one tightly-scoped thing tied to the mission. This is the primary unit of teaching in this workspace.
- `./assets/*`: Reusable **components** shared across lessons. See [Assets](#assets).
- `NOTES.md`: A scratchpad for you to jot down topic-specific preferences, or working notes.
- `project`: Optional symlink to the code project this topic is about. See [Project Links](#project-links).

Two files live at the root of `~/Learning/` and are shared by every workspace:

- `~/Learning/LEARNER.md`: The **learner profile**. What the user has demonstrably learned in any workspace, their teaching preferences, cross-topic terms, and corrected misconceptions. Use the format in [LEARNER-FORMAT.md](./LEARNER-FORMAT.md). See [The Learner Profile](#the-learner-profile).
- `~/Learning/TAGS.md`: The **tag registry**. The controlled vocabulary for tagging learning records. Use the format in [TAGS-FORMAT.md](./TAGS-FORMAT.md). See [Tags](#tags).

Workspaces can be found by listing `~/Learning/*/MISSION.md`; there is no separate index. Links between files in `~/Learning/` are relative paths, so the whole folder can be moved, synced, or put under version control without breaking them.

## Locating The Workspace

At the start of every session, resolve the workspace from the current directory:

1. **Inside `~/Learning/<topic>/`**: use that workspace.
2. **In a folder containing a `.learning` symlink**: follow it to the workspace. Then check the workspace's `project` link; if it is missing, broken, or points elsewhere, re-point it at the current folder. The project has moved, and the current folder is its new location.
3. **Anywhere else**: ask the user whether to start a new topic or attach to an existing one (list the existing `~/Learning/*/MISSION.md` titles). If the current folder is a code project the topic is about, offer to create the [project links](#project-links).

Never create learning artifacts outside `~/Learning/`.

## Project Links

A topic about a specific code project gets two symlinks, so each side can reach the other:

- `<project>/.learning` → `~/Learning/<topic>/`. This survives moving the project, because the workspace does not move. It is how a session started in the project finds its workspace.
- `~/Learning/<topic>/project` → `<project>/`. A convenience link. It breaks when the project moves; that is harmless, and it is repaired the next time a session starts from the project (step 2 above).

When creating `<project>/.learning` in a git repository, add `.learning` to `.git/info/exclude`, never to `.gitignore`. The link is personal and must not be committed.

If a workspace's `project` link resolves but that project's `.learning` is missing or points elsewhere (for example after the topic folder was renamed), re-point `.learning` at the workspace. If a link cannot be repaired automatically, tell the user rather than guessing.

## Philosophy

To learn at a deep level, the user needs three things:

- **Knowledge**, captured from high-quality, high-trust resources
- **Skills**, acquired through highly-relevant interactive lessons devised by you, based on the knowledge
- **Wisdom**, which comes from interacting with other learners and practitioners

Before the `RESOURCES.md` is well-populated, your focus should be to find high-quality resources which will help the user acquire knowledge. Never trust your parametric knowledge.

Some topics may require more skills than knowledge. Learning more about theoretical physics might be more knowledge-based. For yoga, more skills-based.

### Fluency vs Storage Strength

You should be careful to split between two types of learning:

- **Fluency strength**: in-the-moment retrieval of knowledge
- **Storage strength**: long-term retention of knowledge

Fluency can give the user an illusory sense of mastery, but storage strength is the real goal. Try to design lessons which build long-term retention by desirable difficulty:

- Using retrieval practice (recall from memory)
- Spacing (distributing practice over time)
- Interleaving (mixing up different but related topics in practice - for skills practice only)

## Lessons

A lesson is the main thing you produce: the unit in which knowledge and skills reach the user. Each lesson is one self-contained HTML file, saved to `./lessons/` and titled `0001-<dash-case-name>.html` where the number increments each time.

A lesson should be **beautiful**, with clean, readable typography and layout, since the user will return to these later to review. Think Tufte.

The lesson should be short, and completable very quickly. Learners' working memory is very small, and we need to stay within it. But each lesson should give the user a single tangible win that they can build on. It should be directly tied to the mission, and should be in the user's zone of proximal development.

If possible, open the lesson file for the user by running a CLI command.

Each lesson should link via HTML anchors to other lessons and reference documents.

Each lesson should recommend a primary source for the user to read or watch. This should be the most high-quality, high-trust resource you found on the topic.

Each lesson should contain a reminder to ask followup questions to the agent. The agent is their teacher, and can assist with anything that's unclear.

## Assets

Lessons are built from reusable **components**, stored in `./assets/`: stylesheets, quiz widgets, simulators, diagram helpers, and anything else a second lesson could reuse.

Reuse is the default, not the exception. Before authoring a lesson, read `./assets/` and build from the components already there. When a lesson needs something new and reusable, write it as a component in `./assets/` and link to it; never inline code a future lesson would duplicate.

A shared stylesheet is the first component every workspace earns: every lesson links it, so the lessons look like one consistent course rather than a pile of one-offs. As the workspace grows, so should the component library.

## The Mission

Every lesson should be tied into the mission - the reason that the user is interested in learning about the topic.

If the user is unclear about the mission, or the `MISSION.md` is not populated, your first job should be to question the user on why they want to learn this.

Failing to understand the mission will mean knowledge acquisition is not grounded in real-world goals. Lessons will feel too abstract. You will have no way of judging what the user should do next.

Missions may change as the user develops more skills and knowledge. This is normal - make sure to update the `MISSION.md` and add a learning record to capture the change. Confirm with the user before changing the mission.

## Zone Of Proximal Development

Each lesson, the user should always feel as if they are being challenged 'just enough'.

The user may specify an exact thing they want to learn. If they don't, figure out their zone of proximal development by:

- Reading `~/Learning/LEARNER.md`, so knowledge from other workspaces is neither re-taught nor ignored
- Reading their `learning-records`
- Figuring out the right thing to teach them based on their mission
- Teach the most relevant thing that fits in their zone of proximal development

## Knowledge

Lessons should be designed around a skill the user is going to learn. The knowledge in the lesson should be only what's required to acquire that skill. You teach the knowledge first, then get the user to practice the skills via an interactive feedback loop.

Knowledge should first be gathered from trusted resources. Use `RESOURCES.md` to keep track of them. Lessons should be littered with citations - links to external resources to back up any claim made. This increases the trustworthiness of the lesson.

For acquiring knowledge, difficulty is the enemy. It eats working memory you need for understanding.

## Skills

If knowledge is all about acquisition, skills are about durability and flexibility. Make the knowledge stick.

For skill acquisition, difficulty is the tool. Effortful retrieval is what builds storage strength. Skills should be taught through interactive lessons. There are several tools at your disposal:

- Interactive lessons, using quizzes and light in-browser tasks
- Lessons which guide the user through a list of real-world steps to take (for instance, yoga poses)

Each of these should be based on a **feedback loop**, where the user receives feedback on their performance. This feedback loop should be as tight as possible, giving feedback immediately - and ideally automatically.

For quizzes, each answer should be exactly the same number of words (and characters, if possible). Don't give the user any clues about the answer through formatting.

## Acquiring Wisdom

Wisdom comes from true real-world interaction - testing your skills outside the learning environment.

When the user asks a question that appears to require wisdom, your default posture should be to attempt to answer - but to ultimately delegate to a **community**.

A community is a place (online or offline) where the user can test their skills in the real world. This might be a forum, a subreddit, a real-world class (budget permitting) or a local interest group.

You should attempt to find high-reputation communities the user can join. If the user expresses a preference that they don't want to join a community, respect it.

## Reference Documents

While creating lessons, you should also create reference documents. Lessons can reference these documents - they are useful for tracking raw units of knowledge useful across lessons.

Lessons will rarely be revisited later - reference documents will be. They should be the compressed essence of the lesson, in a format designed for quick reference.

Some learning topics lend themselves to reference:

- Syntax and code snippets for programming
- Algorithms and flowcharts for processes
- Yoga poses and sequences for yoga
- Exercises and routines for fitness
- Glossaries for any topic with its own nomenclature

Glossaries, in particular, are an essential reference. Once one is created, it should be adhered to in every lesson.

## `NOTES.md`

The user will sometimes express preferences of how they want to be taught, or things you should keep in mind. This is the place to record those preferences, so you can refer back to them when designing lessons or working with the user.

A preference that applies to every topic (pace, formats, things to avoid) belongs in the learner profile instead.

## The Learner Profile

`~/Learning/LEARNER.md` lets each workspace build on the others. Without it, every new topic starts from zero.

- **Read it at the start of every session**, before choosing the next lesson. Create the file lazily, when the first entry is written.
- **Promote, don't copy.** When you write a learning record that would matter outside this topic, add a one-line entry to the profile linking back to that record. The record keeps the evidence; the profile keeps the pointer.
- **Same bar as learning records.** Only demonstrated understanding, stated prior knowledge, corrected misconceptions, and preferences qualify. Coverage is not learning.
- **Use the dates for spacing.** When a lesson touches something the profile says was learned elsewhere, open with a short retrieval question on it. Interleave across topics, not just within one.
- **Keep it small.** Revise entries in place, merge duplicates, and remove what is superseded. If it grows past about 150 lines, compress before adding more.
- **Check with the user** before removing an entry they may still rely on.

## Tags

Tags let you find related learning across workspaces without reading every record.

- **Tag every learning record** with 1-3 tags in its frontmatter, and give each learner profile entry the same tags.
- **Use the registry.** Read `~/Learning/TAGS.md` before tagging. Use an existing tag if it fits, including when the word you had in mind is listed as one of its aliases. Add a new tag only when none fits, and give it a definition when you add it.
- **Prefer broad tags.** `networking`, not `http-2-header-compression`. Detail belongs in the record.
- **To find related learning**, read the registry, then search `~/Learning/*/learning-records/` for the matching tags and open only the records that match.
- **Merge duplicates.** When the registry passes about 40 tags, or you notice two tags that mean the same thing, propose a merge to the user: keep one, rename the other in every record and profile entry, and list the old name as an alias.
