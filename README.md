# MindTrack - Personal Wellness & Habit Tracker 🧠

A personalized wellness tracker app that helps users track habits, moods, and goals with social motivation features.

## 🎯 Project Overview

**MindTrack** helps people build better daily habits and stay consistent with reminders, motivational messages, and social accountability.

### Main Features
- ✅ **Daily Habit Check-ins**: Track water intake, reading, exercise, meditation, and more
- 📅 **Calendar View**: Visualize streaks and progress over time
- 📊 **Trend Analysis**: View completion rates, category breakdowns, and daily trends
- 🔥 **Streak Rewards**: Stay motivated with current and longest streak tracking
- 💬 **Motivational Messages**: Get inspired with random encouraging messages
- 🎭 **Mood Tracking**: Log daily moods and energy levels
- 👥 **Social Motivation**: Share progress with friends (bonus feature)
- 📈 **Smart Analytics**: Weekly averages and most consistent habits

## 🌐 URLs

- **Development**: https://3000-icqbhe0f3634x0wvyqizk-d0b9e1e2.sandbox.novita.ai
- **Production**: (Deploy with `npm run deploy:prod`)
- **GitHub**: (Push to GitHub when ready)

## 🗄️ Data Architecture

### Database: Cloudflare D1 (SQLite)

**Data Models:**
- **users**: User accounts (id, username, email, display_name)
- **habits**: User habits (name, description, category, frequency, icon, color)
- **check_ins**: Daily habit completions (habit_id, date, completed, mood, notes)
- **streaks**: Streak tracking (current_streak, longest_streak, last_completed)
- **moods**: Daily mood logs (mood, energy_level, notes)
- **friendships**: Friend connections for social features
- **shared_progress**: Social sharing of achievements

**Categories:**
- 🧘 Mindfulness (meditation, journaling, gratitude)
- 🏃 Exercise (running, gym, yoga)
- 🥗 Nutrition (water intake, healthy eating)
- 📚 Productivity (reading, learning)
- 👥 Social (connecting with friends)
- 😴 Sleep (rest and recovery)

**Data Flow:**
1. User creates habits with custom icons, colors, and targets
2. Daily check-ins update completion status and calculate streaks
3. Streak algorithm: consecutive days increment streak, breaks reset to 1
4. Trends API aggregates data over 30-day periods
5. Social features allow sharing milestones with friends

## 📖 User Guide

### Getting Started
1. **Dashboard**: View all your habits and today's progress
2. **Add Habits**: Click "Add Habit" to create custom habits
   - Choose category, icon (emoji), and color
   - Set daily targets (e.g., 8 glasses of water)
3. **Check In**: Click "Check In" button when you complete a habit
4. **Track Streaks**: See your current streak 🔥 badge on each habit

### Views
- **Dashboard**: Daily habit checklist with quick stats
- **Calendar**: 30-day heatmap showing activity levels
- **Trends**: Analytics and insights on your progress
- **Social**: Share achievements and see friends' progress

### Mood Tracking
- Click "Update" on Today's Mood card
- Select emoji that represents your current mood
- Adjust energy level slider (1-5)
- Track mood patterns over time

### Tips for Success
- Start with 3-5 habits to avoid overwhelm
- Check in at the same time each day
- Celebrate small wins and streaks
- Share progress with friends for accountability

## 🚀 Deployment

### Platform
**Cloudflare Pages** with D1 Database

### Status
✅ **Active** - Running in development mode

### Tech Stack
- **Backend**: Hono (TypeScript) on Cloudflare Workers
- **Frontend**: Vanilla JavaScript + TailwindCSS
- **Database**: Cloudflare D1 (SQLite)
- **Charts**: Chart.js for visualizations
- **Icons**: Font Awesome 6.4.0
- **HTTP Client**: Axios

### Local Development
```bash
# Install dependencies
npm install

# Apply database migrations
npm run db:migrate:local

# Seed sample data
npm run db:seed

# Build the app
npm run build

# Start development server
pm2 start ecosystem.config.cjs

# Test the app
npm test
```

### Database Commands
```bash
# Reset database (clear all data)
npm run db:reset

# Run SQL queries locally
npm run db:console:local

# Apply migrations to production
npm run db:migrate:prod
```

### Production Deployment
```bash
# Build and deploy to Cloudflare Pages
npm run deploy:prod

# Note: First create D1 database in production:
# npx wrangler d1 create mindtrack-production
# Then update wrangler.jsonc with database_id
```

## 🎨 Features Implemented

### ✅ Core Features
- [x] User authentication foundation
- [x] CRUD operations for habits
- [x] Daily check-in system
- [x] Streak calculation algorithm
- [x] Calendar heatmap visualization
- [x] Trend analytics (30-day)
- [x] Category-based organization
- [x] Custom icons and colors
- [x] Motivational messages
- [x] Mood tracking

### ✅ Bonus Features
- [x] Friend connections (social foundation)
- [x] Progress sharing system
- [x] Energy level tracking
- [x] Multi-category analytics
- [x] Responsive design

### 🚧 Not Yet Implemented
- [ ] Browser push notifications/reminders
- [ ] AI-powered habit suggestions
- [ ] Export data (CSV/JSON)
- [ ] Habit templates library
- [ ] Gamification (badges, levels)
- [ ] Weekly/monthly reports via email

## 🔮 Recommended Next Steps

1. **Enhanced Reminders**
   - Implement browser notification API for daily reminders
   - Allow users to set preferred check-in times
   - Send streak reminder when close to breaking

2. **AI Habit Suggestions**
   - Integrate AI API to suggest habits based on user history
   - Analyze completion patterns to recommend optimal times
   - Suggest complementary habits (e.g., meditation + journaling)

3. **Gamification**
   - Add achievement badges (7-day, 30-day, 100-day streaks)
   - Create leaderboards for friend groups
   - Unlock new themes/icons as rewards

4. **Advanced Analytics**
   - Correlation analysis (mood vs. completion rate)
   - Predict streak breaks and send encouragement
   - Compare performance across weeks/months

5. **Social Features**
   - Group challenges (compete with friends)
   - Habit templates sharing
   - Accountability partners system

6. **Export & Integration**
   - Export data to CSV/PDF reports
   - Calendar integrations (Google Calendar, Apple Calendar)
   - Wearable device sync (Fitbit, Apple Watch)

## 📝 API Endpoints

### Habits
- `GET /api/habits?user_id=1` - Get all habits
- `POST /api/habits` - Create new habit
- `PUT /api/habits/:id` - Update habit
- `DELETE /api/habits/:id` - Delete habit (soft delete)

### Check-ins
- `GET /api/check-ins/today?user_id=1&date=2025-10-24` - Today's check-ins
- `GET /api/check-ins/range?user_id=1&start_date=...&end_date=...` - Date range
- `POST /api/check-ins` - Create/update check-in

### Analytics
- `GET /api/streaks?user_id=1` - Get all streaks
- `GET /api/trends?user_id=1&days=30` - Get trends and analytics

### Moods
- `GET /api/moods?user_id=1&days=30` - Get mood history
- `POST /api/moods` - Log mood entry

### Social
- `GET /api/friends?user_id=1` - Get friends list
- `GET /api/shared-progress?user_id=1` - Get shared updates
- `POST /api/share-progress` - Share achievement

## 🛠️ Development Notes

### Database Schema
The app uses **8 tables** with proper foreign keys and indexes:
- Soft delete for habits (active flag)
- Unique constraints on check-ins (habit_id, date)
- Automatic timestamp tracking
- Optimized queries with strategic indexes

### Streak Algorithm
- Consecutive daily completions increment streak
- Missing one day breaks streak (resets to 1 on next completion)
- Tracks both current and longest streaks
- Updates automatically on check-in

### Frontend Architecture
- **View Management**: Single-page app with view switching
- **State Management**: Global state for habits, check-ins, streaks
- **API Integration**: Axios for all backend communication
- **Responsive Design**: TailwindCSS utility-first approach
- **Animations**: Hover effects, streak flames, notifications

### Performance Optimizations
- Batch API calls on dashboard load
- Local state caching to minimize API requests
- Efficient SQL queries with joins
- Indexed database columns for fast lookups

## 📄 License

MIT License - Feel free to use and modify for personal or commercial projects.

---

**Last Updated**: 2025-10-24

Built with ❤️ using Cloudflare Pages + Hono + D1 Database
