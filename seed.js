import fs from "fs";
import { db } from "./db.js";

async function runSeed() {
  try {
    await db.query(`DROP DATABASE IF EXISTS ${process.env.DB_NAME}`);
    await db.query(`CREATE DATABASE ${process.env.DB_NAME}`);
    await db.query(`USE ${process.env.DB_NAME}`);

    const sql = fs.readFileSync("seed.sql", "utf8");

    await db.query(sql);

    console.log("Seed executed successfully!");
    process.exit(0);
  } catch (err) {
    console.error("Seed error:", err);
    process.exit(1);
  }
}

runSeed();
