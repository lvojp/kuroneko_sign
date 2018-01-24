var express = require('express');
var router = express.Router();
// var exec = require('child_process').exec;
const execSync = require('child_process').execSync;
const exec = require('child_process').exec;

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'クロネコ集荷依頼' });
    const exec = require('child_process').exec;
    exec('./ledopen.sh;', (err, stdout, stderr) => {
        if (err) { console.log(err);  }
        console.log(stdout);
    });
});

router.get('/ledon', function(req, res, next) {
  res.render('index', { title: 'クロネコ集荷依頼_ON' });
    const exec = require('child_process').exec;
    exec('./ledon.sh;', (err, stdout, stderr) => {
        if (err) { console.log(err);  }
        console.log(stdout);
    });
});

router.get('/ledoff', function(req, res, next) {
  res.render('index', { title: 'クロネコ集荷依頼_OFF' });
    const exec = require('child_process').exec;
    exec('./ledoff.sh', (err, stdout, stderr) => {
        if (err) { console.log(err);  }
        console.log(stdout);
    });
});

module.exports = router;
