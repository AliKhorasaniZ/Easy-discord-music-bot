@echo off

rem Set up virtual environment
python -m venv bot-env
call "bot-env\Scripts\activate"

rem Install dependencies from requirements.txt
pip install -r requirements.txt

rem Moving the executables to the Scripts folder
copy "ffmpeg\ffmpeg.exe" "bot-env\Scripts"
copy "ffmpeg\ffplay.exe" "bot-env\Scripts"
copy "ffmpeg\ffprobe.exe" "bot-env\Scripts"

rem Deactivate virtual environment
call "bot-env\Scripts\deactivate"

rem Create .env file
(
    echo TOKEN=your_token_here
    echo PREFIX=prefix_here
    echo OWNERS_DISCORD_USERNAME=your_username_here
) >> .env

rem Echo setup completion message
echo "Setup completed."