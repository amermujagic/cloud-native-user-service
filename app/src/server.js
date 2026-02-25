const express = require("express");
const userRoutes = require("./routes/users");

const app = express();

const PORT = process.env.PORT || 3000;
const APP_ENV = process.env.APP_ENV || "development";
const DB_PASSWORD = process.env.DB_PASSWORD || "not-set";

app.use(express.json());

app.get("/", (req, res) => {
  res.json({
    message: "User Service Running v3",
    environment: APP_ENV,
    dbPasswordConfigured: DB_PASSWORD !== "not-set"
  });
});

app.get("/health", (req, res) => {
  res.status(200).json({ status: "UP" });
});

app.use("/users", userRoutes);

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT} in ${APP_ENV} mode`);
});