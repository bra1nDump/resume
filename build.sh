pandoc \
    --css style.css \
    --embed-resources \
    --template template.html \
    --to html --output Resume.html \
    Resume.md
    
# Copy file for GitHub pages deployment (not currently in use)
cp Resume.html index.html

# Start Chrome in headless mode that will be used by html-pdf-chrome-run.js
# After this was fixed we don't need chromium anymore https://github.com/westy92/html-pdf-chrome/issues/359
if [ "$1" = "--chromium" ]; then
    echo "Using Chromium"
    alias chrome="/Applications/Chromium.app/Contents/MacOS/Chromium"
else
    echo "Using Chrome"
    alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
fi

chrome \
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
