const fs = require('fs');
const csv = require('csv-parser');
const db = require('../models'); // Assuming Sequelize

exports.importCSV = async (req, res) => {
  try {
    const results = [];
    const existing = await db.items.findAll();
    const existingNames = new Set(existing.map(i => i.name.toLowerCase()));

    fs.createReadStream(req.file.path)
      .pipe(csv())
      .on('data', (data) => {
        if (!existingNames.has(data.name.toLowerCase())) {
          results.push({
            name: data.name,
            group: data.group,
            category: data.category,
            unit: data.unit, // Match your DB field!
          });
        }
      })
      .on('end', async () => {
        try {
          await db.items.bulkCreate(results);
          res.status(200).json({ message: 'CSV Imported', added: results.length });
        } catch (err) {
          res.status(500).json({ message: err.message });
        }
      })
      .on('error', (err) => {
        res.status(500).json({ message: err.message });
      });
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

// GET all items (Sequelize)
exports.getAllItems = async (req, res) => {
  try {
    const items = await db.items.findAll({ order: [['created_at', 'DESC']] });
    res.json(items);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

// POST create item (Sequelize)
exports.createItem = async (req, res) => {
  const { name, category, group, unit } = req.body;
  try {
    const item = await db.items.create({ name, category, group, unit });
    res.status(201).json(item);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

// DELETE item by ID (Sequelize)
exports.deleteItem = async (req, res) => {
  const { id } = req.params;
  try {
    await db.items.destroy({ where: { id } });
    res.status(204).end();
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};
