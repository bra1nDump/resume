# Generate html for debugging
pandoc \
    --css style.css \
    --embed-resources \
    --template template.html \
    --to html --output Resume.html \
    Resume.md
    
# Copy file for GitHub pages deployment
cp Resume.html index.html

# Script started failing :(
# Error ERROR:devtools_http_handler.cc(636)] Using unsafe HTTP verb GET to invoke /json/new. This action will stop supporting GET and POST verbs in future versions.
# https://danielcompton.net/snippets/chrome-devtools-unsafe-http-verb
# Assuming I updated and the warning became an error.
# This is a known issue on chromium-remote-interface, but not addressed still.
# Solution - downgrade https://www.chromium.org/getting-involved/download-chromium/#downloading-old-builds-of-chrome-chromium
# Followup - create issue

# Found 103.0.5060.53
# Much easier to find https://chromiumdash.appspot.com/releases?platform=Android

# Generate PDF using html-pdf-chrome

# Migrating to Chromium 103, got it from https://commondatastorage.googleapis.com/chromium-browser-snapshots/index.html?prefix=Mac/1002907/
# Seems too late - the error still shows up :D 
# Trying 102.0.5005.167

## FUFUCCKCKCKC it was working the entire time .. just as I suspected ... I was looking at the wrong pdf file ...
## NEver mind :D This looks like it was a legitimate issue, at least for 108 it isn't working 

# /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome  \
/Applications/Chromium.app/Contents/MacOS/Chromium  \
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
