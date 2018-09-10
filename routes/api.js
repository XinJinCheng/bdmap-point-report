let express = require('express');
let router = express.Router();

let service = require('../app/service');

router.post('/surveySubmit', function(req, res, next) {

  let surveySubmit = req.body;
  let apiService = new service.ApiService();
  let ret = apiService.addSurveySubmit(surveySubmit);
  res.send(ret);
});

router.get('/surveySubmit/findByName', function(req, res, next) {

  let apiService = new service.ApiService();
  let surveySubmit = apiService.querySurvaySubmitsByName(req.query.name);
  res.send(JSON.stringify(surveySubmit));
});

module.exports = router;
