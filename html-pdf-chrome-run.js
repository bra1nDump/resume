const htmlPdf = require("html-pdf-chrome");

const html = require("fs").readFileSync("Resume.html").toString();

const options = {
  port: 9222, // port Chrome is listening on
  printOptions: {
    printBackground: true,
    marginTop: 0,
    marginBottom: 0,
    marginLeft: 0,
    marginRight: 0,

    pageRanges: "1",
  },
};

htmlPdf
  .create(html, options)
  .then((pdf) => pdf.toFile("Kirill Dubovitskiy Resume.pdf"));
