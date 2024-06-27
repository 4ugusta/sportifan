"use strict";
const express = require("express");
const cors = require("cors");
const bodyParser = require("body-parser");
const config = require("./config");
const venueRoutes = require("./routes/venue-routes");
const profileRoutes = require("./routes/profile-routes");
const teamRoutes = require("./routes/team-routes");
const app = express();

app.use(express.json());
app.use(cors());
app.use(bodyParser.json());

app.use("/api", venueRoutes.routes, profileRoutes.routes, teamRoutes.routes);

app.listen(config.port, () =>
  console.log("App is listening on url http://192.168.73.143:" + config.port)
);
