var express = require('express');
var router = express.Router();
// var exec = require('child_process').exec;
const execSync = require('child_process').execSync;
const exec = require('child_process').exec;

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'クロネコ集荷依頼'});
});

router.get('/ledon', function(req, res, next) {
  var rf = req.get('Referrer');
  if(rf === undefined){
    rf = "led"
  }
  
  if (rf.indexOf("led") === -1){
    console.log("yosi");
    res.render('index', { title: 'クロネコ集荷依頼' });
      const exec = require('child_process').exec;
      exec('./on_led.sh;', (err, stdout, stderr) => {
          if (err) { console.log(err);  }
          console.log(stdout);
    });
  }else{
    res.render('index', { title: '不正な処理 > トップに戻る' });
  }

});

router.get('/ledoff', function(req, res, next) {
  var rf = req.get('Referrer');
  if(rf === undefined){
    rf = "led"
  }

  if (rf.indexOf("led") === -1){
    console.log("yosi");
    res.render('index', { title: 'クロネコ集荷依頼' });
      const exec = require('child_process').exec;
      exec('./wait_led.sh', (err, stdout, stderr) => {
          if (err) { console.log(err);  }
          console.log(stdout);
    });
  }else{
    res.render('index', { title: '不正な処理 > トップに戻る' });
  }

});

module.exports = router;
