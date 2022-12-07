var watch = require("watch");

export default function filter(file) {
  return /\.css/.test(file) || /\.html/.test(file) || /\.md/.test(file);
}
