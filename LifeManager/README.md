# Lifemanager.py Documentation

## Overview

Lifemanager.py is a skill-learning application designed to help users efficiently allocate their time to different skills, enhancing productivity through focused work and break intervals. Users can specify the amount of time they have available and the importance of each skill, and Lifemanager.py allocates time accordingly, incorporating work and break cycles.

## How to Use

1. **Music Setup:** Place your favorite songs in the static folder. These songs will be played during break times. The app automatically plays these songs when the break time ends.

2. **Adjust Options:**
   - `minimum`: Dictates the minimum time required for each task.
   - `importance`: Reflects the importance of each task, influencing the algorithm's time allocation decisions.
   - `names`: Specifies the skills you want to improve.

```python
minimum = {0: 15, 1: 10, 2: 40, 3: 10}
importance = {0: 3, 1: 4, 2: 14, 3: 3}
names = {0: "Marketing", 1: "Sale", 2: "Development", 3: "Project"} 
```

# Lifemanager.py Source Code Overview

## Overview

Lifemanager.py employs Python and the Pygame library for music playback. The source code includes functionalities for time allocation, work sessions, break times, and extra tasks.

## Functions

### `main()`

- Initializes the application, prompts the user for input, and initiates the primary functions.

### `play_mp3(file_path, time_stamps=None, rep=0)`

- Plays MP3 files specified by the file path.
- Supports optional time-stamped playback and repetition.

### `work(importance, names)`

- Manages the work cycle, prompting the user to start each task.
- Utilizes the Pygame library for music playback during work sessions.

### `timer(_minute)`

- Implements a countdown timer based on the specified minutes.
- Allows the user to stop the timer by holding the 's' key.

### `resting()`

- Initiates break times, allowing the user to determine the rest duration.
- Plays music during breaks and resumes work upon completion.

### `extra()`

- Checks if there are any additional tasks the user wants to add.
- Prompts the user for extra work time and initiates the task.

### `display(names, dict)`

- Displays the work schedule, showing allocated time for each skill.

### `missions(dict, minimum, user_time, names)`

- Guides the user in prioritizing skills based on perceived weaknesses.
- Adjusts the time allocation based on user preferences.

## Usage

1. Run the script.
2. Input the total available time.
3. Prioritize your skills based on your weakest areas.
4. Lifemanager.py allocates time for each skill.
5. Follow the prompts to start work sessions and breaks.

## Additional Information

- The `timestamps` dictionary contains specific timestamps for the background music during breaks.
- Music files for breaks are located in the "./static/music/break" folder.
- The menu music is located in the "./static/music/menu/menu.mp3" file.

**Note:** Make sure to install the required libraries before running the script# Requirements

To run the Lifemanager.py script, you'll need the following Python libraries. You can install them using the provided version information.

- [time](https://docs.python.org/3/library/time.html)
- [pygame](https://www.pygame.org/)
- [keyboard](https://github.com/boppreh/keyboard)
- [random](https://docs.python.org/3/library/random.html)
- [os](https://docs.python.org/3/library/os.html)
