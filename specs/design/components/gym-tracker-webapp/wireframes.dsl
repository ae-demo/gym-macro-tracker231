screen TraineeDashboard "Trainee's daily macro summary vs targets"
  navbar "Gym Macro Tracker"
  sidebar "Dashboard -> TraineeDashboard | Food Log -> FoodLog | Workouts -> WorkoutLog | History -> WeeklyHistory | Coach -> CoachLinkScreen | Feedback -> FeedbackInbox"
  heading "Today"
  row
    card "Calories | 1,450 / 2,200" 
    card "Protein | 92g / 160g"
    card "Carbs | 140g / 220g"
    card "Fat | 45g / 70g"
  progress "66%"
  row
    button "Log Food" primary -> LogFood
    button "Log Workout" -> LogWorkout
  card "Recent entries"
    table "Time | Item | Calories"
      row "12:30 PM | Chicken salad | 420"
      row "8:00 AM | Oatmeal | 310"

screen LogFood "Search the nutrition catalog and log a meal"
  navbar "Gym Macro Tracker"
  sidebar "Dashboard -> TraineeDashboard | Food Log -> FoodLog | Workouts -> WorkoutLog | History -> WeeklyHistory | Coach -> CoachLinkScreen | Feedback -> FeedbackInbox"
  heading "Log a Food"
  search "Search foods (e.g. chicken breast)"
  table "Food | Calories | Protein | Carbs | Fat"
    row "Chicken breast (100g) | 165 | 31g | 0g | 3.6g"
    row "Brown rice (1 cup) | 216 | 5g | 45g | 1.8g"
  card "Selected: Chicken breast"
    input "Quantity (servings)"
  row
    button "Cancel" -> TraineeDashboard
    right
    button "Save Entry" primary -> TraineeDashboard

screen FoodLog "The trainee's logged food entries"
  navbar "Gym Macro Tracker"
  sidebar "Dashboard -> TraineeDashboard | Food Log -> FoodLog | Workouts -> WorkoutLog | History -> WeeklyHistory | Coach -> CoachLinkScreen | Feedback -> FeedbackInbox"
  heading "Food Log"
  table "Time | Food | Calories | Protein | Carbs | Fat"
    row "12:30 PM | Chicken salad | 420 | 38g | 12g | 22g"
    row "8:00 AM | Oatmeal | 310 | 10g | 54g | 6g"
  button "Log Food" primary -> LogFood

screen LogWorkout "Log a workout's exercises"
  navbar "Gym Macro Tracker"
  sidebar "Dashboard -> TraineeDashboard | Food Log -> FoodLog | Workouts -> WorkoutLog | History -> WeeklyHistory | Coach -> CoachLinkScreen | Feedback -> FeedbackInbox"
  heading "Log a Workout"
  textarea "Notes (optional)"
  card "Exercise 1"
    row
      input "Exercise name"
      input "Sets"
      input "Reps"
      input "Weight (kg)"
  card "Exercise 2 (cardio)"
    row
      input "Exercise name"
      input "Duration (minutes)"
  button "Add exercise"
  row
    button "Cancel" -> TraineeDashboard
    right
    button "Save Workout" primary -> TraineeDashboard

screen WorkoutLog "The trainee's logged workouts"
  navbar "Gym Macro Tracker"
  sidebar "Dashboard -> TraineeDashboard | Food Log -> FoodLog | Workouts -> WorkoutLog | History -> WeeklyHistory | Coach -> CoachLinkScreen | Feedback -> FeedbackInbox"
  heading "Workouts"
  table "Date | Summary | Exercises" -> WorkoutDetail
    row "Sep 16 | Push day | 4"
    row "Sep 14 | 5k run | 1"
  button "Log Workout" primary -> LogWorkout

screen WorkoutDetail "A single workout's logged exercises"
  navbar "Gym Macro Tracker"
  sidebar "Dashboard -> TraineeDashboard | Food Log -> FoodLog | Workouts -> WorkoutLog | History -> WeeklyHistory | Coach -> CoachLinkScreen | Feedback -> FeedbackInbox"
  heading "Push Day — Sep 16"
  text "Notes: felt strong today"
  table "Exercise | Sets | Reps | Weight"
    row "Bench press | 4 | 8 | 60kg"
    row "Overhead press | 3 | 10 | 30kg"
  button "Back" -> WorkoutLog

screen WeeklyHistory "Nutrition and workout trends over the week"
  navbar "Gym Macro Tracker"
  sidebar "Dashboard -> TraineeDashboard | Food Log -> FoodLog | Workouts -> WorkoutLog | History -> WeeklyHistory | Coach -> CoachLinkScreen | Feedback -> FeedbackInbox"
  heading "This Week"
  chart "Calories vs target" 600x260
  chart "Workouts logged" 600x260

screen CoachLinkScreen "Manage the trainee's coach invite and link"
  navbar "Gym Macro Tracker"
  sidebar "Dashboard -> TraineeDashboard | Food Log -> FoodLog | Workouts -> WorkoutLog | History -> WeeklyHistory | Coach -> CoachLinkScreen | Feedback -> FeedbackInbox"
  heading "Coach"
  card "No coach linked yet"
    text "Generate an invite code and share it with your coach"
    button "Generate Invite" primary
  card "Linked Coach: Jane Doe"
    badge "Active" success
    button "Revoke Access" danger

screen FeedbackInbox "Feedback the trainee's coach has left"
  navbar "Gym Macro Tracker"
  sidebar "Dashboard -> TraineeDashboard | Food Log -> FoodLog | Workouts -> WorkoutLog | History -> WeeklyHistory | Coach -> CoachLinkScreen | Feedback -> FeedbackInbox"
  heading "Coach Feedback"
  list "Sep 16: Great push day, keep protein up on rest days. | Sep 12: Nice consistency this week!"

screen CoachTraineeList "The coach's linked trainees"
  navbar "Gym Macro Tracker"
  sidebar "Trainees -> CoachTraineeList"
  heading "My Trainees"
  card "Accept an invite"
    row
      input "Invite code"
      button "Accept" primary
  table "Trainee | Last Active" -> CoachTraineeDetail
    row "Alex Kim | Today"
    row "Sam Rivera | Yesterday"

screen CoachTraineeDetail "A linked trainee's progress and feedback"
  navbar "Gym Macro Tracker"
  sidebar "Trainees -> CoachTraineeList"
  heading "Alex Kim"
  row
    card "Calories | 1,450 / 2,200"
    card "Protein | 92g / 160g"
  table "Date | Food | Calories"
    row "Today 12:30 PM | Chicken salad | 420"
  table "Date | Workout"
    row "Sep 16 | Push day"
  card "Leave Feedback"
    textarea "Write feedback for Alex"
    button "Send Feedback" primary
  card "Feedback given"
    list "Sep 12: Nice consistency this week!"
  button "Back" -> CoachTraineeList

flow "Trainee tracks macros and workouts"
  role "Trainee"
  description "A Trainee logs meals and workouts and checks progress against targets"
  TraineeDashboard
  LogFood
  FoodLog
  LogWorkout
  WorkoutLog
  WorkoutDetail
  WeeklyHistory
  CoachLinkScreen
  FeedbackInbox

flow "Coach reviews trainees"
  role "Coach"
  description "A Coach accepts invites, reviews a trainee's progress, and leaves feedback"
  CoachTraineeList
  CoachTraineeDetail
