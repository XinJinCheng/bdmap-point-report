var express = require('express');
var router = express.Router();

var service = require('../app/service');

router.post('/survaySubmit', function(req, res, next) {

  var surveySubmit = req.body;
  console.log(surveySubmit);

  var apiService = new service.ApiService();
  apiService.addSurveySubmit(surveySubmit);
  res.sendStatus(200);
});

router.get('/survaySubmit/findByName', function(req, res, next) {

  var apiService = new service.ApiService();
  var survaySubmit = apiService.querySurvaySubmitsByName(req.query.name);
  console.log(req.query);
  // res.sendStatus(200);
  res.send(JSON.stringify(survaySubmit));
});

module.exports = router;
