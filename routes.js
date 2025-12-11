import express from "express";
import { searchDish } from "./controllers.js";

const router = express.Router();

router.get("/search/dishes", searchDish);

export default router;
