# Generate html for debugging
pandoc \
    --css style.css \
    --embed-resources \
    --template template.html \
    --to html --output Resume.html \
    Resume.md

# Generate PDF using html-pdf-chrome
/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome  \
    --headless \
    --disable-gpu \
    --disable-translate \
    --disable-extensions \
    --disable-background-networking \
    --safebrowsing-disable-auto-update \
    --disable-sync \
    --metrics-recording-only \
    --disable-default-apps \
    --no-first-run \
    --mute-audio \
    --hide-scrollbars \
    --remote-debugging-port=9222 &
CHROME_PID=$!

# It takes some time for chrome to start
sleep 1

node html-pdf-chrome-run.js # Outputs in Resume.pdf

# Likely unnecessary.
# Probably once the terminal is killed all children should be killed.
kill $CHROME_PID
