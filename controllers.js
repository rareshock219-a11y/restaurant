import { db } from "./db.js";

export async function searchDish(req, res) {
  try {
    const { name, minPrice, maxPrice } = req.query;

    if (!name || !minPrice || !maxPrice) {
      return res.status(400).json({ error: "Missing required fields" });
    }

    const query = `
      SELECT 
        r.id AS restaurantId,
        r.name AS restaurantName,
        r.city,
        m.name AS dishName,
        m.price AS dishPrice,
        COUNT(o.id) AS orderCount
      FROM orders o
      JOIN menu_items m ON o.menu_item_id = m.id
      JOIN restaurants r ON m.restaurant_id = r.id
      WHERE m.name LIKE ? 
        AND m.price BETWEEN ? AND ?
      GROUP BY r.id, m.id
      ORDER BY orderCount DESC
      LIMIT 10;
    `;

    const [rows] = await db.query(query, [`%${name}%`, minPrice, maxPrice]);

    res.json({ restaurants: rows });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
}
