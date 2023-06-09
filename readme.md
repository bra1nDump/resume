# Create a pdf resume from markdown
I created a custom resume using markdown and css. I used [pandoc](https://pandoc.org/) to convert the markdown to html and then used [chrome headless](https://developers.google.com/web/updates/2017/04/headless-chrome) to convert the html to pdf.

# How to build the resume

### Assumes
- You are using a Mac
- Node.js is installed
- Chrome is installed
- Homebrew is installed

```bash
brew install pandoc
npm install

# Continiously build the resume 
# as you make changes to .md or .css files
# runs ./build.sh script
# which runs pandoc + chrome headless + html-pdf-chrome
npm run watch
```

# How to make changes
- Edit the `resume.md` file
  - It has a mix of html and markdown
- Edit the `style.css` to change the look
- Custom fonts - I am currently using MartianGrotesk font. But you can use any font, just add it to the root of the project and update the `style.css` file
- You want to rename the final output .pdf file name make your changes in html-pdf-chrome-run.js
