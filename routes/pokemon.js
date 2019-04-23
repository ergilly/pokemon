var express = require('express');
var router = express.Router();
const SqlRunner = require('../db/sql_runner.js');

// GET users listing. READ
router.get('/', function(req, res, next) {
  SqlRunner.run("SELECT * FROM pokemon ORDER BY id ASC").then(
    result => {
      res.status(200).json(result.rows);
    });
});

// Make new pokemon. CREATE
router.post('/', function(req, res) {
  SqlRunner.run("INSERT INTO pokemon (name, types, height, weight) VALUES ($1, $2, $3, $4)", [req.body.name, req.body.types, req.body.height, req.body.weight]).then(result => {
    res.status(201).json(result);
  });
});

// GET a single pokemon. READ
router.get('/:id', function(req, res) {
  SqlRunner.run("SELECT * FROM pokemon WHERE id = $1", [req.params.id]).then(
    result => {
      res.status(200).json(result.rows);
    });
});

// update pokemon information. UPDATE
router.put('/:id', function(req, res) {
  SqlRunner.run("UPDATE pokemon SET name = $1, types = $2, height = $3, weight = $4 WHERE id = $5", [req.body.name, req.body.types, req.body.height, req.body.weight, req.params.id]).then(result => {
    res.status(201).json(result);
  });
});

// remove a pokemon. DELETE
router.delete('/:id', function(req, res) {
  SqlRunner.run("DELETE FROM pokemon WHERE id = $1", [req.params.id]).then(
    result => {
      res.status(201).json(result);
    });
});

module.exports = router;
