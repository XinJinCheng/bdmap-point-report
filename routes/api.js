const express = require('express');
const router = express.Router();

const controller = require('../app/controller');
const service = require('../app/service');
const logger = service.getLogger('api.js');

router.post('/surveySubmit', function (req, res, next) {

  let apiService = new controller.ApiController();

  let surveySubmit = req.body;
  apiService.addSurveySubmit(surveySubmit)
  .then(function(feedback){
    res.status(200);
    res.json(feedback);
  })
  .catch(function(e){
    res.status(400);
    res.json(e);
  });
});

// router.put('/surveySubmit', function (req, res, next) {

//   let apiService = new controller.ApiController();

//   let surveySubmits = req.body;
//   apiService.addSurveySubmits(surveySubmits)
//   .then(function(feedback){
//     res.status(200);
//     res.json(feedback);
//   })
//   .catch(function(e){
//     res.status(400);
//     res.json(e);
//   });
// });

router.post('/surveySubmit/findByName', function (req, res, next) {

  let apiService = new controller.ApiController();
  
  let name = req.body.name

  apiService.querySurveySubmitsByName(name)
  .then(function(feedback){
    res.status(200);
    res.json(feedback);
  })
  .catch(function(e){
    res.status(400);
    res.json(e);
  });
});

router.post('/surveySubmit/findLatestN', function (req, res, next) {

  let apiService = new controller.ApiController();

  let count = req.body.count

  apiService.queryLatestSurveySubmits(count)
  .then(function(feedback){
    res.status(200);
    res.json(feedback);
  })
  .catch(function(e){
    res.status(400);
    res.json(e);
  });
});

module.exports = router;