const db = require('../db');

// GET all items
exports.getAllItems = async (req, res) => {
  try {
    const result = await db.query('SELECT * FROM items ORDER BY created_at DESC');
    res.json(result.rows);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

// POST create item
exports.createItem = async (req, res) => {
  const { name, category, group, unit } = req.body;
  try {
    const result = await db.query(
      'INSERT INTO items (name, category, "group", unit) VALUES ($1, $2, $3, $4) RETURNING *',
      [name, category, group, unit]
    );
    res.status(201).json(result.rows[0]);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

// DELETE item by ID
exports.deleteItem = async (req, res) => {
  const { id } = req.params;
  try {
    await db.query('DELETE FROM items WHERE id = $1', [id]);
    res.status(204).end();
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};
