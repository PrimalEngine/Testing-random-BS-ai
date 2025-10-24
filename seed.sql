-- Insert demo user
INSERT OR IGNORE INTO users (id, username, email, display_name) VALUES 
  (1, 'demo_user', 'demo@mindtrack.app', 'Demo User');

-- Insert sample habits
INSERT OR IGNORE INTO habits (user_id, name, description, category, frequency, target_count, icon, color) VALUES 
  (1, 'Morning Meditation', '10 minutes of mindfulness', 'mindfulness', 'daily', 1, '🧘', '#8B5CF6'),
  (1, 'Drink Water', '8 glasses throughout the day', 'nutrition', 'daily', 8, '💧', '#3B82F6'),
  (1, 'Exercise', '30 minutes of physical activity', 'exercise', 'daily', 1, '🏃', '#EF4444'),
  (1, 'Reading', 'Read for 20 minutes', 'productivity', 'daily', 1, '📚', '#10B981'),
  (1, 'Gratitude Journal', 'Write 3 things I am grateful for', 'mindfulness', 'daily', 1, '✍️', '#F59E0B'),
  (1, 'Sleep 8 Hours', 'Get quality sleep', 'sleep', 'daily', 1, '😴', '#6366F1');

-- Insert some sample check-ins (last 7 days)
INSERT OR IGNORE INTO check_ins (habit_id, user_id, date, completed, mood) VALUES
  -- 3 days ago
  (1, 1, date('now', '-3 days'), 1, 'happy'),
  (2, 1, date('now', '-3 days'), 6, 'neutral'),
  (3, 1, date('now', '-3 days'), 1, 'energized'),
  (4, 1, date('now', '-3 days'), 1, 'happy'),
  
  -- 2 days ago
  (1, 1, date('now', '-2 days'), 1, 'happy'),
  (2, 1, date('now', '-2 days'), 7, 'neutral'),
  (3, 1, date('now', '-2 days'), 1, 'tired'),
  (5, 1, date('now', '-2 days'), 1, 'happy'),
  
  -- Yesterday
  (1, 1, date('now', '-1 days'), 1, 'happy'),
  (2, 1, date('now', '-1 days'), 8, 'energized'),
  (3, 1, date('now', '-1 days'), 1, 'energized'),
  (4, 1, date('now', '-1 days'), 1, 'happy'),
  (5, 1, date('now', '-1 days'), 1, 'happy');

-- Insert sample moods
INSERT OR IGNORE INTO moods (user_id, date, mood, energy_level, notes) VALUES
  (1, date('now', '-3 days'), 'happy', 4, 'Great day!'),
  (1, date('now', '-2 days'), 'neutral', 3, 'Regular day'),
  (1, date('now', '-1 days'), 'energized', 5, 'Feeling productive!');

-- Initialize streaks
INSERT OR IGNORE INTO streaks (habit_id, user_id, current_streak, longest_streak, last_completed) VALUES
  (1, 1, 3, 5, date('now', '-1 days')),
  (2, 1, 3, 7, date('now', '-1 days')),
  (3, 1, 3, 3, date('now', '-1 days')),
  (4, 1, 2, 4, date('now', '-1 days')),
  (5, 1, 2, 2, date('now', '-1 days')),
  (6, 1, 0, 1, date('now', '-5 days'));
