Create Flutter project following flutter MVVM pattern:
	Use clearly defined data and UI layers
	Use the repository pattern in the data layer	  
	
	MVVM (Model-View-ViewModel) architectural pattern
	Use ChangeNotifiers and Listenables to handle widget updates
	
	implementing `go_router` for navigation
	using `Provider` for DI only  
	Use unidirectional data flow
	Use immutable data models
	Use Commands to handle events from user interaction


The project chewing_simulator specification:
UI requirements:
🖥️ MAIN SCREEN (Dashboard)
This is what appears when the device starts.
🔹 Top Status Bar
• System Status: 🟢 Ready / 🔵 Running / 🔴 Error
• Current Mode: Thermocycle / 37°C Hold
• Current Temperature(s)
• Current Cycle Number
• Emergency Stop icon

📂 Main Tabs (Top or Left Side)
1️⃣ Home
Displays:
• Live temperature (Cold bath, Hot bath, or Chamber)
• Active cycle number (thermal cycles) 
• Remaining time
• Progress bar
• Start / Pause / Stop buttons

2️⃣ Thermocycling Setup
This is the most important configuration tab.
Adjustable Parameters Section:
🔹 Temperature Settings
• Cold Bath Temperature (Default: 5°C)
• Hot Bath Temperature (Default: 55°C)
• Temperature Tolerance (±1–2°C)
🔹 Timing Settings
• Dwell Time (seconds)  30 seconds
• Transfer Time (seconds)  10 seconds
• Draining Time (if applicable)
🔹 Cycle Settings
• Number of Cycles
• Total Estimated Time (auto-calculated)
Buttons:
• ✔ Save Program
• ▶ Start Run
• 🔄 Reset to Default
• 💾 Load Saved Program

3️⃣ 37°C Constant Mode
For storage or baseline testing.
Adjustable:
• Target Temperature (Default: 37°C)
• Duration (hours/minutes OR infinite hold)
Display:
• Current temperature graph
• Stability indicator (± 2 deviation)
Buttons:
• Start
• Stop
• Timer On/Off

OPTIONAL Advanced features 
4️⃣ Chewing Simulator Sync (Optional )
If connected to  SD Mechatronik:
Options:
• External Trigger ON/OFF
• Start thermocycle with chewing load
• Pause if chewing stops
• Cycle-per-load ratio setting
Example:
• 1 thermocycle per 1000 chewing cycles

5️⃣ Monitoring Tab
Live graphs:
• Temperature vs Time
• Cycle Counter
• Error log
• Alarm history
Indicators:
• Over-temperature alert
• Sensor failure
• Water level warning

6️⃣ Settings (Admin)
• Calibration
• Sensor check
• Temperature offset adjustment
• Language
• Date & Time
• User login levels
• Data export (USB)

🔘 Essential Buttons (Physical + GUI)
On Screen:
• Start
• Pause
• Stop
• Emergency Stop
• Save Program
• Load Program
• Export Data
Physical (recommended):
• Emergency Stop (mandatory for lab safety)
• Power Switch

• Preset buttons:
o “ISO Standard 5–55°C / 10,000 cycles”
o “37°C Storage Mode”
• Auto temperature stabilization before counting cycles
• Warning if temperature not reached before dwell timer starts




📊 Example Basic Layout
Home Screen Layout:

| Status: RUNNING |
| Cold: 5.1°C Hot: 54.8°C |
| Cycle: 235 / 5000 |
| Progress: ████████░░ 47% |
| Remaining Time: 12h 15m |
| |
| [Start] [Pause] [Stop] |

⚙️ Minimum Parameters Required for Proper Operation
 allow adjustment of:
1. Cold temperature
2. Hot temperature
3. Dwell time
4. Transfer time
5. Number of cycles
6. 37°C constant mode
7. Temperature tolerance
8. Safety cut-off limits

