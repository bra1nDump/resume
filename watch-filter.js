var watch = require("watch");

export default function filter(monitor) {
  monitor.files["/home/mikeal/.zshrc"]; // Stat object for my zshrc.
  monitor.on("created", function (f, stat) {
    // Handle new files
  });
  monitor.on("changed", function (f, curr, prev) {
    // Handle file changes
  });
}
