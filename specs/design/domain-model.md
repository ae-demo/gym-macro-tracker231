# Domain Model

The core entities behind macro and workout tracking, coach oversight and
feedback.

```mermaid
erDiagram
    USER ||--o{ MACRO_TARGET : sets
    USER ||--o{ FOOD_LOG_ENTRY : logs
    USER ||--o{ WORKOUT_LOG : logs
    WORKOUT_LOG ||--o{ EXERCISE_ENTRY : contains
    USER ||--o{ COACH_INVITE : creates
    USER ||--o{ COACH_LINK : "is trainee in"
    USER ||--o{ COACH_LINK : "is coach in"
    COACH_LINK ||--o{ FEEDBACK : carries

    USER {
        string id PK
        string thunderSub
        string role
        string name
        string email
    }
    MACRO_TARGET {
        string id PK
        string traineeId FK
        int calories
        int proteinGrams
        int carbsGrams
        int fatGrams
        date effectiveFrom
    }
    FOOD_LOG_ENTRY {
        string id PK
        string traineeId FK
        datetime loggedAt
        string foodName
        int calories
        int proteinGrams
        int carbsGrams
        int fatGrams
    }
    WORKOUT_LOG {
        string id PK
        string traineeId FK
        datetime loggedAt
        string notes
    }
    EXERCISE_ENTRY {
        string id PK
        string workoutLogId FK
        string exerciseName
        int sets
        int reps
        float weightKg
        int durationMinutes
    }
    COACH_INVITE {
        string id PK
        string traineeId FK
        string code
        string status
        datetime createdAt
    }
    COACH_LINK {
        string id PK
        string traineeId FK
        string coachId FK
        datetime linkedAt
        datetime revokedAt
    }
    FEEDBACK {
        string id PK
        string coachLinkId FK
        string authorId FK
        string message
        datetime createdAt
    }
```

`USER` is a Trainee or a Coach, distinguished by `role`, both provisioned
through Thunder sign-in. A `COACH_LINK` is created when a Trainee's
`COACH_INVITE` is accepted, and carries the `FEEDBACK` a Coach leaves for that
Trainee. `MACRO_TARGET`, `FOOD_LOG_ENTRY` and `WORKOUT_LOG` (with its
`EXERCISE_ENTRY` children) all belong to the Trainee who logged them.