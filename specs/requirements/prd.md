# gym-macro-tracker231 — PRD

## Problem Statement

Gym-goers who want to hit a physique or performance goal need to track two
things at once — what they eat (calories and macros: protein, carbs, fat) and
what they do in the gym (workouts) — and today that usually means juggling two
separate apps, or a spreadsheet, with no single place to see both against a
personal target. People working with a coach have it worse: the coach has no
visibility into a trainee's day-to-day logging unless the trainee manually
shares screenshots or exports, which is slow and easy to skip.

## Solution

A gym macro tracker where an individual (a Trainee) logs their meals and
workouts in one place, sets their own daily macro and calorie targets, and
sees their progress against those targets at a glance. A Trainee can link with
a Coach, who gets read access to that Trainee's logs and progress and can
leave feedback — giving coached trainees oversight without manual exports.

## Actors

- **Trainee** — an individual gym-goer who signs in, sets their own daily
macro/calorie targets, logs meals and workouts, and views their own progress.
Optionally links to a Coach.
- **Coach** — oversees one or more linked Trainees: views their logged meals,
workouts and progress against targets, and leaves feedback. Never sets a
Trainee's targets or edits their logs.

## User Stories

1. As a Trainee, I want to sign in securely, so that my nutrition and workout
data is private to me.
2. As a Trainee, I want to set my daily calorie and macro (protein, carbs, fat)
targets, so that I have a personal goal to track against.
3. As a Trainee, I want to change my targets whenever my goal changes, so that
my tracking stays relevant.
4. As a Trainee, I want to log a food I ate with its macros, so that my daily
totals stay accurate.
5. As a Trainee, I want to search a nutrition database while logging a food, so
that I don't have to look up or type in macros for common foods myself.
6. As a Trainee, I want to log a workout — the exercises I did, with sets,
reps and weight (or duration for cardio) — so that my training is tracked
alongside my nutrition.
7. As a Trainee, I want to see a daily summary of my macros logged so far
against my targets, so that I know how much room I have left today.
8. As a Trainee, I want to see a weekly view of my nutrition and workout
history, so that I can spot trends over time.
9. As a Trainee, I want to invite a Coach to oversee my progress, so that they
can see my logs without me exporting anything.
10. As a Trainee, I want to revoke a Coach's access, so that I control who can
see my data.
11. As a Coach, I want to accept a Trainee's invite, so that I start overseeing
them.
12. As a Coach, I want to see a list of the Trainees I oversee, so that I can
choose whose progress to review.
13. As a Coach, I want to view a linked Trainee's logged meals, workouts, and
progress against their targets, so that I can assess how they're doing.
14. As a Coach, I want to leave feedback on a Trainee's day or log entry, so
that I can guide them.
15. As a Trainee, I want to see feedback my Coach has left, so that I can act
on it.

## Product Decisions

- **Sign-in**: every user (Trainee or Coach) signs in via SSO through Thunder,
the platform identity provider.
- **Nutrition lookup**: food search and macro data during logging is backed by
the organization's registered nutrition-service (a food-data lookup used for
recipes and logged foods), rather than a hand-rolled food database.
- **Targets are self-set**: a Trainee always enters their own daily
calorie/macro targets directly; the product does not calculate targets from
body-profile data.
- **Coach linking is invite-based**: a Trainee generates an invite that a
Coach accepts to become linked; there is no open marketplace of coaches to
browse.
- **Workout logging shape**: a workout is a set of exercises, each with either
sets/reps/weight (strength) or a duration (cardio) — no exercise-library
browsing or video guidance in this product.
- **No coach-initiated notifications in this version** *assumed*: a Trainee
checks their own app for Coach feedback; there is no push/email alert when
feedback is left.

## Out of Scope

- Barcode scanning of food packaging.
- Recipe builder / meal planning ahead of time.
- Social features (feeds, following other Trainees, leaderboards).
- Payments or billing for coaching relationships.
- Body-metric tracking (weight, photos, measurements) beyond what's needed to
show macro/workout progress.
- Calculating suggested targets from a Trainee's body profile.

## Open Questions

*(none — all decisions the walk raised are either settled by an organization
default or are `*assumed*` judgments the user can revisit)*

## Further Notes

*(none)*

